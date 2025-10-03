/*1a*/

Insert into hotel (nome, calle, numero, CP, localidade) Value ("Hotel Rey", "Avda. Principal", 5, "35700", "A Coruña"),
("Hotel Pazo Verde", "Plaza de España", 18, "35700", "A Coruña"), ("Hotel Sta. María", "Progreso", 114, "35700", "A Coruña");

/*1b*/

alter table participante add participante_hotel char(40);
Insert into participante values ("12345678Z", "Antonio Rodríguez Pérez", "Hotel Rey"),
("11111111B", "María García López", "Hotel Rey"),
("22222222C", "Marcos Veiga López", "Hotel Pazo Verde"),
("33333333B", "María Estévez Ramos", "Hotel Pazo Verde"),
("44444444E", "Javier Rodríguez Cabana", "Hotel Sta. María"),
("55555555T", "Lucía Graña Gómez", "Hotel Sta. María"),
("66666666N", "Borja Valle Estévez", "Hotel Rey");

/*1c*/

insert into arbitro (dni, salario)
(select dni, 500 from participante where participante_hotel = "Hotel Sta. María");

/*1d*/

insert into xogador(dni, data_nacemento)
(select dni, date("1900/01/01") from participante
where participante_hotel <> "Hotel Sta. María");

/*1e*/

update xogador set data_nacemento = 
1985/06/15 where dni = 12345678Z,
1980/09/23 where dni = 11111111B ,
1979/10/03 where dni = 22222222C,
1986/12/17 where dni = 33333333B,
1977/01/30 where dni = 66666666N;


/*1f*/

update arbitro set salario = 450 where dni = 44444444E;
update arbitro set salario = 450 where dni = 55555555T;

/*1g*/

insert into hotel(nome)
	values('Hotel Lemos');
/* da error porque hay campos en la tabla que no admiten nulos y 
no tienen valor por defecto, luego hay que darle valor para insertar */

/*1h*/

insert into partida_xogador(codigo_partida, dni_xogador, color)
	values(1, '12345678Z', 'N');
	/* da error al intentar insertar, sin que exista previamente la partida,
    ya que el campo partida_xogador.codigo_partida tiene una FK sobre partida.codigo */

/*1i*/

insert into partida(codigo, duracion, dni_arbitro)
	values(1, 60, '44444444E');
insert into partida_xogador(codigo_partida, dni_xogador, color)
	values(1, '12345678Z', 'N');
insert into partida_xogador(codigo_partida, dni_xogador, color)
	values(1, '11111111B', 'A');
    /* Al insertar un color distinto de B o N, que eran los colores definidos
    en el check de la creación de la tabla, debería de dar un error.*/

/*1j*/

/* debemos ejecutar para quitar el modo de actualizaciones seguras: set sql_safe_updates = 0; */
delete from participante;
	/* da error porque existen claves foráneas en otras tablas 
    (arbitro y xogador) que hacen referencia a esta tabla, y en la creación
    se estableció el valor por defecto on delete restrict en la FK */

/*1k*/

/* debemos borrar también los datos que metimos en partida y partida_xogador, para poder borrar */
delete from partida_xogador;
delete from partida;
delete from xogador;
delete from arbitro;
delete from participante;  

/*1l*/

update arbitro set salario = salario + 35;

/*2a*/

insert into yacimiento (nombre, latitud, longitud) values ("Irán", "32", "53"), ("Arabia Saudí", "23", "45"),
("Rusia", "61", "105");

/*2b*/

insert into personal values (1, "Antonio Rodriguez Perez", "196-11-14", "Iran", "Plaza España", 15, "Madrid"),
(2, "Maria Garcia Lopez", "1973-03-20", "Iran", "Castellana", 37, "Madrid"),
(3, "Marcos Veiga López", "1968-08-06", "Arabia Saudi", "Miraflores", 8, "Leon"),
(4, "María Estévez Ramos", "1981-02-17", "Rusia", "Gran Via", 19, "Madrid"),
(5, "Javier Rodríguez Cabana", "1974-12-21", "Irán", "Vallecas", 109, "Madrid"),
(6, "Lucía Graña Gómez", "1985-09-15", "Rusia", "Progeso", 70, "Zamora"),
(7, "Borja Valle Estévez", "1977-10-02", "Arabia Saudí", "Principal", 46, "Vigo");

/*2c*/

alter table yacimiento add tipo_yacimiento char (1);
set sql_safe_updates = 0;
update yacimiento set tipo_yacimiento = "Z";
alter table yacimiento modify tipo_yacimiento char(1) default "X";
alter table yacimiento modify tipo_yacimiento enum ("W", "X", "Y", "Z") default "X";

/*2d*/

update personal set nombre_yacimiento = "Rusia" where numero_empleado = 2;
delete from personal where nombre_yacimiento = "Iran";
delete from yacimiento where nombre = "Iran";

/*2e*/

update personal set calle ="Vallecas", Nº =109, Localidad ="Madrid" where Localidad != "Madrid"; 
/* !=  es lo mismo que <>*/

/*2f*/

 
/*3a*/

insert into persona values ( "11111111A", 600102030, "Antonio Rodríguez Pérez", "1960-11-24"),
("11111112B", 600102031, "María García López", "1973-03-20"),
("11111113C", 600102032, "Marcos Veiga López", "1968-08-06"),
("11111114D", 600102033, "María Estévez Ramos", "1981-02-17"),
("11111115E", 600102034, "Javier Rodríguez Cabana", "1974-12-21"),
("11111116F", 600102035, "Lucía Graña Gómez", "1985-09-15"),
("11111117G", 600102036, "Borja Valle Estévez", "1977-10-02");

 insert into medico values ("11111111A", 2500.15),
("11111114D", 1750.50),
("11111117G", 1930.45);



/*3b*/
/*3c*/
/*3d*/ 
/*3e*/ 
/*3f*/

       
select * from persona;

alter table persona modify nombre char(40);