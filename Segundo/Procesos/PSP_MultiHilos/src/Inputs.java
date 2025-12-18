import java.util.Scanner;

public class Inputs {
    final static Scanner sc = new Scanner(System.in);

    public static Integer inputInt(String text) {
        int num = -1;
        boolean valido = false;

        while (!valido) {
            try {
                System.out.println(text);
                num = Integer.parseInt(sc.nextLine());
                valido = true;
            } catch (NumberFormatException e) {
                System.out.println("Error: Por favor ingrese un número válido.");
            }
        }
        return num;
    }

    public static String input(String text) {
        boolean textcorrect = false;
        String resultado;
        do {
            System.out.println(text);
            resultado = sc.nextLine();
            if (resultado.isEmpty()) {
                System.out.println("Se debe ingresar algo.");
            } else {
                textcorrect = true;
            }
        } while (!textcorrect);
        return resultado;
    }

    public static String inputEmail(String text) {
        boolean valido = false;
        String email = "";

        while (!valido) {
            System.out.println(text);
            email = sc.nextLine().trim();

            if (email.isEmpty()) {
                System.out.println("Error: Debe ingresar un correo electrónico.");
                continue;
            }

            if (!email.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$")) {
                System.out.println("Error: Formato de correo electrónico inválido.");
                continue;
            }

            valido = true;
        }

        return email;
    }

    public static Double inputDouble(String text) {
        double num = -1;
        boolean valido = false;

        while (!valido) {
            try {
                System.out.println(text);
                num = Double.parseDouble(sc.nextLine());
                valido = true;
            } catch (NumberFormatException e) {
                System.out.println("Error: Por favor ingrese un número decimal válido.");
            }
        }
        return num;
    }


}
