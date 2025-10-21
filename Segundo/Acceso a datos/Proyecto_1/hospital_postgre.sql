-- 1. Crear la base de datos (ejecutar fuera de la conexión actual)
CREATE DATABASE hospital_postgre;

-- 2. Conectarse a la base de datos recién creada
\c hospital_postgre;

-- #######################################################################
-- # 0. CREAR EL SCHEMA HOSPITAL                                        #
-- #######################################################################
CREATE SCHEMA IF NOT EXISTS hospital;


-- #######################################################################
-- # 1. CREACIÓN DE TIPOS COMPUESTOS                                      #
-- #######################################################################
-- Tipo compuesto para contacto de médicos
CREATE TYPE hospital.contacto_tipo AS (
    nombre_contacto VARCHAR(100),
    nif VARCHAR(20),
    telefono VARCHAR(20),
    email VARCHAR(100)
);


-- #######################################################################
-- # 2. CREACIÓN DE TABLAS                                               #
-- #######################################################################

-- Tabla de Salas
CREATE TABLE IF NOT EXISTS hospital.salas (
    id_sala SERIAL PRIMARY KEY,
    nombre_sala VARCHAR(100) NOT NULL,
    ubicacion VARCHAR(100)
);

-- Tabla de Especialidades
CREATE TABLE IF NOT EXISTS hospital.especialidades (
    id_especialidad SERIAL PRIMARY KEY,
    nombre_especialidad VARCHAR(100) NOT NULL UNIQUE
);

-- Tabla de Médicos
CREATE TABLE IF NOT EXISTS hospital.medicos (
    id_medico SERIAL PRIMARY KEY,
    nombre_medico VARCHAR(100) NOT NULL,
    contacto hospital.contacto_tipo
);

-- Tabla de Tratamientos
CREATE TABLE IF NOT EXISTS hospital.tratamientos (
    id_tratamiento SERIAL PRIMARY KEY,
    id_medico INTEGER NOT NULL,
    id_especialidad INTEGER NOT NULL,
    FOREIGN KEY (id_medico) REFERENCES hospital.medicos(id_medico) ON DELETE RESTRICT,
    FOREIGN KEY (id_especialidad) REFERENCES hospital.especialidades(id_especialidad) ON DELETE RESTRICT
);

-- Tabla de relación muchos a muchos entre Salas y Tratamientos
CREATE TABLE IF NOT EXISTS hospital.salas_tratamientos (
    id_sala INTEGER NOT NULL,
    id_tratamiento INTEGER NOT NULL,
    PRIMARY KEY (id_sala, id_tratamiento),
    FOREIGN KEY (id_sala) REFERENCES hospital.salas(id_sala) ON DELETE CASCADE,
    FOREIGN KEY (id_tratamiento) REFERENCES hospital.tratamientos(id_tratamiento) ON DELETE CASCADE
);


-- #######################################################################
-- # 3. INSERTAR DATOS DE EJEMPLO                                        #
-- #######################################################################

-- Salas
INSERT INTO hospital.salas (nombre_sala, ubicacion) VALUES
('Quirófano 1', 'Ala Norte, Planta 3'),
('Consultorio Pediátrico', 'Ala Sur, Planta 1'),
('Unidad de Radiología', 'Sótano'),
('Laboratorio Clínico', 'Ala Este, Planta 2'),
('Sala de Urgencias', 'Planta Baja'),
('Consultorio Cardiología', 'Ala Norte, Planta 2'),
('Unidad de Cuidados Intensivos', 'Ala Oeste, Planta 3'),
('Sala de Rehabilitación', 'Ala Sur, Planta 2'),
('Farmacia Interna', 'Planta Baja, sector B'),
('Consultorio Dermatología', 'Ala Este, Planta 1');

-- Especialidades
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
('Traumatología');

-- Médicos (con tipo compuesto de contacto)
INSERT INTO hospital.medicos (nombre_medico, contacto) VALUES
('Dr. Luis Pérez', ROW('Luis Pérez', '12345678A', '555-1111', 'luis.perez@hosp.com')),
('Dra. Elena Soto', ROW('Elena Soto', '23456789B', '555-2222', 'elena.soto@hosp.com')),
('Dr. Javier Mora', ROW('Javier Mora', '34567890C', '555-3333', 'j.mora@hosp.com')),
('Dra. Carmen Ruiz', ROW('Carmen Ruiz', '45678901D', '555-4444', 'c.ruiz@hosp.com')),
('Dr. Andrés Vidal', ROW('Andrés Vidal', '56789012E', '555-5555', 'a.vidal@hosp.com')),
('Dra. Patricia León', ROW('Patricia León', '67890123F', '555-6666', 'p.leon@hosp.com')),
('Dr. Tomás Vega', ROW('Tomás Vega', '78901234G', '555-7777', 't.vega@hosp.com')),
('Dra. Laura Campos', ROW('Laura Campos', '89012345H', '555-8888', 'l.campos@hosp.com')),
('Dr. Miguel Arroyo', ROW('Miguel Arroyo', '90123456I', '555-9999', 'm.arroyo@hosp.com')),
('Dra. Sonia Duarte', ROW('Sonia Duarte', '01234567J', '555-0000', 's.duarte@hosp.com'));

-- Tratamientos
INSERT INTO hospital.tratamientos (id_medico, id_especialidad) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- Salas-Tratamientos
INSERT INTO hospital.salas_tratamientos (id_sala, id_tratamiento) VALUES
(1, 3),
(2, 2),
(3, 4),
(4, 6),
(5, 1),
(6, 1),
(7, 7),
(8, 8),
(9, 5),
(10, 9);
