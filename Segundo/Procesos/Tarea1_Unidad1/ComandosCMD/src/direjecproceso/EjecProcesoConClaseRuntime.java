package direjecproceso;

import java.io.IOException;
import java.util.Arrays;

public class EjecProcesoConClaseRuntime {

    public static void main(String[] args) {

        if (args.length < 1) {
            System.err.println("ERROR: Especificar comando a ejecutar. Ejemplo:");
            System.err.println("    java EjecProcesoConClaseRuntime dir");
            System.exit(1);
        }

        try {
            // Convertir los argumentos en un comando completo para Windows
            // "cmd /c" ejecuta el comando que le sigue y luego cierra el intérprete
            String[] comando = new String[args.length + 2];
            comando[0] = "cmd";
            comando[1] = "/c";
            System.arraycopy(args, 0, comando, 2, args.length);

            System.out.println("Ejecutando comando: " + Arrays.toString(comando));
            Process proceso = Runtime.getRuntime().exec(comando);
            proceso.waitFor(); // Esperar a que termine la ejecución

            int codigo = proceso.exitValue();
            System.out.println("El proceso terminó con código: " + codigo);

        } catch (IOException | InterruptedException ex) {
            System.err.println("ERROR al ejecutar el comando:");
            ex.printStackTrace();
        }
    }
}
