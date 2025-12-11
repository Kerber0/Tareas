import java.io.IOException;

public class Ej1 {
    public static void main(String[] args) {
        if (args.length == 0) {
            System.out.println("Uso: java Ej1 <comando>");
            return;
        }

        String comando = String.join(" ", args);

        try {
            System.out.println("Ejecutando comando: " + comando);
            Process proceso = Runtime.getRuntime().exec("cmd /c " + comando);
            int codigoSalida = proceso.waitFor();
            System.out.println("Proceso finalizado con código: " + codigoSalida);
        } catch (IOException e) {
            System.out.println("Error al ejecutar el comando: " + e.getMessage());
        } catch (InterruptedException e) {
            System.out.println("Ejecución interrumpida.");
        }
    }
    psv
}


