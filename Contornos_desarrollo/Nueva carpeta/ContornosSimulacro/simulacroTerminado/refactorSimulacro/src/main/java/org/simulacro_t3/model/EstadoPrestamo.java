package org.simulacro_t3.model;
/**
 * Enumeración de los estados posibles de un préstamo.
 */
public enum EstadoPrestamo {
    /** Préstamo recién creado y activo. */
    ACTIVO,
    /** Préstamo renovado una vez. */
    RENOVADO,
    /** Préstamo devuelto correctamente. */
    DEVUELTO,
    /** Préstamo que ha superado la fecha de devolución. */
    VENCIDO
}
