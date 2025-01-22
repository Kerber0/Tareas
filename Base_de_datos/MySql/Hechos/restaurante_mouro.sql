CREATE DATABASE IF NOT EXISTS restaurante_mauro;
USE restaurante_mauro;
CREATE TABLE IF NOT EXISTS empleados
(
dni CHAR(9) NOT NULL,
nombre CHAR (40) NOT NULL,
apellidos CHAR(40) NOT NULL,
direccion CHAR(40) NOT NULL,
ciudad CHAR(40) NOT NULL,
telefono CHAR (9) NOT NULL,
cp CHAR(5) NOT NULL,
fechaAlta DATE NOT NULL,
categoria CHAR(40) NOT NULL,
salario FLOAT NOT NULL,
PRIMARY KEY (dni)
);

CREATE TABLE IF NOT EXISTS cocineros
(
dni CHAR (9) NOT NULL,
puesto CHAR(40) NOT NULL,
especialidad CHAR(40) NOT NULL,
PRIMARY KEY (dni),
FOREIGN KEY (dni) REFERENCES empleados (dni)
);

CREATE TABLE IF NOT EXISTS administracion
(
dni CHAR(9) NOT NULL,
cargo CHAR(40) NOT NULL,
PRIMARY KEY (dni),
FOREIGN KEY (dni) REFERENCES empleados(dni)
);

CREATE TABLE IF NOT EXISTS camareros
(
dni CHAR (9) NOT NULL,
turno CHAR (40) NOT NULL,
años INT NOT NULL,
dni_encargado char(9) NOT NULL,
PRIMARY KEY (dni),
FOREIGN KEY (dni) REFERENCES empleados (dni),
FOREIGN KEY(dni_encargado) REFERENCES camareros(dni)
);

CREATE TABLE IF NOT EXISTS comedores 
(
codigoC CHAR (40) NOT NULL,
nombre CHAR (40) NOT NULL,
capacidad INT NOT NULL,
nmesas INT NOT NULL,
localizacion CHAR (40) NOT NULL,
PRIMARY KEY (codigoC)
);

CREATE TABLE IF NOT EXISTS mesas
(
codigoM CHAR(40) NOT NULL,
codigoC CHAR(40) NOT NULL,
nAsientos INT NOT NULL,
dni_camarero CHAR (9) NOT NULL,
PRIMARY KEY (codigoM, codigoC),
FOREIGN KEY (codigoC) REFERENCES comedores(codigoC),
FOREIGN KEY (dni_camarero) REFERENCES camareros (dni)
);

CREATE TABLE IF NOT EXISTS reservas
(
nReserva CHAR(40) NOT NULL,
fHreserva DATETIME NOT NULL,
nombre CHAR(40) NOT NULL,
fHreservada DATETIME,
com_cen ENUM ("comida", "cena") NOT NULL,
nPersonas INT NOT NULL,
varios CHAR (40),
PRIMARY KEY (nReserva)
);


CREATE TABLE IF NOT EXISTS hacen
(
codigoM CHAR(40) NOT NULL,
codigoC CHAR(40) NOT NULL,
nReservas CHAR(40) NOT NULL,
nAsiesntos INT NOT NULL,
dni_camarero CHAR (9),
PRIMARY KEY (codigoM, codigoC, nReservas),
FOREIGN KEY (codigoM, codigoC) REFERENCES mesas (codigoM, codigoC),
FOREIGN KEY (nReservas) REFERENCES reservas (nReserva)
);


CREATE TABLE IF NOT EXISTS facturas
(
nFactura INT NOT NULL,
fechaF DATE NOT NULL,
codigoM CHAR(40) NOT NULL,
codigoC CHAR(40) NOT NULL,
PRIMARY KEY (nFactura),
FOREIGN KEY (codigoM, codigoC) REFERENCES mesas (codigoM,codigoC)
);

CREATE TABLE IF NOT EXISTS proveedores
(
codigoPro CHAR(40) NOT NULL,
direccion CHAR(40) NOT NULL,
cp CHAR(5) NOT NULL,
telefono CHAR(9) NOT NULL,
fax CHAR(40) NOT NULL,
contacto CHAR(40),
PRIMARY KEY (codigoPro)
);

CREATE TABLE IF NOT EXISTS productos
(
codigoPr CHAR (40) NOT NULL,
descripcion CHAR(40) NOT NULL,
stock INT NOT NULL,
unidadBase INT NOT NULL,
precioU FLOAT NOT NULL,
categoria CHAR(40) NOT NULL,
codigoPro CHAR(40) NOT NULL,
PRIMARY KEY (codigoPr),
FOREIGN KEY (codigoPro) REFERENCES proveedores (codigoPro)
);

CREATE TABLE IF NOT EXISTS platos
(
codigoPl CHAR(40) NOT NULL,
nombre CHAR(40) NOT NULL,
descripcion CHAR(40) NOT NULL,
tipo CHAR(40) NOT NULL,
precio FLOAT NOT NULL,
PRIMARY KEY (codigoPl)
);

CREATE TABLE IF NOT EXISTS incluyen
(
nFactura INT NOT NULL,
codigoPl CHAR(40) NOT NULL,
unidades INT NOT NULL,
PRIMARY KEY (nFactura, codigoPl),
FOREIGN KEY (nFactura) REFERENCES facturas (nFactura),
FOREIGN KEY (codigoPl) REFERENCES platos (codigoPl)
);

CREATE TABLE IF NOT EXISTS contienen
(
codigoPr CHAR(40) NOT NULL,
codigoPl CHAR(40) NOT NULL,
cantidad INT NOT NULL,
PRIMARY KEY (codigoPr, codigoPl),
FOREIGN KEY (codigoPl) REFERENCES platos (codigoPl),
FOREIGN KEY (codigoPr) REFERENCES productos (codigoPr)
);

ALTER TABLE empleados ADD UNIQUE INDEX (NOMBRE, apellidos);

ALTER TABLE EMPLEADOS ADD CHECK (fechaAlta >= "2010/07/15"); 

ALTER TABLE camareros MODIFY TURNO SET ( "MAÑANA", "TARDE", "NOCHE") NOT NULL;

ALTER TABLE proveedores ADD apellidos CHAR (40) NOT NULL AFTER codigoPro;

ALTER TABLE proveedores ADD nombre CHAR (40) NOT NULL AFTER apellidos;

ALTER TABLE mesas MODIFY nAsientos INT NOT NULL DEFAULT 4;

ALTER TABLE productos ADD INDEX i_categoria(categoria);

SHOW CREATE TABLE PRODUCTOS;

ALTER TABLE PRODUCTOS MODIFY stock INT ZEROFILL UNSIGNED NOT NULL CHECK (STOCK< 10000);