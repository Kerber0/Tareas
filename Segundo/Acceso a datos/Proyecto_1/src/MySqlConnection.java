import javax.swing.plaf.PanelUI;
import java.security.PublicKey;
import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class MySqlConnection {
    private static MySqlConnection instance;
    private Connection conn;
    private final String usuario = "root";
    private final String clave = "abc123";
    private final String url = "jdbc:mysql://localhost:3306/hospital_mysql";

    private MySqlConnection() {
        try {
            conn = DriverManager.getConnection(url, usuario, clave);
        } catch (SQLException e) {
            System.out.println("Error al conectar a MySQL: " + e.getMessage());
        }
    }

    public static MySqlConnection getInstance() {
        if (instance == null) {
            instance = new MySqlConnection();
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
            System.out.println("ERROR al hacer ROLLBACK en MySQL: " + e.getMessage());
        }
    }

    public void close() {
        try {
            conn.close();
            System.out.println("Conexión MySQL cerrada.");
        } catch (SQLException e) {
            System.out.println("Error al cerrar MySql: " + e.getMessage());
        }
    }

    public void crearPaciente(String nombre, String email, LocalDate fechaNacimiento) {
        final String sql = """
                INSERT INTO pacientes(nombre, email, fecha_nacimiento)
                VALUES (?, ?, ?)""";
        try (var ps = conn.prepareStatement(sql, java.sql.Statement.RETURN_GENERATED_KEYS)) {
            ps.setString(1, nombre);
            ps.setString(2, email);
            ps.setDate(3, java.sql.Date.valueOf(fechaNacimiento));
            int filas = ps.executeUpdate();
            if (filas > 0) {
                try (var rs = ps.getGeneratedKeys()) {
                    if (rs.next()) {
                        int id = rs.getInt(1);
                        System.out.println("Paciente creado con exito. ID asignado: " + id);
                    }
                }
            }
        } catch (SQLException e) {
            System.out.println("Fallo al cargar el paciente: " + e.getMessage());
        }


    }

    public void eliminarPaciente(int id) {
        final String sql = """
                DELETE FROM pacientes
                WHERE id_paciente = ?""";
        try (var ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            int filas = ps.executeUpdate();
            if (filas > 0) {
                System.out.println("Paciente con id: " + id + " ha sido eliminado correctamente.");
            } else {
                System.out.println("No existe un paciente con id: " + id);
            }
        } catch (SQLException e) {
            System.out.println("Error al conectarse a la base de datos: " + e.getMessage());
        }
    }

    public void listarTratamientosConPocosPacientes(int cantidad) {
        final String sql = """
            SELECT t.nombre_tratamiento,
                   COUNT(pt.id_paciente) AS total_pacientes
            FROM tratamientos t
            LEFT JOIN pacientes_tratamientos pt
              ON t.id_tratamiento = pt.id_tratamiento
            GROUP BY t.nombre_tratamiento
            HAVING COUNT(pt.id_paciente) < ?
            ORDER BY total_pacientes ASC;
            """;

        try (var ps = conn.prepareStatement(sql)) {
            ps.setInt(1, cantidad);

            try (var rs = ps.executeQuery()) {
                boolean hayResultados = false;

                System.out.printf("%-35s | %s%n", "Tratamiento", "Pacientes");
                System.out.println("-----------------------------------------------");

                while (rs.next()) {
                    hayResultados = true;
                    String nombre = rs.getString("nombre_tratamiento");
                    int total = rs.getInt("total_pacientes");
                    System.out.printf("%-35s | %5d%n", nombre, total);
                }

                if (!hayResultados) {
                    System.out.println("No se encontraron tratamientos con menos de " + cantidad + " pacientes.");
                }
            }

        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
    }


    public void obtenerTotalCitasPorPaciente() {
        final String sql = """
                SELECT pacientes.nombre , COUNT(citas.id_paciente) AS total_citas
                FROM pacientes JOIN citas
                ON pacientes.id_paciente = citas.id_paciente
                GROUP BY pacientes.nombre;
                """;
        try (var ps = conn.prepareStatement(sql)) {
            try (ResultSet rs = ps.executeQuery()) {
                System.out.println("Nombre Paciente\t\t\tCantidad Citas");
                System.out.println("-------------------------------------");

                while (rs.next()) {
                    String nombre = rs.getString("nombre");
                    int totalCitas = rs.getInt("total_citas");
                    System.out.println(nombre + "\t\t" + totalCitas);
                }
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
    }

    public int addTratamiento(String nombreTratamiento, String descripcion,int idMedico, int idEspecialidad) throws SQLException {
        final String sql = """
        INSERT INTO tratamientos (nombre_tratamiento, descripcion,id_medico, id_especialidad)
        VALUES (?, ?, ?, ?)
    """;
        try (var ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setString(1, nombreTratamiento);
            ps.setString(2, descripcion);
            ps.setInt(3, idMedico);
            ps.setInt(4, idEspecialidad);
            ps.executeUpdate();
            try (var rs = ps.getGeneratedKeys()) {
                if (rs.next()) return rs.getInt(1);
                throw new IllegalStateException("No se obtuvo ID generado en MySQL.");
            }
        }
    }


    public int getIdTratamiento(String nombre) throws SQLException {
        final String sql = """
                SELECT id_tratamiento
                FROM tratamientos 
                WHERE nombre_tratamiento = ?
                """;
        try (var ps = conn.prepareStatement(sql)) {
            ps.setString(1, nombre);
            try (var rs = ps.executeQuery()) {
                if (rs.next()) return rs.getInt(1);
                throw new IllegalStateException("Tratamiento no encontrado: " + nombre);
            }
        }
    }

    public void deleteTratamiento(int idEliminar) throws SQLException {
        final String sql = """
                DELETE FROM tratamientos
                WHERE id_tratamiento = ?
                """;
        try (var ps = conn.prepareStatement(sql)) {
            ps.setInt(1, idEliminar);
            int borrado = ps.executeUpdate(); // una sola vez
            if (borrado == 0) {
                throw new SQLException("No se borró ningún registro en MySQL.");
            }
        }
    }

    public void setNombreDescripcion(ArrayList<TratamientoInfo> lista) throws SQLException {
        final String sql = """
                SELECT id_tratamiento, nombre_tratamiento, descripcion
                FROM tratamientos
                """;
        Map<Integer, TratamientoInfo> mapaDB = new HashMap<>();

        try (var ps = conn.prepareStatement(sql);
             var rs = ps.executeQuery()) {

            while (rs.next()) {
                int id = rs.getInt("id_tratamiento");
                String nombre = rs.getString("nombre_tratamiento");
                String descripcion = rs.getString("descripcion");

                mapaDB.put(id, new TratamientoInfo(id, nombre, descripcion));
            }
        }

        for (TratamientoInfo t : lista) {
            TratamientoInfo tDB = mapaDB.get(t.getIdTratamiento());
            if (tDB != null) {
                t.setNombreTratamiento(tDB.getNombreTratamiento());
                t.setDescripcion(tDB.getDescripcion());
            }
        }
    }

    public void getDatosPaciente(int idEspecialidad) throws SQLException {
        final String sql = """
                SELECT p.id_paciente,
                       p.nombre AS nombre_paciente,
                       t.nombre_tratamiento
                FROM pacientes p
                JOIN pacientes_tratamientos pt ON pt.id_paciente = p.id_paciente
                JOIN tratamientos t ON t.id_tratamiento = pt.id_tratamiento
                WHERE t.id_especialidad = ?
                ORDER BY p.id_paciente, t.nombre_tratamiento;
                """;

        try (var ps1 = conn.prepareStatement(sql)) {
            ps1.setInt(1, idEspecialidad);
            try (var rs1 = ps1.executeQuery()) {
                boolean hayResultados = false;
                while (rs1.next()) {
                    hayResultados = true;
                    int idPaciente = rs1.getInt("id_paciente");
                    String nombrePaciente = rs1.getString("nombre_paciente");
                    String nombreTratamiento = rs1.getString("nombre_tratamiento");

                    System.out.println("Paciente " + idPaciente + ": " + nombrePaciente
                            + " — Tratamiento: " + nombreTratamiento);

                }
                if (!hayResultados) {
                    System.out.println("No hay pacientes asociados a esta especialidad.");
                }

            }


        }
    }

}