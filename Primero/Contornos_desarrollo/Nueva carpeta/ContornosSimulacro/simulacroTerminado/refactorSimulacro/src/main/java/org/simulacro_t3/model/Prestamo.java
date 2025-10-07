package org.simulacro_t3.model;

import java.time.LocalDate;

/**
 * Representa el préstamo de un libro a un usuario en una fecha determinada.
 */
public class Prestamo {
    private int id;
    private Usuario usuario;
    private Libro libro;
    private EstadoPrestamo estado;
    private LocalDate fecha;

    /**
     * Crea un nuevo préstamo asignando un ID único y estado ACTIVO.
     *
     * @param usuario Usuario que solicita el préstamo.
     * @param libro   Libro prestado.
     * @param fecha   Fecha de creación del préstamo.
     */
    public Prestamo(Usuario usuario, Libro libro, LocalDate fecha) {
        this.usuario = usuario;
        this.libro = libro;
        this.fecha = fecha;
        this.estado = EstadoPrestamo.ACTIVO;
    }

    /**
     * @return Usuario asociado al préstamo.
     */
    public Usuario getUsuario() {
        return usuario;
    }

    /**
     * @return Libro prestado.
     */
    public Libro getLibro() {
        return libro;
    }

    /**
     * @return Estado actual del préstamo.
     */
    public EstadoPrestamo getEstado() {
        return estado;
    }

    /**
     * Renueva el préstamo si está en estado ACTIVO; cambia a RENOVADO.
     * @throws IllegalStateException si el préstamo no está en estado ACTIVO.
     */
    public void renovar() {
        if (estado == EstadoPrestamo.ACTIVO) {
            estado = EstadoPrestamo.RENOVADO;
        } else {
            throw new IllegalStateException("No se puede renovar en estado: " + estado.name().toLowerCase());
        }
    }

    /**
     * Devuelve el libro, cambia estado a DEVUELTO y actualiza usuario y libro.
     */
    public void devolver() {
        estado = EstadoPrestamo.DEVUELTO;
        libro.setDisponible(true);
        usuario.decrementarPrestamosActivos();
    }

    /**
     * @return Representación en texto del préstamo.
     */
    @Override
    public String toString() {
        return String.format("%d: %s - %s [%s]", id, usuario.getNombre(), libro.getTitulo(), estado.name().toLowerCase());
    }
}
