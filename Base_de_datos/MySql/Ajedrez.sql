

CREATE DATABASE IF NOT EXISTS CAMPONEATO;
USE CAMPONEATO;

CREATE TABLE IF NOT EXISTS  HOTEL(
NOMBRE CHAR (40)  PRIMARY KEY NOT NULL,
CALLE CHAR (40) NOT NULL,
NUMERO INTEGER NOT NULL,
CP CHAR(5) NOT NULL,
LOCALIDAD CHAR (40) NOT NULL
);

CREATE TABLE IF NOT EXISTS HOTEL_TELEFONO(
NOMBRE CHAR (40) NOT NULL,
TELEFONO CHAR (9)NOT NULL,
PRIMARY KEY (NOMBRE, TELEFONO),
FOREIGN KEY (NOMBRE) REFERENCES HOTEL (NOMBRE)
);

CREATE TABLE IF NOT EXISTS PARTICIPANTE(
DNI CHAR (9) PRIMARY KEY NOT NULL,
NOMBRE CHAR (50) NOT NULL,
NOMBRE_HOTEL CHAR (40) NOT NULL,
FOREIGN KEY (NOMBRE_HOTEL) REFERENCES HOTEL (NOMBRE)
);

CREATE TABLE IF NOT EXISTS ARBITRO(
DNI CHAR (9) PRIMARY KEY NOT NULL,
SALARIO REAL NOT NULL,
CHECK (SALARIO > 0)
);

CREATE TABLE IF NOT EXISTS PARTIDA(
CODIGO INTEGER PRIMARY KEY NOT NULL,
DURACION REAL NOT NULL,
DNI_ARBITRO CHAR(9) NOT NULL,
FOREIGN KEY (DNI_ARBITRO) REFERENCES ARBITRO (DNI)
);

CREATE TABLE IF NOT EXISTS JUGADOR(
DNI CHAR (9) PRIMARY KEY NOT NULL, 
FECHA_NACIMIENTO DATE NOT NULL,
FOREIGN KEY (DNI) REFERENCES PARTICIPANTE (DNI)
);

CREATE TABLE IF NOT EXISTS PARTIDA_JUGADOR(
CODIGO_PARTIDA INTEGER NOT NULL,
DNI_JUGADOR CHAR (9) NOT NULL,
COLOR CHAR (1) NOT NULL,
PRIMARY KEY (CODIGO_PARTIDA, DNI_JUGADOR),
FOREIGN KEY (CODIGO_PARTIDA) REFERENCES PARTIDA (CODIGO),
FOREIGN KEY (DNI_JUGADOR) REFERENCES JUGADOR (DNI),
CHECK (COLOR IN ("B", "N")) /* CHECK (COLOR="B" OR COLOR="N") */
);