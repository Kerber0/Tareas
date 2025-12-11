package direjecproceso;

import java.io.File;
import java.util.Arrays;
import java.io.IOException;
import java.time.Instant;

public class DirEjecProceso {

    public static void main(String[] args) {
        System.out.println(" ### PRUEBA SENCILLA ###");

        ProcessBuilder pb = new ProcessBuilder("cmd", "/c", "dir");
        pb.inheritIO();
        System.out.printf("Ejecución de %s en directorio: %s\n", pb.command(), pb.directory());
        try {
            pb.start().waitFor();
        } catch (IOException | InterruptedException ex) {
            ex.printStackTrace();
        }

        System.out.println("---------------");
        System.out.printf("Directorio actual: %s\n", System.getProperty("user.dir"));
        System.out.println("---------------");

        // Ejecutar en otro directorio (por ejemplo, C:\Windows)
        pb.directory(new File("C:\\Windows"));
        System.out.printf("Ejecución de %s en directorio: %s\n", pb.command(), pb.directory());
        try {
            pb.start().waitFor();
        } catch (IOException | InterruptedException ex) {
            ex.printStackTrace();
        }

        System.out.println("---------------");

        pb = new ProcessBuilder("cmd", "/c", "tree");
        pb.inheritIO();
        System.out.printf("Ejecución de %s en directorio: %s\n", pb.command(), pb.directory());
        try {
            pb.start().waitFor();
        } catch (IOException | InterruptedException ex) {
            ex.printStackTrace();
        }

        System.out.println("---------------");

        pb.directory(new File("C:\\Windows"));
        System.out.printf("Ejecución de %s en directorio: %s\n", pb.command(), pb.directory());
        try {
            pb.start().waitFor();
        } catch (IOException | InterruptedException ex) {
            ex.printStackTrace();
        }

        System.out.println("---------------");
        System.out.println(" ### PRUEBA DETALLADA ###");

        String[] comandoAEjecutar = new String[]{"cmd", "/c", "dir"};
        ejecutaProceso(null, comandoAEjecutar);
        ejecutaProceso("C:\\Windows", comandoAEjecutar);

        comandoAEjecutar = new String[]{"cmd", "/c", "tree"};
        ejecutaProceso(null, comandoAEjecutar);
        ejecutaProceso("C:\\Windows", comandoAEjecutar);
    }

    public static int ejecutaProceso(String directorio, String... lineaComandosProceso) {
        System.out.printf(">>>> Ejecución de proceso para ejecutar: %s en directorio: %s\n",
                Arrays.toString(lineaComandosProceso), directorio);

        ProcessBuilder pb = new ProcessBuilder(lineaComandosProceso);
        if (directorio != null) {
            pb.directory(new File(directorio));
        }

        pb.inheritIO();
        int codRet = 0;
        try {
            Process p = pb.start();

            System.out.printf("(proceso en ejecución: %s)\n", p.isAlive() ? "Sí" : "No");
            System.out.printf("(info. proceso): directorio: %s\n", pb.directory());
            System.out.printf("(info. proceso): arguments: %s\n",
                    Arrays.toString(p.info().arguments().orElse(new String[0])));
            System.out.printf("(info. proceso): comando: %s\n",
                    p.info().command().orElse("(no hay comando)"));
            System.out.printf("(info. proceso): inicio: %s\n",
                    p.info().startInstant().orElse(Instant.MIN));
            System.out.printf("(info. proceso): PID: %d\n", p.pid());
            System.out.printf("(info. proceso): user: %s\n",
                    p.info().user().orElse("No definido usuario"));

            codRet = p.waitFor();
            System.out.println("<<<< Fin de ejecución");
            System.out.printf("--> Código de retorno: %d (%s)\n",
                    codRet, codRet == 0 ? "ejecución correcta" : "ERROR");
        } catch (IOException ex) {
            System.err.println("Error durante ejecución del proceso");
            ex.printStackTrace();
        } catch (InterruptedException ex) {
            System.err.println("Proceso interrumpido");
        }
        return codRet;
    }
}
