-- ======================================================
--     BASE DE DATOS: hospital_postgre
-- ======================================================

DROP DATABASE IF EXISTS hospital_postgre;
CREATE DATABASE hospital_postgre;

\c hospital_postgre

-- ======================================================
--     TIPO COMPUESTO PARA CONTACTO DE MÉDICOS
-- ======================================================

CREATE SCHEMA IF NOT EXISTS hospital;

CREATE TYPE hospital.contacto_tipo AS (
    nombre_contacto VARCHAR(100),
    nif VARCHAR(20),
    telefono INTEGER,
    email VARCHAR(100)
);

-- ##################################################################


CREATE TABLE hospital.salas (
    id_sala SERIAL PRIMARY KEY,
    nombre_sala VARCHAR(100) NOT NULL,
    ubicacion VARCHAR(100)
);

CREATE TABLE hospital.especialidades (
    id_especialidad SERIAL PRIMARY KEY,
    nombre_especialidad VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE hospital.medicos (
    id_medico SERIAL PRIMARY KEY,
    nombre_medico VARCHAR(100) NOT NULL,
    contacto hospital.contacto_tipo
);

CREATE TABLE hospital.tratamientos (
    id_tratamiento SERIAL PRIMARY KEY,
    id_medico INTEGER NOT NULL,
    id_especialidad INTEGER NOT NULL,
    FOREIGN KEY (id_medico) REFERENCES hospital.medicos(id_medico),
    FOREIGN KEY (id_especialidad) REFERENCES hospital.especialidades(id_especialidad)
);

CREATE TABLE hospital.salas_tratamientos (
    id_sala INTEGER NOT NULL,
    id_tratamiento INTEGER NOT NULL,
    PRIMARY KEY (id_sala, id_tratamiento),
    FOREIGN KEY (id_sala) REFERENCES hospital.salas(id_sala) ON DELETE CASCADE,
    FOREIGN KEY (id_tratamiento) REFERENCES hospital.tratamientos(id_tratamiento) ON DELETE CASCADE
);


-- #######################################################################
--               DATOS DE EJEMPLO                                        #
-- #######################################################################

INSERT INTO hospital.salas (nombre_sala, ubicacion) VALUES
('Quirófano 1','Ala Norte, Planta 3'),
('Consultorio Pediátrico','Ala Sur, Planta 1'),
('Unidad de Radiología','Sótano'),
('Laboratorio Clínico','Ala Este, Planta 2'),
('Sala de Urgencias','Planta Baja'),
('Consultorio Cardiología','Ala Norte, Planta 2'),
('Unidad de Cuidados Intensivos','Ala Oeste, Planta 3'),
('Sala de Rehabilitación','Ala Sur, Planta 2'),
('Farmacia Interna','Planta Baja, sector B'),
('Consultorio Dermatología','Ala Este, Planta 1'),
('Unidad de Diagnóstico','Ala Central, Planta 1'),
('Sala de Terapias Físicas','Ala Oeste, Planta 2'),
('Área de Esterilización','Sótano 2');

INSERT INTO hospital.especialidades (nombre_especialidad) VALUES
('Cardiología'),
('Pediatría'),
('Cirugía General'),
('Radiología'),
('Dermatología'),
('Neurología'),
('Ginecología'),
('Psiquiatría'),
('Oftalmología'),
('Traumatología'),
('Rehabilitación Física');

INSERT INTO hospital.medicos (nombre_medico, contacto) VALUES
('Dr/a. Luis Pérez', ROW('Luis Pérez','12345678A',5551111,'luis.perez@hosp.com')),
('Dr/a. Elena Soto', ROW('Elena Soto','23456789B',5552222,'elena.soto@hosp.com')),
('Dr/a. Javier Mora', ROW('Javier Mora','34567890C',5553333,'j.mora@hosp.com')),
('Dr/a. Carmen Ruiz', ROW('Carmen Ruiz','45678901D',5554444,'c.ruiz@hosp.com')),
('Dr/a. Andrés Vidal', ROW('Andrés Vidal','56789012E',5555555,'a.vidal@hosp.com')),
('Dr/a. Patricia León', ROW('Patricia León','67890123F',5556666,'p.leon@hosp.com')),
('Dr/a. Tomás Vega', ROW('Tomás Vega','78901234G',5557777,'t.vega@hosp.com')),
('Dr/a. Laura Campos', ROW('Laura Campos','89012345H',5558888,'l.campos@hosp.com')),
('Dr/a. Miguel Arroyo', ROW('Miguel Arroyo','90123456I',5559999,'m.arroyo@hosp.com')),
('Dr/a. Sonia Duarte', ROW('Sonia Duarte','01234567J',5550000,'s.duarte@hosp.com')),
('Dr/a. Paula Núñez', ROW('Paula Núñez','11223344K',5551010,'p.nunez@hosp.com')),
('Dr/a. Sergio Pardo', ROW('Sergio Pardo','22334455L',5551011,'s.pardo@hosp.com')),
('Dr/a. Clara Vidal', ROW('Clara Vidal','33445566M',5551012,'c.vidal@hosp.com')),
('Dr/a. Iván Ortega', ROW('Iván Ortega','44556677N',5551013,'i.ortega@hosp.com')),
('Dr/a. Alicia Rey', ROW('Alicia Rey','55667788O',5551014,'a.rey@hosp.com')),
('Dr/a. Bruno Costa', ROW('Bruno Costa','66778899P',5551015,'b.costa@hosp.com')),
('Dr/a. Natalia Ríos', ROW('Natalia Ríos','77889900Q',5551016,'n.rios@hosp.com')),
('Dr/a. Diego Salas', ROW('Diego Salas','88990011R',5551017,'d.salas@hosp.com')),
('Dr/a. Valeria Mena', ROW('Valeria Mena','99001122S',5551018,'v.mena@hosp.com')),
('Dr/a. Raúl Pineda', ROW('Raúl Pineda','10111213T',5551019,'r.pineda@hosp.com')),
('Dr/a. Julia Barreto', ROW('Julia Barreto','11121314U',5551020,'j.barreto@hosp.com')),
('Dr/a. Mateo Rivas', ROW('Mateo Rivas','12131415V',5551021,'m.rivas@hosp.com'));

INSERT INTO hospital.tratamientos (id_medico, id_especialidad) VALUES
(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),
(11,1),(12,2),(13,3),(14,4),(15,5),(16,6),(17,7),(18,8),(19,9),(20,10),
(21,1),(22,2),(13,11),(15,11),(17,11);

INSERT INTO hospital.salas_tratamientos (id_sala, id_tratamiento) VALUES
(1,3),(2,2),(3,4),(4,6),(5,1),(6,1),(7,7),(8,8),(9,5),(10,9),
(1,11),(2,12),(3,13),(4,14),(5,15),(6,16),(7,17),(8,18),(9,19),(10,20),
(2,21),(6,22),(11,23),(12,24),(13,25),
(3,2),(4,3),(5,4),(6,5),(7,6),(8,7),(9,8),(10,21),(11,10),(12,1),(13,2);

-- 5. Verificar
\dn
\dt hospital.*
