package org.simulacro_t3.model;

/**
 * Representa un libro disponible para préstamo en la biblioteca.
 */
public class Libro {
    private final String titulo;
    private final String autor;
    private boolean disponible;

    /**
     * Modelo que representa un libro en la biblioteca.
     * @param titulo Título del libro.
     * @param autor  Autor del libro.
     */
    public Libro(String titulo, String autor) {
        this.titulo = titulo;
        this.autor = autor;
        this.disponible = true;
    }

    /**
     * @return El título del libro.
     */
    public String getTitulo() {
        return titulo;
    }

    /**
     * Indica si el libro está disponible para préstamo.
     *
     * @return si está disponible.
     */
    public boolean isDisponible() {
        return disponible;
    }

    /**
     * Cambia el estado de disponibilidad del libro.
     *
     * @param disponible para marcarlo como disponible.
     */
    public void setDisponible(boolean disponible) {
        this.disponible = disponible;
    }

    /**
     * @return Representación en texto del libro, incluyendo estado.
     */
    @Override
    public String toString() {
        return String.format("%s - %s [%s]", titulo, autor, disponible ? "Disponible" : "Prestado");
    }
}
