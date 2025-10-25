import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@SuppressWarnings("resource")
public final class DualConnection {

    private static DualConnection instancia;

    private DualConnection() {
    }

    public static synchronized DualConnection getDualInstance() {
        if (instancia == null) instancia = new DualConnection();
        return instancia;
    }

    private static Connection mysql() {
        return MySqlConnection.getSqlInstance();
    }

    private static Connection postgres() {
        return PostgreConnection.getPostgreInstance();
    }

    public void begin() throws SQLException {
        Connection cMy = mysql();
        Connection cPg = postgres();
        if (cMy == null || cPg == null) {
            System.out.println("ERROR: Las conexiones MySQL/PostgreSQL no están inicializadas.");
            return;
        }
        cMy.setAutoCommit(false);
        cPg.setAutoCommit(false);
        System.out.println("Transacción iniciada en MySQL y PostgreSQL (autocommit desactivado).");
    }

    public void commitBoth() throws SQLException {
        SQLException mysqlError = null;
        try {
            mysql().commit();
        } catch (SQLException e) {
            mysqlError = e;
            System.out.println("ERROR al hacer COMMIT en MySQL: " + e.getMessage());
        }
        SQLException pgError = null;
        try {
            postgres().commit();
        } catch (SQLException e) {
            pgError = e;
            System.out.println("ERROR al hacer COMMIT en PostgreSQL: " + e.getMessage());
        }
        try {
            mysql().setAutoCommit(true);
        } catch (SQLException e) {
            System.out.println("No se pudo restaurar autocommit en MySQL: " + e.getMessage());
        }
        try {
            postgres().setAutoCommit(true);
        } catch (SQLException e) {
            System.out.println("No se pudo restaurar autocommit en PostgreSQL: " + e.getMessage());
        }
        if (mysqlError != null || pgError != null) {
            // Prioridad: si falló PG, lanzo ese; si no, lanzo el de MySQL
            if (pgError != null) throw pgError;
            throw mysqlError;
        }
    }

    public void rollbackBoth() {
        try {
            mysql().rollback();
        } catch (SQLException e) {
            System.out.println("ERROR al hacer ROLLBACK en MySQL: " + e.getMessage());
        }
        try {
            postgres().rollback();
        } catch (SQLException e) {
            System.out.println("ERROR al hacer ROLLBACK en PostgreSQL: " + e.getMessage());
        }
        try {
            mysql().setAutoCommit(true);
        } catch (SQLException e) {
            System.out.println("No se pudo restaurar autocommit en MySQL: " + e.getMessage());
        }
        try {
            postgres().setAutoCommit(true);
        } catch (SQLException e) {
            System.out.println("No se pudo restaurar autocommit en PostgreSQL: " + e.getMessage());
        }
    }

    public void close() {
        try {
            MySqlConnection.getSqlInstance().close();
            System.out.println("Conexión MySQL cerrada.");
        } catch (SQLException e) {
            System.out.println("Error al cerrar MySQL: " + e.getMessage());
        }

        try {
            PostgreConnection.getPostgreInstance().close();
            System.out.println("Conexión PostgreSQL cerrada.");
        } catch (SQLException e) {
            System.out.println("Error al cerrar PostgreSQL: " + e.getMessage());
        }

        instancia = null;
    }

    public void crearTratamiento(String nombre, String descripcion, String nombreEspecialidad, String nifMedico) {
        int idEspecialidad = 0;
        int idMedico = 0;
        try {
            final String query1 = "SELECT id_especialidad " + "FROM hospital.especialidades " + "WHERE nombre_especialidad = ?";
            final String query2 = "SELECT id_medico " + "FROM hospital.medicos " + "WHERE (contacto).nif = ?";

            try (var ps = postgres().prepareStatement(query1)) {
                ps.setString(1, nombreEspecialidad);
                try (var rs = ps.executeQuery()) {
                    if (rs.next()) idEspecialidad = rs.getInt("id_especialidad");
                }

            }
            try (var ps = postgres().prepareStatement(query2)) {
                ps.setString(1, nifMedico);
                try (var rs = ps.executeQuery()) {
                    if (rs.next()) idMedico = rs.getInt("id_medico");
                }
            }
            if (idEspecialidad == 0) {
                System.out.println("Especialidad no encontrada");
                return;
            }
            if (idMedico == 0) {
                System.out.println("Medico no encontrado");
                return;
            }

            begin();

            int idNuevoTrat = 0;
            final String query3 = "INSERT INTO tratamientos" + "(nombre_tratamiento, descripcion) " + "VALUES (?, ?)";
            final String query4 = "INSERT INTO hospital.tratamientos " + "(id_tratamiento, id_medico, id_especialidad)" + " VALUES (?,?,?)";

            int aux;
            try (var ps = mysql().prepareStatement(query3, Statement.RETURN_GENERATED_KEYS)) {
                ps.setString(1, nombre);
                ps.setString(2, descripcion);
                aux = ps.executeUpdate();
                try (var rs = ps.getGeneratedKeys()) {
                    if (rs.next()) idNuevoTrat = rs.getInt(1);
                }
            }
            if (idNuevoTrat == 0 && aux > 0) throw new SQLException("No se obtuvo ID generado en MySQL");
            System.out.println("SE AGREGÓ TRATAMIENTO EN MYSQL (id=" + idNuevoTrat + ")");


            try (var ps = postgres().prepareStatement(query4)) {
                ps.setInt(1, idNuevoTrat);
                ps.setInt(2, idMedico);
                ps.setInt(3, idEspecialidad);
                ps.executeUpdate();
            }
            commitBoth();
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
            rollbackBoth();
        }
    }

    public void eliminarTratamientoPorNombre(String nombre) {
        final String query1 = """ 
                SELECT id_tratamiento
                FROM tratamientos
                WHERE nombre_tratamiento = ?
                """;
        int idEliminar = 0;

        try (var ps = mysql().prepareStatement(query1)) {
            ps.setString(1, nombre);
            try (var rs = ps.executeQuery()) {
                if (rs.next()) {
                    idEliminar = rs.getInt("id_tratamiento");
                    if (idEliminar == 0) {
                        System.out.println("Tratamiento no encontrado.");
                        return;
                    }
                }
                begin();

                final String query2 = """
                        DELETE FROM hospital.tratamientos
                        WHERE id_tratamiento = ?
                        """;
                final String query3 = """
                        DELETE FROM hostratamientos
                        WHERE id_tratamiento = ?
                        """;
                try (var ps2 = postgres().prepareStatement(query2)) {
                    ps2.setInt(1, idEliminar);
                    int borrado = ps2.executeUpdate();
                    if (borrado == 0) {
                        throw new SQLException("Error al borrar en PostgreSql");
                    }
                }
                try (var ps3 = mysql().prepareStatement(query3)) {
                    ps3.setInt(1, idEliminar);
                    ps3.executeUpdate();
                    int borrado2 = ps3.executeUpdate();
                    if (borrado2 == 0) {
                        throw new SQLException("Error al borrar en MySql.");
                    }
                }

            }
            commitBoth();
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
            rollbackBoth();
        }
        System.out.println("Tratamiento borrado satisfactoriamente.");
    }

    public void listarTratamientosConEspecialidadYMedico() {
        final String query = """
                SELECT t.id_tratamiento, t.id_medico, t.id_especialidad, m.nombre_medico, e.nombre_especialidad
                FROM hospital.tratamientos t
                LEFT JOIN hospital.medicos m        ON m.id_medico = t.id_medico
                LEFT JOIN hospital.especialidades e ON e.id_especialidad = t.id_especialidad
                ORDER BY t.id_tratamiento
                """;

        final String query1 = """
                SELECT nombre_tratamiento, descripcion
                FROM tratamientos
                WHERE id_tratamiento = ?
                """;
        List<TratamientoInfo> lista = new ArrayList<>();

        try (var ps1 = postgres().prepareStatement(query);
             var rs1 = ps1.executeQuery();
             var ps2 = mysql().prepareStatement(query1)) {
            while (rs1.next()) {
                int id_tratamiento = rs1.getInt("id_tratamiento");
                int id_medico = rs1.getInt("id_medico");
                int id_especialidad = rs1.getInt("id_especialidad");
                String nombreMedico = rs1.getString("nombre_medico");
                String nombreEspecialidad = rs1.getString("nombre_especialidad");


                ps2.setInt(1, id_tratamiento);
                try (var rs2 = ps2.executeQuery()) {
                    String nombreTratamiento = null;
                    String descripcion = null;
                    if (rs2.next()) {
                        nombreTratamiento = rs2.getString("nombre_tratamiento");
                        descripcion = rs2.getString("descripcion");
                    }

                    lista.add(new TratamientoInfo(id_tratamiento, id_medico, id_especialidad,
                            nombreMedico, nombreEspecialidad, nombreTratamiento, descripcion));
                }


            }
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        System.out.println("####### LISTA DE TRATAMIENTOS #########");
        if (lista.isEmpty()) {
            System.out.println("(vacia)");
        } else {
            for (TratamientoInfo tratamiento : lista) {
                System.out.println(tratamiento);
            }
        }
    }

    public void obtenerPacientesPorEspecialidad(int idEspecialidad) {
        // 1) Consulto en PostgreSQL el nombre de la especialidad
        final String query = """
        SELECT e.nombre_especialidad
        FROM hospital.especialidades e
        WHERE e.id_especialidad = ?;
        """;

        String nombreEspecialidad = null;

        try (var ps = postgres().prepareStatement(query)) {
            ps.setInt(1, idEspecialidad);
            try (var rs = ps.executeQuery()) {
                if (rs.next()) {
                    nombreEspecialidad = rs.getString("nombre_especialidad");
                }
            }
        } catch (SQLException e) {
            System.out.println("Error PostgreSQL: " + e.getMessage());
            return;
        }

        if (nombreEspecialidad == null) {
            System.out.println("No existe esa especialidad con id " + idEspecialidad);
            return;
        }

        // 2) Consulto en MySQL los pacientes asociados a tratamientos con esa especialidad
        final String query1 = """
        SELECT p.id_paciente,
               p.nombre AS nombre_paciente,
               t.nombre_tratamiento
        FROM pacientes p
        JOIN pacientes_tratamientos pt ON pt.id_paciente = p.id_paciente
        JOIN tratamientos t ON t.id_tratamiento = pt.id_tratamiento
        WHERE t.id_especialidad = ?
        ORDER BY p.id_paciente, t.nombre_tratamiento;
        """;

        System.out.println("#### Pacientes de la especialidad: " + nombreEspecialidad + " ####");

        try (var ps1 = mysql().prepareStatement(query1)) {
            ps1.setInt(1, idEspecialidad);
            try (var rs1 = ps1.executeQuery()) {
                boolean hayResultados = false;
                while (rs1.next()) {
                    hayResultados = true;
                    int idPaciente = rs1.getInt("id_paciente");
                    String nombrePaciente = rs1.getString("nombre_paciente");
                    String nombreTratamiento = rs1.getString("nombre_tratamiento");

                    System.out.printf("Paciente %d: %s — Tratamiento: %s%n",
                            idPaciente, nombrePaciente, nombreTratamiento);
                }

                if (!hayResultados) {
                    System.out.println("No hay pacientes asociados a esta especialidad.");
                }
            }
        } catch (SQLException e) {
            System.out.println("Error MySQL: " + e.getMessage());
        }
    }


}
