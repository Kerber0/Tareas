import java.sql.*;

public class PostgreConnection {
    private static Connection conn;
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

    public static Connection getPostgreInstance() {
        if (conn == null) {
            new PostgreConnection();
        }
        return conn;
    }

    public static void crearEspecialidad(String nombreEspecialidad) {
        final String sql = """
                insert into hospital.especialidades (nombre_especialidad)
                values (?)
                """;
        try (var ps = getPostgreInstance().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
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

    public static void crearMedico(String nombreMedico, String nif, int telefono, String email) {
        final String sql = """
                 INSERT INTO hospital.medicos (nombre_medico, contacto)
                 VALUES (?, ROW(?, ?, ?, ?))
                """;
        try (var ps = getPostgreInstance().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
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

    public static void eliminarMedico(int id) {
        final String sql = """
                DELETE FROM hospital.medicos WHERE id_medico = ?
                """;
        try (var ps = getPostgreInstance().prepareStatement(sql)) {
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

    public static void obtenerCantidadTratamientosPorSala() {
        final String sql = """
                SELECT hospital.salas.nombre_sala,
                COUNT(hospital.salas_tratamientos.id_tratamiento) AS total_tratamientos
                FROM hospital.salas LEFT JOIN hospital.salas_tratamientos
                ON hospital.salas.id_sala = hospital.salas_tratamientos.id_sala
                GROUP BY hospital.salas.nombre_sala;
                """;
        try (var ps = getPostgreInstance().prepareStatement(sql)) {
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
}
