public class TratamientoInfo {
    private int id_tratamiento;
    private int id_medico;
    private int id_especialidad;
    private String nombreTratamiento;
    private String descripcion;
    private String nombreMedico;
    private String nombreEspecialidad;

    // Constructor con campos
    public TratamientoInfo(int id, int id_medico, int id_especialidad, String nombreMedico,
                           String nombreEspecialidad) {
        this.id_tratamiento = id;
        this.id_medico = id_medico;
        this.id_especialidad = id_especialidad;
        this.nombreMedico = nombreMedico;
        this.nombreEspecialidad = nombreEspecialidad;
    }

    public TratamientoInfo(int id, String nombre, String descripcion) {
        this.id_tratamiento = id;
        this.nombreTratamiento = nombre;
        this.descripcion = descripcion;
    }

    public int getIdTratamiento() {
        return id_tratamiento;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getNombreTratamiento() {
        return nombreTratamiento;
    }

    public void setNombreTratamiento(String nombreTratamiento) {
        this.nombreTratamiento = nombreTratamiento;
    }

    @Override
    public String toString() {
        return "┌───────────────────────────────────────────────┐\n" +
                "│ Tratamiento: " + nombreTratamiento + "\n" +
                "│ ID Tratamiento: " + id_tratamiento + "\n" +
                "│ Descripción: " + descripcion + "\n" +
                "│ Especialidad: " + nombreEspecialidad + "\n" +
                "│ ID Especialidad: " + id_especialidad + "\n" +
                "│ Médico: " + nombreMedico + "\n" +
                "│ ID Médico: " + id_medico + "\n" +
                "└───────────────────────────────────────────────┘\n";
    }

}
