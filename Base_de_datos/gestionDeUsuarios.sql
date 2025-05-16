/* mysql -u root -p -h para conectaros a un host externo*/

/* Para este tema las tabalas que nos interesan son user, db, tabl_priv, columns_priv*/

use mysql

select * from user \G;    /* El \G es para una vista vertival de la tabla. */

/*El usuario root tiene todos los privilegios*/

create user "roly"@"localhost"; /*crear el usuario roly*/

select * from user where user = "roly" \G;

set password for "roly"@"localhost" = "12345678"; /* Poner una contraseña al usuario roly */

create user "roly"@"localhgost" identified by "1234"; /* crear el usuario roly poniéndole directamente una contraseña */

/*Ejercicios---------------------------------------------*/

/* 1 */

create user "prueba1"@"%" identified by "1234";

/* 2a */

create user "prueba2"@"192.168.1.%" identified by "abc123.";

/*2b*/

select * from user where user = "prueba2" \G;

/*2c*/

drop user "prueba2"@"192.168.1.%";

delete from user where user = "prueba2";

/*2d*/

create user "prueba2"@"192.168.1.%" identified by "abc123.";



/*3*/

grant select, insert, update, delete, create, drop on bd_empleados.* to "prueba1"@"%";

/*4*/

grant select on *.* to "prueba2"@"192.168.1.%";

/*5ab*/

 /*desde afuera de /mysql*/
 
 -u prueba1 -p /*con su contraseña abc123.*/
 show database;
 select * from bd_empleados;
 insert into tcentr values(30, "sede de teis", "vigo");
 
 
 /*5c*/
 
 revoke insert on bd_empleados.* from "prueba1"@"%";
 
 /*5d*/
 
 select * from bd_empleados;
 
 /*6*/
 
 revoke all PRIVILEGES on bd_empleados.* from "prueba1"@"%";
 
 /*7*/
 
 grant select on bd_empleados.tcentr to "prueba1"@"%";
 
 /*8*/
 
 grant select (numde, nomde) on bd_empleados.tdepto to "prueba1"@"%";

/*9a*/

 select * from user where user = "prueba1"\G;
 select * from db where user = "prueba1" \G;
 select * from tables_priv where user = "prueba1" \G;
 select * from columns_priv where user = "prueba1" \G;

/*9b*/

 drop user "prueba2";
 drop user "prueba1"; 

/*10a*/

create user "prueba3"@"localhost" identified by "abc123.";

/*10b*/

grant select on bd_empleados.tdepto to "prueba3"@"localhost";

/*10c*/

