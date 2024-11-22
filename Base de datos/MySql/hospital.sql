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
PRIMARY KEY
FOREIGN KEY
FOREIGN KEY
