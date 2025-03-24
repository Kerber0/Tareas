CREATE DATABASE IF NOT EXISTS Hospital;  /* Creamos la BD */
USE Hospital;       /* Cambiamos a la BD con la que vamos a trabajar */
CREATE TABLE IF NOT EXISTS Edificio (      /* Creamos una tabla  [IF NOT EXISTS] OPCIONAL []*/
Nombre char (20) PRIMARY KEY,  /* [PK SOLO SI ES EN UNICO ATRIBUTO] [NOT NULL / AUTO_INCREMENT / DEFAULT VALOR / CHECK] EN TODOS LOS ATRIBUTOS */
Calle char (20) NOT NULL,
Numero int ,
Cod_postal char (5) NOT NULL,
Localidad char (20) NOT NULL
);

/* [OPCIONES DE TABLAS ( DATA DIRECTORY / INDEX DIRECTORY / ENGINE / AUTO_INCREMENT / COMMENT)]*/

CREATE TABLE IF NOT EXISTS Planta (
Nombre_edificio char (20),
Nombre_planta char (20) NOT NULL,
Numero_planta int NOT NULL,
PRIMARY KEY (Nombre_edificio, Numero_planta), /* En caso de que la PK sea compuesta se pone como restriccion abajo*/
FOREIGN KEY (Nombre_edificio) REFERENCES Edificio (Nombre) /* Las FK tambien se ponen como restricciones abajo diciendo de donde viene*/
ON DELETE CASCADE, /* "Caso borrar" Acciones a hacer en caso de modificiar la FK [ CASCADE | NO ACTION | SET NULL | SET DEFALUT | RESTRICT] */
ON UPDATE CASCADE  /* "Caso actalizar" NO ACTION y RESTRICT  no se suele poner por que si no se pone nada queda por defecto]*/
);

CREATE TABLE IF NOT EXISTS Cama (
Numero int NOT NULL,
Nombre_edificio char (20) NOT NULL,
Numero_planta int NOT NULL,
PRIMARY KEY (Numero, Nombre_edificio, Numero_planta),
FOREIGN KEY (Nombre_edificio,Numero_planta) REFERENCES Planta (Nombre_edificio,Numero_planta)
ON DELETE CASCADE
ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Persona (
DNI char (9) PRIMARY KEY,
Telefono char(12) NOT NULL,
Nombre char (20) NOT NULL,
Fecha_nacimiento DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS Medico(
Salario int NOT NULL,
DNI_medico char (9) PRIMARY KEY,
FOREIGN KEY (DNI_medico) REFERENCES Persona (DNI)
ON DELETE CASCADE
ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Paciente (
Num_ss char (20) UNIQUE,
DNI_paciente char(9) PRIMARY KEY,
FOREIGN KEY (DNI_paciente) REFERENCES Persona (DNI)
ON DELETE CASCADE
ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Reconocimiento (
Fecha_ingreso DATE NOT NULL,
Codigo char (20) PRIMARY KEY,
Num_ss_paciente char (20) UNIQUE,
DNI_medico char (9) UNIQUE,
FOREIGN KEY (Num_ss_paciente) REFERENCES Paciente (Num_ss),
FOREIGN KEY (DNI_medico) REFERENCES Medico (DNI_medico)
);

CREATE TABLE IF NOT EXISTS Ingreso (
Fecha_entrada DATE ,
Codigo char (20),
fecha_salida DATE,
Num_ss_paciente char(20) UNIQUE,
Numero_cama int,
PRIMARY KEY;



/* a */
insert into persona(dni, telefono, nombre, fecha_nacimiento)
	values('11111111A', '600102030', 'Antonio Rodroguez Perez', '1960/11/24');
insert into persona(dni, telefono, nombre, fecha_nacimiento)
	values('11111112B', '600102031', 'Maria Garcia Lopez', '1973/03/20');
insert into persona(dni, telefono, nombre, fecha_nacimiento)
	values('11111113C', '600102032', 'Marcos Veiga Lopez', '1968/08/06');
insert into persona(dni, telefono, nombre, fecha_nacimiento)
	values('11111114D', '600102033', 'Maria Estevez Ramos', '1981/02/17');
insert into persona(dni, telefono, nombre, fecha_nacimiento)
	values('11111115E', '600102034', 'Javier Rodroguez Cabana', '1974/12/21');
insert into persona(dni, telefono, nombre, fecha_nacimiento)
	values('11111116F', '600102035', 'Lucia Graña Gomez', '1985/09/15');
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
	select dni from persona where dni not in (select dni from medico);
    
/* b */
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

/* c */
insert into reconocimiento(codigo, fecha, duracion, dni_medico, dni_paciente)
	values('R01','2020/01/15',30,'11111111A', '11111112B'), 
    ('R02','2020/02/26',40,'11111114D', '11111113C'),
    ('R03','2020/01/20',20,'11111117G', '11111115E');
    
insert into ingreso(codigo, fecha_entrada, fecha_alta, dni_paciente, numero_planta, numero_cama)
	values('I01', '2020/01/15', '2020/01/20', '11111112B', 1, 9),
    ('I02', '2020/02/26', null, '11111113C', 3, 7),
    ('I03', '2020/01/20', '2020/01/22','11111115E', 2, 6);
    
/* d */
delete from reconocimiento where dni_medico = '11111111A';
delete from medico where dni = '11111111A';
delete from persona where dni = '11111111A';

/* e */
update medico set salario = salario * 1.05;
	/* otra opci�n ser�a: update medico set salario = salario + 0.5 * salario */
	
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



show create table medico;