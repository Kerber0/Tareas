/*EjerciciosProcedimientos1*/

/*1*/
delimiter //
create procedure ListaxeEmpregados() 
begin select emp_numero, emp_nome, emp_posto, dep_nome from emp
join dep on emp_depnum = dep_nome; end//


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
create FUNCTION divisible(a int, b int)
RETURNs int 
deterministic
begin
declare resto DOUBLE;
set resto = mod(a,b);
if resto = 0 then
RETURN 1;
else RETURN 0;
end if;
return mayor;
end//


/*8*/

DELIMITER //

CREATE FUNCTION mayorDeTres(a INT, b INT, c INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE mayor INT;

    SET mayor = a;

    IF mayor < b THEN
        SET mayor = b;
    ELSEIF mayor < c THEN
        SET mayor = c;
    END IF;

    RETURN mayor;
END;



/*9*/

CREATE FUNCTION ganador(resultado CHAR(7))
RETURNS CHAR(1)
DETERMINISTIC
BEGIN
    DECLARE hogar INT;
    DECLARE visitante INT;

    SET hogar = CAST(SUBSTRING_INDEX(resultado, '-', 1) AS int);
    SET visitante = CAST(SUBSTRING_INDEX(resultado, '-', -1) AS int);

    IF hogar > visitante THEN
        RETURN '1';
    ELSE
        RETURN '0';
    END IF;
END //


/*10*/

create procedure palindromo(palabra char(10))
begin
if palabra = reverse(palabra) then
select "si" as "Palíndromo";
else select  "no" as "Palíndromo";
end if;
end// 


/*11*/

/*12*/

/*13*/