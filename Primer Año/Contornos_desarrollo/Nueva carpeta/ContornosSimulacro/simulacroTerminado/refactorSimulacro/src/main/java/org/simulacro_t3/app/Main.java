package org.simulacro_t3.app;

import java.time.LocalDate;
import java.util.Scanner;
import org.simulacro_t3.model.Libro;
import org.simulacro_t3.model.TipoUsuario;
import org.simulacro_t3.model.Usuario;
import org.simulacro_t3.service.GestorPrestamos;
import java.util.*;


/**
 * Aplicación de consola para interactuar con el sistema de préstamos.
 */
public class Main {
    private static final Scanner scanner = new Scanner(System.in);
    private static final List<Usuario> usuarios = new ArrayList<>();
    private static final List<Libro> libros = new ArrayList<>();
    private static final GestorPrestamos gestorPrestamos = new GestorPrestamos();

    /**
     * Punto de entrada de la aplicación.
     */
    public static void main(String[] args) {
        // Carga de datos de prueba
        cargarDatosIniciales();

        int opcion;

        do {
            mostrarMenu();
            System.out.print("Elige una opción: ");
            opcion = Integer.parseInt(scanner.nextLine());

            switch (opcion) {
                case 1 -> mostrarUsuarios();
                case 2 -> mostrarLibros();
                case 3 -> hacerPrestamo();
                case 4 -> gestorPrestamos.mostrarPrestamos();
                case 0 -> System.out.println("Saliendo...");
                default -> System.out.println("Opción no válida");
            }

        } while (opcion != 0);
    }
    /**
     * Muestra el menú principal en consola.
     */
    private static void mostrarMenu() {
        System.out.println("""
                
                ==== MENÚ BIBLIOTECA ====
                1. Mostrar usuarios
                2. Mostrar libros
                3. Hacer préstamo
                4. Mostrar préstamos
                0. Salir
                =========================
                """);
    }
    /**
     * Carga datos de prueba iniciales en listas de usuarios y libros.
     */
    private static void cargarDatosIniciales() {
        usuarios.add(new Usuario("Ana", "ana@email.com", TipoUsuario.ALUMNO));
        usuarios.add(new Usuario("Luis", "luis@email.com",TipoUsuario.SUSPENDIDO));

        libros.add(new Libro("1984", "George Orwell"));
        libros.add(new Libro("El Principito", "Antoine de Saint-Exupéry"));
    }
    /**
     * Imprime la lista de usuarios registrados.
     */
    private static void mostrarUsuarios() {
        System.out.println("Usuarios registrados:");
        for (int i = 0; i < usuarios.size(); i++) {
            System.out.println(i + " - " + usuarios.get(i));
        }
    }
    /**
     * Imprime la lista de libros disponibles y su estado.
     */
    private static void mostrarLibros() {
        System.out.println("Libros disponibles:");
        for (int i = 0; i < libros.size(); i++) {
            System.out.println(i + " - " + libros);
        }
    }
    /**
     * Maneja la interacción para realizar un préstamo seleccionado por usuario y libro.
     */
    private static void hacerPrestamo() {
        mostrarUsuarios();
        System.out.print("Selecciona usuario (número): ");
        int usuarioIndex = Integer.parseInt(scanner.nextLine());

        mostrarLibros();
        System.out.print("Selecciona libro (número): ");
        int libroIndex = Integer.parseInt(scanner.nextLine());

        if (usuarioIndex >= 0 && usuarioIndex < usuarios.size() && libroIndex >= 0 && libroIndex < libros.size()) {
            gestorPrestamos.hacerPrestamo(usuarios.get(usuarioIndex), libros.get(libroIndex), LocalDate.now());
        } else {
            System.out.println("Selección inválida.");
        }
    }
}
