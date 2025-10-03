package org.simulacro_t3.service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.simulacro_t3.model.*;

/**
 * Servicio para gestionar préstamos de libros entre usuarios.
 */
public class GestorPrestamos {
    public List<Prestamo> prestamos = new ArrayList<>();

    /**
     * Intenta crear un préstamo si el usuario y el libro cumplen condiciones.
     */
    public void hacerPrestamo(Usuario usuario, Libro libro, LocalDate fecha) {
        if (!usuario.puedePrestar()) {
            System.out.println("El usuario no puede realizar más préstamos.");
            return;
        }
        if (!libro.isDisponible()) {
            System.out.println("Libro no disponible.");
            return;
        }

        Prestamo prestamo = new Prestamo(usuario, libro, fecha);
        prestamos.add(prestamo);
        libro.setDisponible(false);
        usuario.incrementarPrestamosActivos();
        System.out.println("Préstamo creado para " + usuario.getNombre() + " con el libro " + libro.getTitulo());
    }
    /**
     * Muestra por consola todos los préstamos registrados.
     */
    public void mostrarPrestamos() {
        for (Prestamo prestamo : prestamos) {
            System.out.println(prestamo.getUsuario().getNombre() + " - " + prestamo.getLibro().getTitulo() + " [" + prestamo.getEstado().name().toLowerCase() + "]");
        }
    }
    /**
     * Suspende a todos los usuarios con préstamos en estado VENCIDO.
     */
    public void suspenderSiVencido(Prestamo prestamo) {
        if (prestamo.getEstado() == EstadoPrestamo.VENCIDO) {
            prestamo.getUsuario().setTipo(TipoUsuario.SUSPENDIDO);
            System.out.println("Usuario suspendido por préstamo vencido" + prestamo.getUsuario().getNombre());
        }
    }
}
