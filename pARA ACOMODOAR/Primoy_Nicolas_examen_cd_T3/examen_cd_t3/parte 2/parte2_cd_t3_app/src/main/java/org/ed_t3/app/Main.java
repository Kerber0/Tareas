package org.ed_t3.app;

import org.ed_t3.modelo.Usuario;
import org.ed_t3.servicio.UsuarioService;

import java.util.Scanner;

public class Main {
    private static final int AGREGAR_USUARIO = 1;  //EXTRAIGO CONSTANTES DEL MENÚ
    private static final int ELIMINAR_USUARIO = 2;
    private static final int LISTAR_POR_NOMBRE = 3;
    private static final int LISTAR_POR_ID = 4;
    private static final int REGISTRAR_IDENTIFICACION = 5;
    private static final int IDENTIFICACIONES_RESTANTES = 6;
    private static final int USUARIOS_DUMMY = 10;
    private static final int SALIR = 99;

    public static void main(String[] args) {
        UsuarioService usuarioService = new UsuarioService();
        Scanner scanner = new Scanner(System.in);
        boolean salir = false;

        while (!salir) {
            System.out.println("\n--- Menú de Usuario ---");
            System.out.println( AGREGAR_USUARIO + ".Añadir usuario");
            System.out.println("2. Eliminar usuario");
            System.out.println("3. Mostrar usuarios ordenados por nombre");
            System.out.println("4. Mostrar usuarios ordenados por id");
            System.out.println("5. Registrar identificación de un usuario");
            System.out.println("6. Comprobar número de identificaciones restantes de un usuario");
            System.out.println("10. Rellenar usuarios dummy");
            System.out.println("99. Salir");
            System.out.print("Seleccione una opción: ");
            int opcion = scanner.nextInt();
            scanner.nextLine(); // Limpiar buffer

            switch (opcion) {
                case AGREGAR_USUARIO:
                   usuarioService.crearUsuario();
                    break;
                case ELIMINAR_USUARIO:  //ESTE CREO QUE TENDRIA QUE SACARLO A USUARIOSERVICE PERO TECNICAMENTE SOLO ESTA OBTENIENDO LOS PARAMETROS, LA ELIMINACION LA HACE CON EL OTRO METODO
                    System.out.print("ID del usuario a eliminar: ");
                    Long idEliminar = scanner.nextLong();
                    scanner.nextLine();
                    Usuario usuarioEliminar = usuarioService.obtenerUsuarioPorId(idEliminar);
                    if (usuarioEliminar != null) {
                        usuarioService.eliminarUsuario(usuarioEliminar);
                        System.out.println("Usuario eliminado.");
                    } else {
                        System.out.println("Usuario no encontrado.");
                    }
                    break;
                case LISTAR_POR_NOMBRE:
                    usuarioService.listarUsuariosPorNombre();
                    break;
                case LISTAR_POR_ID:
                    usuarioService.listarUsuariosPorId();
                    break;
                case REGISTRAR_IDENTIFICACION:
                   usuarioService.registrarIdentificacion();
                    break;
                case IDENTIFICACIONES_RESTANTES:
                    usuarioService.identificacionesRestantes();
                    break;
                case USUARIOS_DUMMY:
                    // Rellenar usuarios dummy
                   usuarioService.usariosDummy();
                    break;
                case SALIR:
                    salir = true;
                    break;
                default:
                    System.out.println("Opción no válida.");
            }
        }
        scanner.close();
    }
}