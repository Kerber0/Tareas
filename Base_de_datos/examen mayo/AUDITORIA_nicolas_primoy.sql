/*1 */

drop database ebanca;
source "examenebanca.sql";


/*2*/

delimiter //
create trigger tri_auditoria AFTER INSERT on movementos
for each row
begin
insert into audit_examen values (
	id_movementos, user(), curdate(), cod_conta, dni, (select cantidade from movementos where id_movemento = id_movemento));
update contas set
	saldo = saldo + cantidad
	where cod_conta = new.cod_conta;
end//

delimiter ;
	
/*3*/

create user "alumno"@"localhost" identified by "abc123=";


grant  insert on examenebanca.movementos to "alumno"@"localhost";
grant update on examenebanca.contas to "alumno"@"localhost";

	
/*4*/
	
select * from audit_examen into outfile "C:\Users\a24nicolasmpp\Desktop\Tareas\Base_de_datos\examen mayo\auditoria.txt"
		FIELDS
 TERMINATED BY ','
 OPTIONALLY ENCLOSED BY "\""
 LINES
 TERMINATED BY '\n';
 
 
 /*5*/

delimiter //
create procedure crea_cuentas ( saldo int,  cod_cliente int)
begin
declare cod int;
set cod = ((select cod_conta from contas order by cod_conta desc limit 1)+1);
	insert into contas values ( curdate(), saldo, cod ,cod_cliente);
end//

delimiter ;

drop procedure crea_cuentas;

call crea_cuentas (100, 1654);


/*6*/


delimiter //
create function balance_anual ( fecha date)
returns double COMMENT 'Balance anual'
begin
declare suma double;

if fecha < year(curdate())
then
 set suma = 0;
ELSE
 set suma = sum(select cantidade form movementos where year(datahora) = year(fecha));
 end if;
 return suma;
 
end//
delimiter ;