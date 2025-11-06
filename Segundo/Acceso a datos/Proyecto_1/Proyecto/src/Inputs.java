import java.util.Scanner;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;

public class Inputs {
    private static final Scanner sc = new Scanner(System.in);

    String input(String text) {
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

    int inputInt(String text) {
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

    String inputEmail(String text) {
        boolean valido = false;
        String email = "";

        while (!valido) {
            System.out.println(text);
            email = sc.nextLine().trim();

            if (email.isEmpty()) {
                System.out.println("Error: Debe ingresar un correo electrónico.");
                continue;
            }

            // Expresión regular para validar formato de email
            if (!email.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$")) {
                System.out.println("Error: Formato de correo electrónico inválido.");
                continue;
            }

            valido = true;
        }

        return email;
    }

    LocalDate inputFechaNacimiento(String text) {
        boolean valido = false;
        LocalDate fechaNacimiento = null;
        DateTimeFormatter formato = DateTimeFormatter.ofPattern("dd/MM/yyyy");

        while (!valido) {
            System.out.println(text + " (formato: dd/MM/yyyy)");
            String input = sc.nextLine().trim();

            if (input.isEmpty()) {
                System.out.println("Error: Debe ingresar una fecha.");
                continue;
            }

            try {
                fechaNacimiento = LocalDate.parse(input, formato);

                // Verificar que no sea una fecha futura
                if (fechaNacimiento.isAfter(LocalDate.now())) {
                    System.out.println("Error: La fecha no puede ser futura.");
                    continue;
                }

                // Verificar que no sea una edad irreal (ej: más de 120 años)
                if (fechaNacimiento.isBefore(LocalDate.now().minusYears(120))) {
                    System.out.println("Error: La fecha ingresada es demasiado antigua.");
                    continue;
                }

                valido = true;

            } catch (DateTimeParseException e) {
                System.out.println("Error: Formato inválido. Use dd/MM/yyyy (ej: 25/12/2000).");
            }
        }

        return fechaNacimiento;
    }

}
