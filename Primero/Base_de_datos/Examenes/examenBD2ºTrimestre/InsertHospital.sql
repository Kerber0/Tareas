/* 3a */
Insert into persona values ("11111111A", "600102030", "Antonio Rodríguez Pérez", "1960/11/24"),
("11111112B", "600102031", "María García López", "1973/03/20"),
("11111113C", "600102032", "Marcos Veiga López", "1968/08/06"),
("11111114D", "600102033", "María Estévez Ramos", "1981/02/17"),
("11111115E", "600102034", "Javier Rodríguez Cabana", "1974/12/21"),
("11111116F", "600102035", "Lucía Graña Gómez", "1985/09/15"),
("11111117G", "600102036", "Borja Valle Estévez", "1977/10/02");

Insert into medico values ("11111111A", "2500.15"),
("11111114D", "1750.50"),
("11111117G", "1930.45");
alter table medico modify salario double; /*Se puede cambiar el tipo de dato siempre y cuando sea posible parsearlo*/

alter table paciente drop index num_ss;
alter table paciente modify num_ss char(15);
insert into paciente(dni)
	select dni from persona where dni not in(select DNI from medico);

/* 3b */
insert into planta(numero, nombre)
	values(1, 'Medicina Interna');
insert into planta(numero, nombre)
	values(2, 'Oftalmolog�a');
insert into planta(numero, nombre)
	values(3, 'Traumatolog�a');    

insert into cama(numero_planta, numero_cama) values (1, 1);
insert into cama(numero_planta, numero_cama) values (1, 2);
insert into cama(numero_planta, numero_cama) values (1, 3);
insert into cama(numero_planta, numero_cama) values (1, 4);
insert into cama(numero_planta, numero_cama) values (1, 5);
insert into cama(numero_planta, numero_cama) values (1, 6);
insert into cama(numero_planta, numero_cama) values (1, 7);
insert into cama(numero_planta, numero_cama) values (1, 8);
insert into cama(numero_planta, numero_cama) values (1, 9);
insert into cama(numero_planta, numero_cama) values (1, 10);

insert into cama(numero_planta, numero_cama) values (2, 1);
insert into cama(numero_planta, numero_cama) values (2, 2);
insert into cama(numero_planta, numero_cama) values (2, 3);
insert into cama(numero_planta, numero_cama) values (2, 4);
insert into cama(numero_planta, numero_cama) values (2, 5);
insert into cama(numero_planta, numero_cama) values (2, 6);
insert into cama(numero_planta, numero_cama) values (2, 7);
insert into cama(numero_planta, numero_cama) values (2, 8);
insert into cama(numero_planta, numero_cama) values (2, 9);
insert into cama(numero_planta, numero_cama) values (2, 10);

insert into cama(numero_planta, numero_cama) values (3, 1);
insert into cama(numero_planta, numero_cama) values (3, 2);
insert into cama(numero_planta, numero_cama) values (3, 3);
insert into cama(numero_planta, numero_cama) values (3, 4);
insert into cama(numero_planta, numero_cama) values (3, 5);
insert into cama(numero_planta, numero_cama) values (3, 6);
insert into cama(numero_planta, numero_cama) values (3, 7);
insert into cama(numero_planta, numero_cama) values (3, 8);
insert into cama(numero_planta, numero_cama) values (3, 9);
insert into cama(numero_planta, numero_cama) values (3, 10);

/* 3c */
insert into reconocimiento(codigo, fecha, duracion, dni_medico, dni_paciente)
	values('R01','2020/01/15',30,'11111111A', '11111112B');
insert into reconocimiento(codigo, fecha, duracion, dni_medico, dni_paciente)
	values('R02','2020/02/26',40,'11111114D', '11111113C');
insert into reconocimiento(codigo, fecha, duracion, dni_medico, dni_paciente)
	values('R03','2020/01/20',20,'11111117G', '11111115E');
    
insert into ingreso(codigo, fecha_entrada, fecha_alta, dni_paciente, numero_planta, numero_cama)
	values('I01','2020/01/15','2020/01/20','11111112B', 1, 9);
insert into ingreso(codigo, fecha_entrada, fecha_alta, dni_paciente, numero_planta, numero_cama)
	values('I02','2020/02/26',null,'11111113C', 3, 7);
insert into ingreso(codigo, fecha_entrada, fecha_alta, dni_paciente, numero_planta, numero_cama)
	values('I03','2020/01/20','2020/01/22','11111115E', 2, 6);
    
/* 3d */
delete from reconocimiento where dni_medico = '11111111A';
delete from medico where dni = '11111111A';
delete from persona where dni = '11111111A';

/* 3e */
update medico set salario = salario * 1.05;
	/* otra opci�n ser�a: update medico set salario = salario + 0.5 * salario */
	
/* 3f */
create table reconocimiento_medico(
	dni_medico char(9) not null,
	codigo_reconocimiento char(20) not null,
	primary key(dni_medico, codigo_reconocimiento),
	foreign key (dni_medico) references Medico(dni),
	foreign key (codigo_reconocimiento) references Reconocimiento(codigo)
);

insert into reconocimiento_medico(dni_medico, codigo_reconocimiento)
	select dni_medico, codigo
		from reconocimiento;
		
alter table reconocimiento drop foreign key reconocimiento_ibfk_1;
alter table reconocimiento drop column dni_medico;