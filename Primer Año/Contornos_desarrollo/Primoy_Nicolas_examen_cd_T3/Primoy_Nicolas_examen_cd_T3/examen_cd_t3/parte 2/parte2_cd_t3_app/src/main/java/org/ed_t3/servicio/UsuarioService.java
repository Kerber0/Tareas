package org.ed_t3.servicio;

import java.util.Comparator;
import org.ed_t3.modelo.Usuario;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class UsuarioService {
    private static final int IDENTIFICACIONES_EXPERTO = 10;
    private static final int IDENTIFICACIONES_ADMINISTRADOR = 20;
    private static final int IDENTIFICACIONES_ESTANDAR = 5;
    private static final int IDENTIFICACIONES_INVALIDA = 0;
    Scanner scanner = new Scanner(System.in);
    private List<Usuario> usuariosEstandar;
    private List<Usuario> usuariosExpertos;
    private List<Usuario> usuariosAdministradores;

    public UsuarioService() {
        this.usuariosEstandar = new ArrayList<>();
        this.usuariosExpertos = new ArrayList<>();
        this.usuariosAdministradores = new ArrayList<>();
    }

    public void anadirUsuario(Usuario usuario) {
        if(usuario.tipoUsuario.equals("experto")) {
            usuariosExpertos.add(usuario);
        } else if(usuario.tipoUsuario.equals("administrador")) {
            usuariosAdministradores.add(usuario);
        } else if(usuario.tipoUsuario.equals("estandar")) {
            usuariosEstandar.add(usuario);
        } else {
            System.out.println("Tipo de usuario no válido");
        }
    }

    public int calcularNumeroMaximoDeIdentificaciones(Usuario usuario){
        if(usuario.tipoUsuario.equals("experto")) {
            return IDENTIFICACIONES_EXPERTO;
        } else if(usuario.tipoUsuario.equals("administrador")) {
            return IDENTIFICACIONES_ADMINISTRADOR;
        } else if(usuario.tipoUsuario.equals("estandar")) {
            return IDENTIFICACIONES_ESTANDAR;
        } else {
            System.out.println("Tipo de usuario no válido");
            return IDENTIFICACIONES_INVALIDA;
        }
    }

    public int obtenerNumeroIdentificacionesRestantes(Usuario usuario) {
        int maximo = calcularNumeroMaximoDeIdentificaciones(usuario);
        return maximo - usuario.numero_notificaciones;
    }

    public void eliminarUsuario(Usuario usuario) {
        if(usuario.tipoUsuario.equals("experto")) {
            usuariosExpertos.remove(usuario);
        } else if(usuario.tipoUsuario.equals("administrador")) {
            usuariosAdministradores.remove(usuario);
        } else if(usuario.tipoUsuario.equals("estandar")) {
            usuariosEstandar.remove(usuario);
        } else {
            System.out.println("Tipo de usuario no válido");
        }
    }


    // Método para obtener la lista de usuarios ordenados por prioridad, recibe por parámetro un comparador de usuarios
    public List<Usuario> obtenerUsuariosOrdenadosPorPrioridad(Comparator<Usuario> comparator) {
        // Recorre las 3 lista de usuarios y los ordena según el comparador recibido
        List<Usuario> usuariosOrdenados = new ArrayList<>();


        if(!usuariosEstandar.isEmpty()) {
            //añadir los usuarios estandar a los ordenados
            usuariosOrdenados.addAll(usuariosEstandar);
            if(!usuariosExpertos.isEmpty()) {
                usuariosOrdenados.addAll(usuariosExpertos);
                if(!usuariosAdministradores.isEmpty()) {
                    usuariosOrdenados.addAll(usuariosAdministradores);
                }
            }
        }
        if(!usuariosOrdenados.isEmpty()) {
            //ordenamos la lista agrupada
            usuariosOrdenados.sort(comparator);
            return usuariosOrdenados;
        } else {
            return usuariosOrdenados; // Lista vacía
        }
    }

    public Usuario obtenerUsuarioPorId(Long id) {
        for (Usuario usuario : usuariosEstandar) {
            if (usuario.id.equals(id)) {
                return usuario;
            }
        }
        for (Usuario usuario : usuariosExpertos) {
            if (usuario.id.equals(id)) {
                return usuario;
            }
        }
        for (Usuario usuario : usuariosAdministradores) {
            if (usuario.id.equals(id)) {
                return usuario;
            }
        }
        return null; // Usuario no encontrado
    }

    public boolean identificacionesRestantes(Usuario usuario) {
        if (usuario.numero_notificaciones < calcularNumeroMaximoDeIdentificaciones(usuario)) {
            usuario.numero_notificaciones++;
            System.out.println("Identificación registrada. Número de identificaciones restantes: " + obtenerNumeroIdentificacionesRestantes(usuario));
            return true;
        } else {
            System.out.println("Número máximo de identificaciones alcanzado.");
            return false;
        }

    }

    public void crearUsuario() {
        System.out.print("ID: ");
        Long id = scanner.nextLong();
        scanner.nextLine();
        System.out.print("Nombre: ");
        String nombre = scanner.nextLine();
        System.out.print("Apellidos: ");
        String apellidos = scanner.nextLine();
        System.out.print("DNI: ");
        String dni = scanner.nextLine();
        System.out.print("Teléfono: ");
        String telefono = scanner.nextLine();
        System.out.print("Email: ");
        String email = scanner.nextLine();
        System.out.print("Dirección: ");
        String direccion = scanner.nextLine();
        System.out.print("Tipo de usuario (estandar/experto/administrador): ");
        String tipoUsuario = scanner.nextLine();
        Usuario nuevoUsuario = new Usuario(id, nombre, apellidos, dni, telefono, email, direccion, tipoUsuario);
        anadirUsuario(nuevoUsuario);
        System.out.println("Usuario añadido.");
    } // muevo esta clase del main para asignar toda la responsabilidad de usuario a usuarioservice y no repartirla con main.

    public void usariosDummy() {
        anadirUsuario(new Usuario(1L, "Juan", "Pérez", "12345678A", "123456789", "juan.perez@correo.es", "Calle Falsa 123", "estandar"));
        anadirUsuario(new Usuario(2L, "Ana", "García", "23456789B", "987654321", "ana.garcia@correo.es", "Avenida Real 45", "estandar"));
        anadirUsuario(new Usuario(3L, "Luis", "Martín", "34567890C", "654987321", "luis.martin@correo.es", "Plaza Mayor 1", "estandar"));
        anadirUsuario(new Usuario(4L, "Marta", "López", "45678901D", "321654987", "marta.lopez@correo.es", "Calle Luna 7", "estandar"));
        anadirUsuario(new Usuario(5L, "Pedro", "Sánchez", "56789012E", "789123456", "pedro.sanchez@correo.es", "Calle Sol 9", "estandar"));

        anadirUsuario(new Usuario(6L, "Elena", "Ruiz", "67890123F", "111222333", "elena.ruiz@correo.es", "Calle Mar 10", "experto"));
        anadirUsuario(new Usuario(7L, "Carlos", "Torres", "78901234G", "222333444", "carlos.torres@correo.es", "Avenida Norte 22", "experto"));
        anadirUsuario(new Usuario(8L, "Lucía", "Moreno", "89012345H", "333444555", "lucia.moreno@correo.es", "Calle Sur 5", "experto"));
        anadirUsuario(new Usuario(9L, "Javier", "Serrano", "90123456I", "444555666", "javier.serrano@correo.es", "Calle Este 8", "experto"));
        anadirUsuario(new Usuario(10L, "Sara", "Navarro", "01234567J", "555666777", "sara.navarro@correo.es", "Calle Oeste 3", "experto"));

        anadirUsuario(new Usuario(11L, "Alberto", "Gil", "11223344K", "666777888", "alberto.gil@correo.es", "Calle Central 2", "administrador"));
        anadirUsuario(new Usuario(12L, "Patricia", "Romero", "22334455L", "777888999", "patricia.romero@correo.es", "Avenida Libertad 4", "administrador"));
        anadirUsuario(new Usuario(13L, "Miguel", "Ortega", "33445566M", "888999000", "miguel.ortega@correo.es", "Calle Paz 6", "administrador"));
        anadirUsuario(new Usuario(14L, "Carmen", "Vega", "44556677N", "999000111", "carmen.vega@correo.es", "Calle Esperanza 12", "administrador"));
        anadirUsuario(new Usuario(15L, "Raúl", "Castro", "55667788O", "000111222", "raul.castro@correo.es", "Calle Progreso 14", "administrador"));

        System.out.println("15 usuarios dummy añadidos (5 de cada tipo).");
    } // muevo esta clase del main para asignar toda la responsabilidad de usuario a usuarioservice y no repartirla con main.

    public void identificacionesRestantes() {
        System.out.print("ID del usuario: ");
        Long idIdent = scanner.nextLong();
        scanner.nextLine();
        Usuario usuarioIdent = obtenerUsuarioPorId(idIdent);
        if (usuarioIdent != null) {
            int identificacionesRestantes = obtenerNumeroIdentificacionesRestantes(usuarioIdent);
            System.out.println("Número de identificaciones restantes: " + identificacionesRestantes);
        } else {
            System.out.println("Usuario no encontrado.");
        }
    } // muevo esta clase del main para asignar toda la responsabilidad de usuario a usuarioservice y no repartirla con main.

    public void registrarIdentificacion() {
        System.out.print("ID del usuario: ");
        Long idUsuario = scanner.nextLong();
        scanner.nextLine();
        Usuario usuario = obtenerUsuarioPorId(idUsuario);
        if (usuario != null) {
            if(identificacionesRestantes(usuario))
                System.out.println("Identificación registrada.");
            else
                System.out.println("Número máximo de identificaciones alcanzado.");
        } else {
            System.out.println("Usuario no encontrado.");
        }
    }

    public void listarUsuariosPorId() {
        List<Usuario> usuariosOrdenadosPorId = obtenerUsuariosOrdenadosPorPrioridad(
                Comparator.comparing(u -> u.id)
        );
        System.out.println("Usuarios ordenados por ID:");
        for (Usuario u : usuariosOrdenadosPorId) {
            System.out.println(u.id + " - " + u.nombre + " " + u.apellidos + " (" + u.tipoUsuario + ")");
        }
    }

    public void listarUsuariosPorNombre() {
        List<Usuario> usuariosOrdenados = obtenerUsuariosOrdenadosPorPrioridad(
                Comparator.comparing(u -> u.nombre)
        );
        System.out.println("Usuarios ordenados por nombre:");
        for (Usuario u : usuariosOrdenados) {
            System.out.println(u.id + " - " + u.nombre + " " + u.apellidos + " (" + u.tipoUsuario + ")");
        }
    }
}
