public class Ejercicio3 {

    public static void ejercicio() {

        // 1) Crear y arrancar Tarea1
        Thread hilo1 = new Ejercicio1("Hilo-Tarea1");
        hilo1.start();

        // 2) Esperar a que termine Tarea1 (sin tocar Main)
        try {
            hilo1.join();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        // 3) Crear y arrancar Tarea2 SOLO cuando Tarea1 terminó
        Thread hilo2 = new Thread(new Ejercicio2(), "Hilo-Tarea2");
        hilo2.start();

        // (Opcional) esperar también a que termine Tarea2
        try {
            hilo2.join();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        System.out.println("Ejercicio3: ambas tareas finalizadas");
    }
}
