import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.EventListener;
import java.util.Scanner;

public class PostgresConn {
    static Scanner sc = new Scanner(System.in);
    public static PostgresConn instance;
    private static Connection conn;
    private String url = "jdbc:postgresql://localhost:5432/examenud1";
    private String user = "postgres";
    private String pass = "abc123.";


    private PostgresConn() {
        try {
            conn = DriverManager.getConnection(url, user, pass);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static PostgresConn getInstance() {
        if (instance == null) {
            instance = new PostgresConn();
        }
        return instance;
    }

    static void crearEsquema() throws SQLException {
        final String sql = """
                CREATE SCHEMA desguace
                """;

        try (var ps = conn.prepareStatement(sql)) {
            int rs = ps.executeUpdate();

            System.out.printf("Esquema creado");

        }

    }

    static void crearTipoComponente() throws SQLException {
        final String sql = """
                CREATE TYPE desguace.Componente AS (
                	    nombre VARCHAR(255),
                	    precio DOUBLE PRECISION,
                	    tamanio INTEGER
                	)
                """;
        try (var ps = conn.prepareStatement(sql)) {
            int rs = ps.executeUpdate();

            System.out.println("Type creado con exito");
        }
    }

    static void insertarVenta() throws SQLException {
        final String sql = """
                INSERT INTO concesionario.Ventas (cliente_id, coche_id,  fecha_venta, precio_venta)
                	VALUES (4, 5, '2018-02-20', 4000.00);
                """;

        try (var ps = conn.prepareStatement(sql)) {
            int rs = ps.executeUpdate();

            if (rs > 0) {
                System.out.println("Se vende el coche con id: 2, al cliente con id 2");
            } else {
                System.out.println("No se pudo realizar la venta");
            }
        }

    }

    static void actualizarCoche() throws SQLException {
        final String sql = """
                UPDATE concesionario.COCHES
                SET   (detalle_coches.año_fabricacion)  1999
                WHERE coche_id = 1
                """;
        try (var ps = conn.prepareStatement(sql)) {
            int row = ps.executeUpdate();

            if (row > 0) {
                System.out.println("Vehiculo modificado");
            } else {
                System.out.println("No se pudo modificar el vehiculo.");
            }
        }
    }

    static void eliminarCoche() throws SQLException {
        final String sql1 = """
                DELETE FROM concesionario.Ventas coche_id
                WHERE coche_id = 1
                """;
        final String sql2 = """
                DELETE FROM concesionario.Coches
                WHERE coche_id = 1
                """;

        try (var ps1 = conn.prepareStatement(sql1);
             var ps2 = conn.prepareStatement(sql2)) {

            conn.setAutoCommit(false);
            try {
                int rs1 = ps1.executeUpdate();
                conn.commit();
                try {
                    int rs2 = ps2.executeUpdate();
                    conn.commit();
                    if (rs1 > 0 && rs2 > 0) {
                        System.out.println("Vehiculo eliminado correctamente el coche con id 1.");
                    } else {
                        System.out.println("Error al borrar un coche.");
                        conn.rollback();
                    }
                } catch (SQLException e) {
                    System.out.println("Error: " + e.getMessage());
                }
            } finally {
                conn.setAutoCommit(false);
            }
        }


    }

    static void consulta1() throws SQLException {
        final String sql = """
                SELECT AVG((datos_personales).edad) as promedio
                FROM concesionario.Clientes
                """;

        try (var ps = conn.prepareStatement(sql)) {
            try (var rs = ps.executeQuery()) {
                if (rs.next()) {
                    System.out.println("Edad promedio de clientes: " +
                            rs.getDouble("promedio") +
                            " años.");
                } else {
                    System.out.println("No se pudo obtener la informacion.");
                }
            }
        }
    }

    static void consulta2() throws SQLException {
        final String sql = """
                SELECT (datos_personales).cedula as cedula,
                (datos_personales).especialidad as especialidad
                FROM concesionario.Vendedores
                """;
        try (var ps = conn.prepareStatement(sql)) {
            try (var rs = ps.executeQuery()) {

                if (rs.next()) {
                    System.out.println("Lista de vendedores y sus especialidades: \n");
                    do {
                        System.out.println("Cedula vendedor: " +
                                rs.getString("cedula") +
                                " , Especialidad: " + rs.getString("especialidad") +
                                "\n");
                    } while (rs.next());
                } else {
                    System.out.println("No se pudo mostrar la informacion.");
                }
            }
        }
    }

    static void consulta3() throws SQLException {
        final String sql = """
                SELECT (c.datos_personales).nombre as  nombre,
                (x.detalles_coche).modelo as modelo
                FROM concesionario.Clientes  as c
                JOIN concesionario.Ventas as v
                ON c.cliente_id = v.cliente_id
                JOIN concesionario.Coches as x
                On v.coche_id = x.coche_id
                WHERE (c.datos_personales).edad > 30
                """;
        try (var ps = conn.prepareStatement(sql)) {
            try (var rs = ps.executeQuery()) {

                if (rs.next()) {
                    System.out.println("Coches preferidos para cada cliente mayor de 30 años: \n");
                    do {
                        System.out.println("Cliente: " +
                                rs.getString("nombre") +
                                ", Modelo coche preferido: " +
                                rs.getString("modelo"));

                    } while (rs.next());
                } else {
                    System.out.println("No se pudo realizar la operacion");
                }

            }

        }
    }

    static void consulta4() throws SQLException {
        final String sql = """
                SELECT c.coche_id, (c.detalles_coche).modelo as modelo,
                (c.detalles_coche).año_fabricacion as anio,
                (v.datos_personales).cedula as cedula
                FROM concesionario.Coches as c
                JOIN concesionario.Vendedores as v
                ON c.vendedor_id = v.vendedor_id
                WHERE c.coche_id = 4
                """;

        try (var ps = conn.prepareStatement(sql);
                var rs = ps.executeQuery()){
            if (rs.next()) {
                System.out.println("Lista coches y vendendor: \n");
                do {
                    System.out.println("Modelo: " +
                            rs.getString("modelo") +
                            " , Año de fabricaicon: " +
                            rs.getInt("anio") +
                            " , Cedula de vendedor: " +
                            rs.getString("cedula"));

                }while (rs.next());
            }else {
                System.out.println("No se pudo realizar la operacion");
            }
        }
    }

    static void consulta5() throws SQLException {
        final String sql = """
                SELECT (v.datos_personales).cedula as cedula,
                COUNT(x.coche_id) as ventas
                FROM concesionario.Ventas as x
                JOIN concesionario.Vendedores as v
                ON x.venta_id = v.vendedor_id
                JOIN concesionario.Coches as c
                ON x.coche_id = c.coche_id
                GROUP BY cedula
                """;
        try (var ps = conn.prepareStatement(sql)){
            try (var rs = ps.executeQuery()){

                if(rs.next()) {
                    System.out.println("Lista de vendendores: \n");
                    do {
                        System.out.println("Cedula: " +
                                rs.getString("cedula") +
                                ", Numero de ventas: " + rs.getInt("ventas"));
                    }while (rs.next());
                } else {
                    System.out.println("No se pudo realizar la operacion");
                }
            }
        }
    }

    static void consulta6() throws SQLException {
        final String sql = """
                SELECT (v.datos_personales).cedula as cedula,
                (v.datos_personales).especialidad as especialidad,
                COUNT(x.venta_id)  as ventas
                FROM concesionario.Vendedores as v
                JOIN concesionario.Coches as c
                ON v.vendedor_id = c.vendedor_id
                JOIN concesionario.Ventas as x
                ON c.coche_id = x.coche_id
                WHERE ventas = 0
                """;

        try (var ps = conn.prepareStatement(sql)){
            try (var rs = ps.executeQuery()){

                if(rs.next()) {
                    System.out.println("Lista vendedores sin ventas: \n");
                    do {
                        System.out.println("Cedula: " +
                                rs.getString("cedula") +
                                ", Especialidad: " + rs.getString("especialidad"));

                    }while (rs.next());
                }

            }

        }


    }


    public static String pedirString(String mensaje) {
        String msj = sc.next();
        System.out.println(mensaje);
        sc.close();
        return msj;
    }

    public static int pedirInt(String mensaje) {
        while (true) {
            try {
                System.out.println(mensaje);
                return sc.nextInt();
            } catch (Exception e) {
            }
        }
    }


}
