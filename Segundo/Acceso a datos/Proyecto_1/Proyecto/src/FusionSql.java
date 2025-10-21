import java.sql.Connection;

public class FusionSql {
    private final Connection sql;
    private final Connection postgre;

    public FusionSql() {
        sql = MySqlConnection.getInstance();
        postgre = PostgreConnection.getInstance();
    }

    public static void crearTratamiento(String nombre, String descripcion, String nombreEspecialidad, String nifMedico) {
    }

    public static void eliminarTratamientoPorNombre(String nombre) {
    }

    public static void listarTratamientosConEspecialidadYMedico() {
    }

    public static void obtenerPacientesPorEspecialidad(int idEspecialidad) {

    }
}
