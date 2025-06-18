package org.ed_t3.modelo;

public class Usuario {
    public Long id;
    public String nombre;
    public String apellidos;
    public String dni;
    public String telefono;
    public String email;
    public String direccion;
    public String tipoUsuario; // Usuario estandar, experto o administrador
    public int numero_notificaciones;

    public Usuario(Long id, String nombre, String apellidos, String dni, String telefono, String email, String direccion, String tipoUsuario) {
        this.id = id;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.dni = dni;
        this.telefono = telefono;
        this.email = email;
        this.direccion = direccion;
        this.tipoUsuario = tipoUsuario;
        this.numero_notificaciones = 0;
    }
}