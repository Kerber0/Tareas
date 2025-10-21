import java.util.Scanner;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;

public class Inputs {
    static Scanner sc = new Scanner(System.in);

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

    Integer inputInt(String text) {
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

    String inputDNI(String text) {
        boolean valido = false;
        String dni = "";

        while (!valido) {
            System.out.println(text);
            dni = sc.nextLine().toUpperCase().trim();

            if (dni.isEmpty()) {
                System.out.println("Error: Debe ingresar un DNI.");
                continue;
            }

            // Verificar formato: 8 números + 1 letra
            if (!dni.matches("\\d{8}[A-Z]")) {
                System.out.println("Error: El formato debe ser 8 dígitos seguidos de una letra. Ejemplo: 12345678Z");
                continue;
            }

            // Validar letra del DNI
            String letras = "TRWAGMYFPDXBNJZSQVHLCKE";
            int numero = Integer.parseInt(dni.substring(0, 8));
            char letraCorrecta = letras.charAt(numero % 23);

            if (dni.charAt(8) != letraCorrecta) {
                System.out.println("Error: La letra no coincide con el número. Debería ser " + letraCorrecta);
            } else {
                valido = true;
            }
        }

        return dni;
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
