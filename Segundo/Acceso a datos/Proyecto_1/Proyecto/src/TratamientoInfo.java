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
                           String nombreEspecialidad, String nombreTratamiento, String descripcion) {
        this.id_tratamiento = id;
        this.id_medico = id_medico;
        this.id_especialidad = id_especialidad;
        this.nombreMedico = nombreMedico;
        this.nombreEspecialidad = nombreEspecialidad;
        this.nombreTratamiento = nombreTratamiento;
        this.descripcion = descripcion;
    }

    public int getId_tratamiento() {
        return id_tratamiento;
    }

    public void setId_tratamiento(int id_tratamiento) {
        this.id_tratamiento = id_tratamiento;
    }

    public int getId_medico() {
        return id_medico;
    }

    public void setId_medico(int id_medico) {
        this.id_medico = id_medico;
    }

    public int getId_especialidad() {
        return id_especialidad;
    }

    public void setId_especialidad(int id_especialidad) {
        this.id_especialidad = id_especialidad;
    }

    public String getNombreTratamiento() {
        return nombreTratamiento;
    }

    public void setNombreTratamiento(String nombre) {
        this.nombreTratamiento = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getNombreMedico() {
        return nombreMedico;
    }

    public void setNombreMedico(String nombreMedico) {
        this.nombreMedico = nombreMedico;
    }

    public String getNombreEspecialidad() {
        return nombreEspecialidad;
    }

    public void setNombreEspecialidad(String nombreEspecialidad) {
        this.nombreEspecialidad = nombreEspecialidad;
    }

    @Override
    public String toString() {
        return  "┌───────────────────────────────────────────────┐\n" +
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
