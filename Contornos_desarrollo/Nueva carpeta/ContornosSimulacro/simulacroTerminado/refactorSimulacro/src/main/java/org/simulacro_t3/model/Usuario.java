package org.simulacro_t3.model;

/**
 * Representa un usuario registrado en el sistema de préstamos.
 */
public class Usuario {
    private static final int MAX_PRESTAMOS_ALUMNO = 3;
    private static final int MAX_PRESTAMOS_PROFESOR = 5;
    private String nombre;
    private String email;
    private TipoUsuario tipo;
    private int prestamosActivos;
    private int id;

    /**
     * Construye un nuevo usuario con un tipo y sin préstamos activos.
     *
     * @param nombre Nombre completo del usuario.
     * @param email  Correo electrónico del usuario.
     * @param tipo   Tipo de usuario (ALUMNO, PROFESOR, SUSPENDIDO, ADMIN).
     */
    public Usuario(String nombre, String email, TipoUsuario tipo) {
        this.nombre = nombre;
        this.email = email;
        this.tipo = tipo;
        this.prestamosActivos = 0;
    }

    /**
     * @return Nombre del usuario.
     */
    public String getNombre() {
        return nombre;
    }
    /** Devuelve el email */
    public String getEmail() {
        return email;
    }
    /**
     * Incrementa en uno el contador de préstamos activos.
     */
    public void incrementarPrestamosActivos() {
        prestamosActivos++;
    }
    /**
     * Disminuye en uno el contador de préstamos activos.
     */
    public void decrementarPrestamosActivos() {
        prestamosActivos--;
    }
    /** Devuelve el ID */
    public int getId() {
        return id;
    }

    /**
     * @return Representación en texto del usuario, incluyendo tipo y préstamos activos.
     */
    @Override
    public String toString () {
        return nombre + " - " + email + " (" + tipo.name().toLowerCase() + ") " + prestamosActivos;
    }

    /**
     * Determina si el usuario puede solicitar un nuevo préstamo según su tipo y cantidad actual.
     *
     * @return si puede pedir más préstamos.
     */
    public boolean puedePrestar() {
        return switch (tipo) {
            case SUSPENDIDO -> false;
            case ADMIN -> true;
            case ALUMNO -> prestamosActivos < MAX_PRESTAMOS_ALUMNO;
            case PROFESOR -> prestamosActivos < MAX_PRESTAMOS_PROFESOR;
        };
    }

    /**
     * Establece manualmente el tipo de usuario.
     *
     * @param tipo Nuevo tipo de usuario.
     */
    public void setTipo(TipoUsuario tipo) {
        this.tipo = tipo;
    }
}
