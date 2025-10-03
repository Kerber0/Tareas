/* a */
insert into persona(dni, telefono, nombre, fecha_nacimiento)
	values('11111111A', '600102030', 'Antonio Rodriguez Perez', '1960/11/24');
insert into persona(dni, telefono, nombre, fecha_nacimiento)
	values('11111112B', '600102031', 'Maria Garcia Lopez', '1973/03/20');
insert into persona(dni, telefono, nombre, fecha_nacimiento)
	values('11111113C', '600102032', 'Marcos Veiga Lopez', '1968/08/06');
insert into persona(dni, telefono, nombre, fecha_nacimiento)
	values('11111114D', '600102033', 'Maria Estevez Ramos', '1981/02/17');
insert into persona(dni, telefono, nombre, fecha_nacimiento)
	values('11111115E', '600102034', 'Javier Rodriguez Cabana', '1974/12/21');
insert into persona(dni, telefono, nombre, fecha_nacimiento)
	values('11111116F', '600102035', 'Lucia Graba Gomez', '1985/09/15');
insert into persona(dni, telefono, nombre, fecha_nacimiento)
	values('11111117G', '600102036', 'Borja Valle Estevez', '1977/10/02');    
    
insert into medico(dni, salario)
	values('11111111A', 2500.15);
insert into medico(dni, salario)
	values('11111114D', 1750.50);
insert into medico(dni, salario)
	values('11111117G', 1930.45);    
    
alter table paciente drop index num_ss;
alter table paciente modify num_ss char(15);
insert into paciente(dni)
	select dni from persona where not exists(select 1 from medico where medico.dni = persona.dni);
    
/* b */
insert into planta(numero, nombre)
	values(1, 'Medicina Interna');
insert into planta(numero, nombre)
	values(2, 'Oftalmologia');
insert into planta(numero, nombre)
	values(3, 'Traumatologia');    

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

/* c */
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
    
/* d */
delete from reconocimiento where dni_medico = '11111111A';
delete from medico where dni = '11111111A';
delete from persona where dni = '11111111A';

/* e */
update medico set salario = salario * 1.05;
	/* otra opci n ser a: update medico set salario = salario + 0.5 * salario */
	
/* f */
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