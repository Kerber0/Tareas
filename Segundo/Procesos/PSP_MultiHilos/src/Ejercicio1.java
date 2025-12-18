public class Ejercicio1 extends Thread {

    private boolean activo = true;

    public Ejercicio1(String s) {
    }

    @Override
    public void run() {
        while (activo) {
            System.out.println("Soy el hilo: " + getName());
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
        Ejercicio1 hilo = new Ejercicio1("Hilo Thread");
        hilo.start();

        try {
            Thread.sleep(3000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        hilo.parar();
    }
}






