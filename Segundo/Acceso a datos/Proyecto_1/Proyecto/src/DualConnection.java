import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

@SuppressWarnings("resource")
public final class DualConnection {

    private static DualConnection instancia;

    private DualConnection() {
    }

    public static synchronized DualConnection getDualInstance() {
        if (instancia == null) instancia = new DualConnection();
        return instancia;
    }

    private static MySqlConnection mysql() {
        return MySqlConnection.getInstance();
    }

    private static PostgreConnection postgres() {
        return PostgreConnection.getInstance();
    }

    public void begin() throws SQLException {
        MySqlConnection cMy = mysql();
        PostgreConnection cPg = postgres();
        if (cMy == null || cPg == null) {
            System.out.println("ERROR: Las conexiones MySQL/PostgreSQL no están inicializadas.");
            return;
        }
        cMy.setAutoCommit(false);
        cPg.setAutoCommit(false);
        System.out.println("Transacción iniciada en MySQL y PostgreSQL (autocommit desactivado).");
    }

    public void commitBoth() throws SQLException {
        mysql().commit();
        postgres().commit();
        mysql().setAutoCommit(true);
        postgres().setAutoCommit(true);
    }

    public void rollbackBoth() {
        mysql().rollback();
        mysql().setAutoCommit(true);
        postgres().rollback();
        postgres().setAutoCommit(true);
    }

    public void close() {
        MySqlConnection.getInstance().close();
        PostgreConnection.getInstance().close();
        instancia = null;
    }

    public void crearTratamiento(String nombre, String descripcion, String nombreEspecialidad, String nifMedico) {

        try {
            int idEspecialidad = postgres().getEspecialidadId(nombreEspecialidad);
            int idMedico = postgres().getIdMedico(nifMedico);
            begin();
            int idTratamiento = mysql().addTratamiento(nombre, descripcion, idMedico, idEspecialidad);
            postgres().addTratamiento(idTratamiento, idMedico, idEspecialidad);
            commitBoth();
            System.out.println("Tratamiento cargado.");

        } catch (Exception e) {
            System.out.println("Error: " + e);
            rollbackBoth();
        }
    }

    public void eliminarTratamientoPorNombre(String nombre) {
        try {
            Integer idEliminar = null;
            try {
                idEliminar = mysql().getIdTratamiento(nombre);
            } catch (IllegalStateException nf) {
                System.out.println("No existe tratamiento con nombre: " + nombre);
                return; // no hay transacción que revertir
            }

            begin();
            mysql().deleteTratamiento(idEliminar);
            postgres().deleteTratamienot(idEliminar);
            commitBoth();
            System.out.println("Tratamiento borrado satisfactoriamente.");
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
            rollbackBoth();
        }
    }


    public void listarTratamientosConEspecialidadYMedico() {
        ArrayList<TratamientoInfo> lista = new ArrayList<>();

        try {
            lista = postgres().getIdTratamientosEspecialidad();
            mysql().setNombreDescripcion(lista);


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
        String nombreEspecialidad = null;
        try {
            nombreEspecialidad = postgres().getNombreEspecialidad(idEspecialidad);

            System.out.println("#### Pacientes de la especialidad: " + nombreEspecialidad + " ####\n");
            mysql().getDatosPaciente(idEspecialidad);
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
    }
}