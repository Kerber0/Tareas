
/*1.a*/

mysqldump -u root -p bd_empleados --databases > bd_empleados_backup.sql;

/*1.b*/

drop database bd_empleados;
 source bd_empleados_backup.sql;

/*1.c*/

mysqldump -u root -p bd_empleados tcentr tdepto > centr_dpto_backup.sql;

/*1.d*/

mysqldump -u root -p bd_empleados temple  --where "numde = 100"  > empl_100_backup.sql;

/*1.e*/

mysqldump -u root -p bd_empleados temple  --where "numde != 100"  > empl_no100_backup.sql;

/*1.f*/



/*1.g*/

mysqldump -u root -p  --ignore-table = bd_empleados.temple > centr_dpto_backup.sql;

/*1.h*/

mysqldump -u root -p bd_empleados --no-data > bd_empleados_backup.sql;

/*1.i*/

mysqldump -u root -p --all-databases > mysql_backup.sql;