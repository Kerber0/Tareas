/*EjerciciosProcedimientos1*/

/*1*/
delimiter //
create procedure incrementar (inout numero integer)
begin
set numero=numero +1;
end //

/*2*/
create procedure diaSemana (numDia int)
begin
case numDia
when 1 then select "Lunes" as "Día";
when 2 then select "Martes" as "Día";
when 3 then select "Miércoles" as "Día";
when 4 then select "Jueves" as "Día";
when 5 then select "Viernes" as "Día";
when 6 then select "Sábado" as "Día";
when 7 then select "Domingo" as "Día";
end case;
end //

/*3*/
create procedure convertirMayus2 (palabra varchar(255))
begin
if length(palabra)>=3 then
select upper(left(palabra, 3)) as "3 primeras mayus";
else select "La caden debe tener al menos 3 caracteres";
end if;
end //

/*4*/
create procedure concatenarCadenas(in cadena1 char(100), in cadena2 char(100))
begin
declare total char(200);
set total = upper(concat (cadena1, cadena2));
select total  as "Concatenadas";
end //

/*5*/
create function Hipotenusa(cateto1 double, cateto2 double)
returns double
deterministic
begin
declare hipo double;
set hipo = sqrt(pow(cateto1, 2) + pow(cateto2, 2));
return hipo;
end //

/*6*/
create function puntos()
returns int
deterministic
begin


/*7*/
create function divisible(a int, b int)
returns int
deterministic
begin
declare resto double;
set resto = mod(a, b);
if resto = 0 then 
return 1;
else return 0;
end if;
end //

/*8*/
create function mayorDeTres(n1 int, n2 int, n3 int)
returns int
deterministic
begin
declare mayor int;
if n1 > n2 then
set mayor = n1;
else set mayor = n2;
end if;
if n3 > mayor then
set mayor = n3;
end if;
return mayor;
end //

/*9*/
create function resultadoBinario(resultado char(7))
returns int
deterministic
begin
declare equipoLocal int;
declare visitante int;
set equipoLocal = substring_index(resultado,"-",1);
set visitante = substring_index(resultado,"-", -1);
if visitante > equipoLocal then
return 1;
else return 0;
end if;
end//

/*10*/
create procedure palindromo(palabra char(100))
begin
if palabra = reverse(palabra) then select "sí" as "palíndromo";
else select "no" as "palíndromo";
end if;
end //

/*11*/ /*No tenemos tabla*/

/*12*/
create function insertarMovimiento(fecha date, cantidad double, dni int, cod_cuenta int)
returns int
deterministic
begin
if fecha > curdate() then
	return 0;
end if;
if (select saldo from contas where cod_cuenta = cod_conta) + cantidad >= 0 then
	insert into movementos(datahora, cantidade, dni, cod_conta) 
	values (fecha, cantidad, dni, cod_cuenta);
	return 1;
else return 0;
	end if;
update contas set saldo = saldo + cantidad where cod_cuenta = cod_conta;
end//

/*13*/

create procedure sumaEnteros(n int)
begin
declare i int default 1;
declare suma int default 0;
while i <= n do
	set suma = suma +i;
	set i = i + 1;
end while;
select suma;
end//

/*14*/


/*15*/
create function 

/*16*/

/*17*/

/*18*/

create procedure randomMovemento(n int) /*No terminado*/
begin
declare i int default 1;
declare suma int default 0;
declare maximo int;
declare randomm int;
declare v_dni int;
declare v_cod_conta int;
select floor(rand()*34) + 1 into randomm;
select max(cod_conta) from movementos into maximo;
while i <= n do
	select dni, cod_conta from movementos into v_dni, v_cod_conta where cod_conta = randomm;
	insert into movementos(datahora, cantidade, dni, cod_conta) 
    values (curdate(), randomm, v_dni, v_cod_conta);
	set i = i + 1;
    update contas set saldo = saldo + cantidad where cod_cuenta = cod_conta;
end while;
end//



/*19*/

/*20*/

create procedure muestradatos()
begin

/*Declaramos variables*/

declare ultima_fila int;
declare v_dni int;
declare v_cod_conta int;
declare v_saldo int;
declare c_datos cursor for select dni, cod_conta, saldo 
from contas join clientes on codigo_cliente = cod_cliente
where saldo < 0;
declare continue handler for not found set ultima_fila = 1;
open c_datos;
set ultima_fila = 0;

fetch c_datos into v_dni, v_cod_conta, v_saldo;

while ultima_fila = 0 do
	select v_dni as DNI, v_cod_conta as Conta, v_saldo as saldo;
	fetch c_datos into v_dni, v_cod_conta, v_saldo;
end while;
end//

/*21*/

create procedure sumaDeIngresos()
begin

/*Declaramos variables*/

declare ultima_fila int default 0;
declare v_conta int;
declare v_cantidade int;

/*Declaramos cursores*/
declare c_ingresos cursor for select cod_conta, sum(cantidade) from movementos
where cantidade > 0
group by cod_conta;

declare c_gastos cursor for select cod_conta, sum(cantidade) from movementos
where cantidade < 0
group by cod_conta;

declare continue handler for not found set ultima_fila = 1;

open c_ingresos;

fetch c_ingresos into v_conta, v_cantidade;

while ultima_fila = 0 do
	select v_conta as cuenta, v_cantidade as cantidad;
	fetch c_ingresos into v_conta, v_cantidade;
end while;

open c_ingresos;
set ultima_fila = 0;

fetch c_ingresos into v_conta, v_cantidade;

while ultima_fila = 0 do
	select v_conta as cuenta, v_cantidade as cantidad;
	fetch c_gastos into v_conta, v_cantidade;
end while;
close c_gastos;
end//


/*22*/



/* -----------------    TRIGGERS      -----------------------------------*/


/* Crea un trigger que actualice el saldo de una cuenta cunado se realice un movimiento */

create TRIGGER actualizar AFTER
INSERT on movementos
for EACH ROW
begin
	update contas set
	saldo = saldo + new.cantidad
	where cod_conta = new.cod_conta;
end//

/* Crear tabla números rojos */

create table nrojos(dni int, cod_conta int, fecha date, saldo int, primary key(dni, cod_conta, fecha),
foreign key (dni) references clientes (dni),
foreign key (cod_conta) references contas (cod_conta)
);

/* 01 */



create TRIGGER numerorojos AFTER
update on contas
for EACH ROW
begin
if new.saldo < 0 then
	insert into nrojos values (
    (select distinct dni from movementos where cod_conta = old.cod_conta),
    old.cod_conta
    curdate(),
    new.saldo);
    end if;
end//

