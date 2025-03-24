/*Ejemplos de procedimientos:*/

delimiter // /*Esto se utiliza para personalizar nuestro delimitador del final, en este caso ponemos "//"*/

/*Ej1*/
create procedure listado1() begin select * from emp; end//

call listado1();

/*Ej2*/
create procedure damesalario(in nombre char(25))
begin select emp_salario as salario from emp where emp_nome = nombre; end //
call damesalario("Xacobe")//

/*Ej3*/
create procedure damesalario2 (in nombre char(20), out salario decimal(8,2))
begin 
select emp_salario as salario from emp where emp_nome = nombre into salario; 
/*Lo almacenamos en una variable local con el "into salario" */
end //
call damesalario2("Rei", @pepe)// /*lo almacenamos en una variable global #pepe*/
select @pepe//
/*Salida esperada*/
+------------+
|   @pepe    | 
+------------+
|   950.00   |
+------------+

/*Ej4*/
create procedure doble(inout dato int)
begin
set dato = dato*2;
end //
set @dato = 2;
call doble(@dato)//
select @dato//
/*Salida esperada*/
+------------+
|   @dato    | 
+------------+
|      4     |
+------------+