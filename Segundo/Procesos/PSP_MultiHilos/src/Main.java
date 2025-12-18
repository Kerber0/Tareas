// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
public class Main {
    public static void main(String[] args) {
        inicio();
    }


    private static void inicio(){
        int opcion;

        do {
            opcion = Inputs.inputInt("""
                    
                    1 - Ejercicio 1.
                    2 - Ejercicio 2.
                    3 - Ejercicio 3.
                    4 - Ejercicio Filosofos.
                    0 - Salir.
                    """);

            switch (opcion) {
                case 1 -> Ejercicio1.ejercicio();
                case 2 -> Ejercicio2.ejercicio();
                case 3 -> Ejercicio3.ejercicio();
                case 4 -> EjercicioFilosofos.ejercicio();
                case 0 -> System.out.println("Adios.");
            }

        }while (opcion != 0);

    }

}