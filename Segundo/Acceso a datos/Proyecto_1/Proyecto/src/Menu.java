import java.time.LocalDate;

public class Menu {
    public static Inputs in = new Inputs();

    private static final String menuText = """
            
              ═══════════════════════════════════════════════════════════════
            
            ╔══════════════════════════════════════════════════════════════════╗
            ║                   SISTEMA DE GESTIÓN MÉDICA                      ║
            ╠══════════════════════════════════════════════════════════════════╣
            ║  1. Crear nueva especialidad médica (PostgreSQL)                 ║
            ║  2. Crear nuevo médico (PostgreSQL)                              ║
            ║  3. Eliminar médico por ID (PostgreSQL)                          ║
            ║  4. Crear nuevo paciente (MySQL)                                 ║
            ║  5. Eliminar paciente (MySQL)                                    ║
            ║  6. Crear nuevo tratamiento (MySQL + PostgreSQL)                 ║
            ║  7. Eliminar tratamiento por nombre (MySQL + PostgreSQL)         ║
            ║  8. Listar tratamientos con menos de X pacientes (MySQL)         ║
            ║  9. Obtener total de citas por paciente (MySQL)                  ║
            ║ 10. Cantidad de tratamientos por sala (PostgreSQL)               ║
            ║ 11. Listar tratamientos con especialidades y médicos             ║
            ║     (MySQL + PostgreSQL)                                         ║
            ║ 12. Pacientes con tratamientos de una especialidad dada          ║
            ║     (MySQL + PostgreSQL)                                         ║
            ╠══════════════════════════════════════════════════════════════════╣
            ║  0. Salir                                                        ║
            ╚══════════════════════════════════════════════════════════════════╝
            → Ingrese una opción:
            """;

    public static void iniciar() {
        menu();

    }

    private static void menu() {
        int opcion;
        do {
            opcion = in.inputInt(menuText);
            switch (opcion) {
                case 1: {
                    String nombreEspecialidad = in.input("Ingrese el nombre de la especialidad");
                    PostgreConnection.getInstance().crearEspecialidad(nombreEspecialidad);
                    break;
                }
                case 2: {
                    String nombreMedico = in.input("Nombre: ");
                    String nif = in.input("NIF: ");
                    int telefono = in.inputInt("Telefono: ");
                    String email = in.inputEmail("Email: ");
                    PostgreConnection.getInstance().crearMedico(nombreMedico, nif, telefono, email);
                    break;
                }
                case 3: {
                    int id = in.inputInt("Ingrese el id del medico a eliminar: ");
                    PostgreConnection.getInstance().eliminarMedico(id);
                    break;
                }
                case 4: {
                    String nombre = in.input("Nombre: ");
                    String email = in.inputEmail("Email: ");
                    LocalDate fechaNacimiento = in.inputFechaNacimiento("Fecha de nacimiento: ");
                    MySqlConnection.getInstance().crearPaciente(nombre, email, fechaNacimiento);
                    break;
                }
                case 5: {
                    int id = in.inputInt("ID: ");
                    MySqlConnection.getInstance().eliminarPaciente(id);
                    break;
                }
                case 6: {
                    String nombre = in.input("Nombre: ");
                    String descripcion = in.input("Descripcion: ");
                    String nombreEspecialidad = in.input("Nombre de la especialidad: ");
                    String nifMedico = in.input("Nif medico: ");
                    DualConnection.getDualInstance().crearTratamiento(nombre, descripcion, nombreEspecialidad, nifMedico);
                    break;
                }
                case 7: {
                    String nombre = in.input("Nombre: ");
                    DualConnection.getDualInstance().eliminarTratamientoPorNombre(nombre);
                    break;
                }
                case 8: {
                    int cantidad = in.inputInt("Cantidad de pacientes: ");
                    MySqlConnection.getInstance().listarTratamientosConPocosPacientes(cantidad);
                    break;
                }
                case 9: {
                    MySqlConnection.getInstance().obtenerTotalCitasPorPaciente();
                    break;
                }
                case 10: {
                    PostgreConnection.getInstance().obtenerCantidadTratamientosPorSala();
                    break;
                }
                case 11: {
                    DualConnection.getDualInstance().listarTratamientosConEspecialidadYMedico();
                    break;
                }
                case 12: {
                    int idEspecialidad = in.inputInt("ID de la especialidad: ");
                    DualConnection.getDualInstance().obtenerPacientesPorEspecialidad(idEspecialidad);
                    break;
                }
                case 0: {
                    System.out.println("Saliendo del sistema...");
                    break;
                }
                default: {
                    System.out.println("Opción no válida. Intente nuevamente.");
                    break;
                }
            }
        } while (opcion != 0);
        DualConnection.getDualInstance().close();
    }
}


