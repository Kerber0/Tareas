create database if not exists nombre_base_datos ;
use nombre_base_datos; /* Así seleccionamos la base de datos con la que trabajaremos*/

create table if not exists nombre_tabla (
columna1 tipo primary key not null auto_increment default valor check,
columna2 tipo not null auto_increment default valor check,
...
primary key (columna1,...)],
foreign key (columna1,...) references otra_tabla(otro_campo1,...)
on delete {no action | restrict | cascade | set null | set default} /*no action y restrict no se ponen*/
on update {no action | restrict | cascade | set null | set default} /*no action y restrict no se ponen*/
check (columna1,... condicion_a_cumplir),
unique (columna1,...)
)
[data directory = directoriodealmacenamiento] /*especifica la ruta absoluta en la que se almacenan los datos.
Es solo para tablas MyISAM */
[index directory = directoriodealmacenamientoindices] /*especifica la ruta absoluta en la que se almacenan los
índices. Es solo para tablas MyISAM */

[engine = {{ISAM, MyISAM, InnoDB, ...} /* indica el tipo de motor de almacenamiento que se
usará con la tabla, en caso de que no se desee usar el motor por defecto que tiene la BD. */
[auto_increment = nº] /*indica el número de comienzo de la secuencia autonumérica.*/
[comment texto] /*esta opción de tabla también es una opción de columna y posee el mismo
formato. Hay que recordar que el texto que compone el comentario debe ir entre comillas simples.*/
;