import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.time.LocalDate;

public class MySqlConnection {
    private static Connection conn;
    private final String usuario = "root";
    private final String clave = "abc123";
    private final String url = "jdbc:mysql://localhost:3306/hospital_mysql";

    private MySqlConnection() {

    }

    public static Connection getInstance() {
        if(conn == null) {
            new MySqlConnection();
        }
        return conn;
    }


    public static void crearPaciente(String nombre, String email, LocalDate fechaNacimiento) {
    }

    public static void eliminarPaciente(int id) {
    }

    public static void listarTratamientosConPocosPacientes(int cantidad) {
    }

    public static void obtenerTotalCitasPorPaciente() {
    }
}
