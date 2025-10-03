package org.simulacro_t3.model;
/**
 * Enumeración de los posibles tipos de usuario en el sistema de préstamos.
 */
public enum TipoUsuario {
    /** Usuario de tipo alumno, con límite de 3 préstamos activos. */
    ALUMNO,
    /** Usuario de tipo profesor, con límite de 5 préstamos activos. */
    PROFESOR,
    /** Usuario suspendido, no puede realizar nuevos préstamos. */
    SUSPENDIDO,
    /** Usuario administrador, sin límite de préstamos. */
    ADMIN
}