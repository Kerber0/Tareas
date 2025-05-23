CREATE DATABASE IF NOT EXISTS BIBLIOTECA CHARACTER SET LATIN1;

USE BIBLIOTECA;

CREATE TABLE IF NOT EXISTS LIBRO (
LIB_CODIGO INTEGER PRIMARY KEY NOT NULL,
LIB_TITULO CHAR (40) NOT NULL,
LIB_EJEMPLARES_TOT INTEGER NOT NULL,
LIB_EJEMPLARES_DISP INTEGER NOT NULL,
LIB_CODIGOMATERIA INTEGER NULL
);

CREATE TABLE IF NOT EXISTS AUTORES (
AUT_CODIGO INTEGER PRIMARY KEY NOT NULL,
AUT_NOMBRE CHAR (40) NOT NULL,
AUT_NACIONALIDAD CHAR (20) NULL,
AUT_FECHANACIMIENTO DATE NOT NULL,
AUT_FECHAFALLECIMIENTO DATE NULL
);

CREATE TABLE IF NOT EXISTS ESCRITO (
ESC_CODIGOLIBRO INTEGER NOT NULL,
ESC_CODIGOAUTOR INTEGER NOT NULL,
PRIMARY KEY (ESC_CODIGOAUTOR, ESC_CODIGOLIBRO),
FOREIGN KEY (ESC_CODIGOAUTOR) REFERENCES AUTORES (AUT_CODIGO)
ON UPDATE CASCADE
ON DELETE CASCADE,
FOREIGN KEY (ESC_CODIGOLIBRO) REFERENCES LIBRO (LIB_CODIGO)
ON UPDATE CASCADE
ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS MATERIAS (
MAT_CODIGO INTEGER PRIMARY KEY NOT NULL,
MAT_NOMBRE CHAR (25) NOT NULL
);

CREATE TABLE IF NOT EXISTS USUARIOS (
USU_CODIGO INTEGER PRIMARY KEY NOT NULL,
USU_NOMBRE CHAR (40) NOT NULL,
USU_DIRECCION CHAR (40) NOT NULL,
USU_CP CHAR (5) NULL,
USU_CIUDAD CHAR (20) NULL,
USU_NIF CHAR(9) NOT NULL
);

CREATE TABLE IF NOT EXISTS PRESTAMOS (
PRE_CODIGOLIBRO INTEGER NOT NULL,
PRE_CODIGOUSUARIO INTEGER NOT NULL,
PRE_FECHAPRESTAMO DATE NOT NULL,
PRE_FECHADEVOLUCION DATE NULL
);

ALTER TABLE LIBRO ADD FOREIGN KEY (LIB_CODIGOMATERIA) REFERENCES MATERIAS (MAT_CODIGO)
ON DELETE SET NULL
ON UPDATE NO ACTION;

ALTER TABLE ESCRITO ADD FOREIGN KEY (ESC_CODIGOLIBRO) REFERENCES LIBRO (LIB_CODIGO)
ON DELETE CASCADE 
ON UPDATE NO ACTION;

ALTER TABLE ESCRITO ADD FOREIGN KEY (ESC_CODIGOAUTOR) REFERENCES AUTORES (AUT_CODIGO)
ON DELETE CASCADE
ON UPDATE NO ACTION;

ALTER TABLE PRESTAMOS ADD FOREIGN KEY (PRE_CODIGOLIBRO) REFERENCES LIBRO (LIB_CODIGO)
ON DELETE NO ACTION 
ON UPDATE NO ACTION;

ALTER TABLE PRESTAMOS ADD FOREIGN KEY (PRE_CODIGOUSUARIO) REFERENCES USUARIOS (USU_CODIGO)
ON DELETE NO ACTION 
ON UPDATE NO ACTION;