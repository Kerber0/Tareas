import java.sql.SQLException;

public class Main {


    public static void main(String[] args) {
        menu();
    }


    private static void menu() {
        int opcion;

        try {
            do {
                opcion = pedirInt("""
                        
                        ------------------------
                        
                        Seleccione la opcion deseada:
                        
                        1. Crear esquema desguace
                        2. Crear tipo Componente
                        3. Insertar nueva venta
                        4. Actualizar la información de un coche
                        5. Eliminar la información de un coche
                        6. Consulta 1
                        7. Consulta 2
                        8. Consulta 3
                        9. Consulta 4
                        10. Consulta 5
                        11. Consulta 6
                        0. Salir
                        
                        ------------------------------------------
                        
                        """);


                switch (opcion) {
                    case 1 -> PostgresConn.getInstance().crearEsquema();
                    case 2 -> PostgresConn.getInstance().crearTipoComponente();
                    case 3 -> PostgresConn.getInstance().insertarVenta();
                    case 4 -> PostgresConn.getInstance().actualizarCoche(); //ver Query
                    case 5 -> PostgresConn.getInstance().eliminarCoche();
                    case 6 -> PostgresConn.getInstance().consulta1();
                    case 7 -> PostgresConn.getInstance().consulta2();
                    case 8 -> PostgresConn.getInstance().consulta3();
                    case 9 -> PostgresConn.getInstance().consulta4();
                    case 10 -> PostgresConn.getInstance().consulta5();// ver Query
                    case 11 -> PostgresConn.getInstance().consulta6(); // ver Query
                    case 0 -> System.out.println("Adios.");
                    default -> System.out.println("Opcion ingresada invalida, pruebe otra vez.");
                }


            } while (opcion != 0);

        } catch (SQLException e) {
            System.out.printf("Error: " + e.getMessage());
        }
    }

    public static int pedirInt(String mensaje) {
        while (true) {
            try {
                System.out.println(mensaje);
                return PostgresConn.sc.nextInt();
            } catch (Exception e) {
            }
        }
    }

}