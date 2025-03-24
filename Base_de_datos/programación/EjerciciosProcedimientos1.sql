/*EjerciciosProcedimientos1*/

/*1*/
create procedure ListaxeEmpregados() 
begin select * from emp; end//

/*2*/
call ListaxeEmpregados()//

/*3*/
create procedure PostoEmpregado2(numeroEmpleado int)
begin select emp_nome as nombre, emp_posto as puesto from emp where emp_num = numeroEmpleado; end//

/*4*/
call PostoEmpregado3(null)//

/*5*/
create procedure PostoEmpregado4(in numeroEmpleado int)
begin
declare empleadoExiste int;
select count(*) into empleadoExiste from emp where emp_num = numeroEmpleado;
if empleadoExiste = 0 then
select "El empleado no existe";
else
select emp_nome as nombre, emp_posto as puesto from emp where emp_num = numeroEmpleado;
end if;
end//

/*7*/
call PostoEmpregado4(null)//
