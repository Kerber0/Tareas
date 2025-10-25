import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;

public class MySqlConnection {
    private static Connection conn;
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

    public static Connection getSqlInstance() {
        if (conn == null) {
            new MySqlConnection();
        }
        return conn;
    }


    public static void crearPaciente(String nombre, String email, LocalDate fechaNacimiento) {
        final String sql = """
                INSERT INTO pacientes(nombre, email, fecha_nacimiento)
                VALUES (?, ?, ?)""";
        try (var ps = getSqlInstance().prepareStatement(sql, java.sql.Statement.RETURN_GENERATED_KEYS)) {
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

    public static void eliminarPaciente(int id) {
        final String sql = """
                DELETE FROM pacientes
                WHERE id_paciente = ?""";
        try (var ps = getSqlInstance().prepareStatement(sql)) {
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

/*Listar tratamientos (menos de X pacientes asignados) (MySQL)


Mediante una única consulta se tendrá que obtener el conjunto de filas resultante
y mostrar el nombre de los tratamientos junto con su stock.
*/

    public static void listarTratamientosConPocosPacientes(int cantidad) {
        final String sql = """
                SeLEcT t.nombre_tratamiento,
                       COUNT(pt.id_paciente) AS total_pacientes
                FROM tratamientos t
                LEFT JOIN pacientes_tratamientos pt
                  ON t.id_tratamiento = pt.id_tratamiento
                GROUP BY t.nombre_tratamiento
                HAVING COUNT(pt.id_paciente) < ?
                ORDER BY total_pacientes ASC;
                """;

        try (var ps = getSqlInstance().prepareStatement(sql)) {
            ps.setInt(1, cantidad);

            try (var rs = ps.executeQuery()) {
                boolean hayResultados = false;

                System.out.println("Tratamiento\t\t\tPacientes");
                System.out.println("-------------------------------------");

                while (rs.next()) {
                    hayResultados = true;
                    String nombre = rs.getString("nombre_tratamiento");
                    int total = rs.getInt("total_pacientes");
                    System.out.println(nombre + "\t\t" + total);
                }

                if (!hayResultados) {
                    System.out.println("No se encontraron tratamientos con menos de " + cantidad + " pacientes.");
                }
            }

        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
    }



    /*Obtener el total de citas realizadas por cada paciente (MySQL)
Mediante una consulta se tendrá que obtener toda la información e imprimir por pantalla:
el nombre del paciente junto con el número de citas registradas.*/

    public static void obtenerTotalCitasPorPaciente() {
        final String sql = """
                SELECT pacientes.nombre , COUNT(citas.id_paciente) AS total_citas
                FROM pacientes JOIN citas
                ON pacientes.id_paciente = citas.id_paciente
                GROUP BY pacientes.nombre;
                """;
        try (var ps = getSqlInstance().prepareStatement(sql)) {
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

}
