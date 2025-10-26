import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PostgreConnection {
    private static PostgreConnection instance;
    private Connection conn;
    private final String usuario = "postgres";
    private final String clave = "abc123";
    private final String url = "jdbc:postgresql://localhost:5432/hospital_postgre";

    private PostgreConnection() {
        try {
            conn = DriverManager.getConnection(url, usuario, clave);
        } catch (SQLException e) {
            System.out.println("Error al conectar con la base de datos: " + e.getMessage());
        }
    }

    public static PostgreConnection getInstance() {
        if (instance == null) {
            instance = new PostgreConnection();
        }
        return instance;
    }

    public void setAutoCommit(boolean estado) {
        try {
            conn.setAutoCommit(estado);
        } catch (SQLException e) {
            System.out.println("Fallo en autocomit: " + e.getMessage());
        }
    }

    public void commit() throws SQLException {
        conn.commit();
    }

    public void rollback() {
        try {
            conn.rollback();
        } catch (SQLException e) {
            System.out.println("ERROR al hacer ROLLBACK en Postgres: " + e.getMessage());
        }
    }

    public void close() {
        try {
            conn.close();
            System.out.println("Conexión PostgreSQL cerrada.");
        } catch (SQLException e) {
            System.out.println("Error al cerrar Postgre: " + e.getMessage());
        }
    }

    public void crearEspecialidad(String nombreEspecialidad) {
        final String sql = """
                insert into hospital.especialidades (nombre_especialidad)
                values (?)
                """;
        try (var ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setString(1, nombreEspecialidad);
            int filas = ps.executeUpdate();
            if (filas > 0) {
                try (var rs = ps.getGeneratedKeys()) {
                    if (rs.next()) {
                        int id = rs.getInt(1);
                        System.out.println("Especialidad creada con id: " + id);
                    }
                }

            }
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
    }

    public void crearMedico(String nombreMedico, String nif, int telefono, String email) {
        final String sql = """
                 INSERT INTO hospital.medicos (nombre_medico, contacto)
                 VALUES (?, ROW(?, ?, ?, ?))
                """;
        try (var ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setString(1, "Dr/a. " + nombreMedico);
            ps.setString(2, nombreMedico);
            ps.setString(3, nif);
            ps.setInt(4, telefono);
            ps.setString(5, email);
            int filas = ps.executeUpdate();
            if (filas > 0) {
                try (var rs = ps.getGeneratedKeys()) {
                    if (rs.next()) {
                        int id = rs.getInt(1);
                        System.out.println("Medico cargado correctamente con id: " + id);
                    }
                }
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }

    }

    public void eliminarMedico(int id) {
        final String sql = """
                DELETE FROM hospital.medicos WHERE id_medico = ?
                """;
        try (var ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            int filas = ps.executeUpdate();
            if (filas > 0) {
                System.out.println("Medico eliminado correctamente");
            } else {
                System.out.println("No se encontro ningun medico con id: " + id);
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
    }

    public void obtenerCantidadTratamientosPorSala() {
        final String sql = """
                SELECT hospital.salas.nombre_sala,
                COUNT(hospital.salas_tratamientos.id_tratamiento) AS total_tratamientos
                FROM hospital.salas LEFT JOIN hospital.salas_tratamientos
                ON hospital.salas.id_sala = hospital.salas_tratamientos.id_sala
                GROUP BY hospital.salas.nombre_sala;
                """;
        try (var ps = conn.prepareStatement(sql)) {
            try (ResultSet rs = ps.executeQuery()) {
                System.out.println("Nombre Sala\t\t\tCantidad Tratamientos");
                System.out.println("-------------------------------------");
                while (rs.next()) {
                    String nombre = rs.getString("nombre_sala");
                    int totalTratamientos = rs.getInt("total_tratamientos");
                    System.out.println(nombre + "\t\t" + totalTratamientos);
                }
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
    }

    public int getEspecialidadId(String nombreEspecialidad) throws SQLException {
        final String sql = """
                SELECT id_especialidad
                FROM hospital.especialidades
                WHERE nombre_especialidad = ?""";

        try (var ps = conn.prepareStatement(sql)) {
            ps.setString(1, nombreEspecialidad);
            try (var rs = ps.executeQuery()) {
                if (rs.next()) return rs.getInt("id_especialidad");
                else throw new IllegalStateException("Especilidad no encontrada.");
            }

        }
    }

    public int getIdMedico(String nifMedico) throws SQLException {
        final String sql = """
                SELECT id_medico
                FROM hospital.medicos
                WHERE (contacto).nif = ?;
                """;

        try (var ps = conn.prepareStatement(sql)) {
            ps.setString(1, nifMedico);
            try (var rs = ps.executeQuery()) {
                if (rs.next()) return rs.getInt("id_medico");
                else throw new IllegalStateException("Medico no encontrado.");
            }
        }
    }

    public void addTratamiento(int idTratamiento, int idMedico, int idEspecialidad) throws SQLException {
        final String sql = """
                INSERT INTO hospital.tratamientos
                (id_tratamiento, id_medico, id_especialidad)
                VALUES (?,?,?)
                """;
        try (var ps = conn.prepareStatement(sql)) {
            ps.setInt(1, idTratamiento);
            ps.setInt(2, idMedico);
            ps.setInt(3, idEspecialidad);
            ps.executeUpdate();
        }

    }

    public void deleteTratamienot(int idEliminar) throws SQLException {
        final String sql = """
                DELETE FROM hospital.tratamientos
                WHERE id_tratamiento = ?
                """;
        try (var ps2 = conn.prepareStatement(sql)) {
            ps2.setInt(1, idEliminar);
            int borrado = ps2.executeUpdate();
            if (borrado == 0) {
                throw new SQLException("Error al borrar en PostgreSql");
            }
        }
    }

    public ArrayList<TratamientoInfo> getIdTratamientosEspecialidad() throws SQLException {
        ArrayList<TratamientoInfo> lista = new ArrayList<>();
        final String sql = """
                SELECT t.id_tratamiento, t.id_medico, t.id_especialidad,
                       m.nombre_medico, e.nombre_especialidad
                FROM hospital.tratamientos t
                LEFT JOIN hospital.medicos m ON m.id_medico = t.id_medico
                LEFT JOIN hospital.especialidades e ON e.id_especialidad = t.id_especialidad
                ORDER BY t.id_tratamiento
                """;

        try (var ps = conn.prepareStatement(sql);
             var rs = ps.executeQuery()) {
            while (rs.next()) {
                lista.add(new TratamientoInfo(
                        rs.getInt("id_tratamiento"),
                        rs.getInt("id_medico"),
                        rs.getInt("id_especialidad"),
                        rs.getString("nombre_medico"),
                        rs.getString("nombre_especialidad")
                ));
            }
        }
        return lista;
    }

    public String getNombreEspecialidad(int idEspecialidad) throws SQLException {
        final String sql = """
                SELECT e.nombre_especialidad
                FROM hospital.especialidades e
                WHERE e.id_especialidad = ?;
                """;

        try (var ps = conn.prepareStatement(sql)) {
            ps.setInt(1, idEspecialidad);
            try (var rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("nombre_especialidad");
                } else throw new IllegalStateException("Id Especialidad invalida");
            }
        }

    }


}

