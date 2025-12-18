public class Ejercicio2 implements Runnable {

    private boolean activo = true;

    @Override
    public void run() {
        while (activo) {
            System.out.println("Soy el hilo: " + Thread.currentThread().getName());
            try {
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                activo = false;
            }
        }
        System.out.println("Hilo finalizado");
    }

    public void parar() {
        activo = false;
    }

    public static void ejercicio() {

        Ejercicio2 tarea = new Ejercicio2();
        Thread hilo = new Thread(tarea, "Hilo-Runnable");

        hilo.start();

        try {
            Thread.sleep(3000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        tarea.parar();
    }
}
