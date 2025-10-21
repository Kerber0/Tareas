import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class PostgreConnection {
    private static Connection conn;
    private final String usuario = "admin";
    private final String clave = "abc123";
    private final String url = "jdbc:postgresql://localhost:5432/hospital_postgre";

    private PostgreConnection() {
        try {
            conn = DriverManager.getConnection(url, usuario, clave);
        }catch (SQLException e) {
            System.out.println("Error al conectar con la base de datos: " + e.getMessage());
        }
    }

    public static Connection getInstance() {
        if(conn == null) {
            new PostgreConnection();
        }
        return conn;
    }


    public static void crearEspecialidad(String nombreEspecialidad) {
    }

    public static void crearMedico(String nombreMedico, String nif, int telefono, String email) {
    }

    public static void eliminarMedico(int id) {
    }

    public static void obtenerCantidadTratamientosPorSala() {
    }
}
