-- MySQL: hospital_mysql
DROP DATABASE IF EXISTS hospital_mysql;
CREATE DATABASE IF NOT EXISTS hospital_mysql CHARACTER SET = 'utf8mb4' COLLATE = 'utf8mb4_unicode_ci';
USE hospital_mysql;

-- Tabla pacientes
CREATE TABLE IF NOT EXISTS pacientes (
    id_paciente INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(150),
    fecha_nacimiento DATE,
    PRIMARY KEY (id_paciente)
);

-- Tabla tratamientos (incluye referencias por id a medicos/especialidades en PG)
CREATE TABLE IF NOT EXISTS tratamientos (
    id_tratamiento INT NOT NULL AUTO_INCREMENT,
    nombre_tratamiento VARCHAR(150) NOT NULL,
    descripcion TEXT,
    id_medico INT,       -- referencia lógica a medicos en PostgreSQL
    id_especialidad INT, -- referencia lógica a especialidades en PostgreSQL
    PRIMARY KEY (id_tratamiento)
);

-- Tabla citas
CREATE TABLE IF NOT EXISTS citas (
    id_cita INT NOT NULL AUTO_INCREMENT,
    id_paciente INT NOT NULL,
    fecha DATE NOT NULL,
    PRIMARY KEY (id_cita),
    FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Tabla pacientes_tratamientos (M:N)
CREATE TABLE IF NOT EXISTS pacientes_tratamientos (
    id_paciente INT NOT NULL,
    id_tratamiento INT NOT NULL,
    fecha_inicio DATE,
    PRIMARY KEY (id_paciente, id_tratamiento),
    FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente) ON DELETE CASCADE ON UPDATE CASCADE
    -- NOTA: no se puede FK a tratamientos en PG desde MySQL; aquí FK local a tratamientos:
    , FOREIGN KEY (id_tratamiento) REFERENCES tratamientos(id_tratamiento) ON DELETE CASCADE ON UPDATE CASCADE
);


-- ------------------------------
-- Inserciones de ejemplo
-- ------------------------------

-- Pacientes (10 registros)
INSERT INTO pacientes (nombre, email, fecha_nacimiento) VALUES
('Ana García', 'ana.g@mail.com', '1985-06-15'),
('Pedro López', 'p.lopez@mail.com', '1970-11-20'),
('Marta Torres', 'marta.t@mail.com', '1998-03-01'),
('Carlos Ruiz', 'carlos.r@mail.com', '1965-09-10'),
('Lucía Fernández', 'lucia.f@mail.com', '1992-01-05'),
('Diego Martín', 'diego.m@mail.com', '1980-07-22'),
('Sofía Navarro', 'sofia.n@mail.com', '2000-12-11'),
('Raúl Gómez', 'raul.g@mail.com', '1978-04-02'),
('Inés Blanco', 'ines.b@mail.com', '1995-08-30'),
('Javier Molina', 'j.molina@mail.com', '1969-02-14');

-- Tratamientos (10 registros) -> insertamos explícitamente ids 1..10 para sincronizar con PostgreSQL
INSERT INTO tratamientos (id_tratamiento, nombre_tratamiento, descripcion, id_medico, id_especialidad) VALUES
(1, 'Consulta Cardiología', 'Consulta y control de función cardíaca', 1, 1),
(2, 'Revisión Pediátrica', 'Control de crecimiento y vacunaciones', 2, 2),
(3, 'Cirugía General Mayor', 'Intervención quirúrgica mayor', 3, 3),
(4, 'Estudio Radiológico', 'TAC/RX para diagnóstico', 4, 4),
(5, 'Consulta Dermatología', 'Evaluación de lesiones cutáneas', 5, 5),
(6, 'Pruebas Neurológicas', 'Electroencefalograma y pruebas', 6, 6),
(7, 'Control Ginecológico', 'Revisión ginecológica y pruebas', 7, 7),
(8, 'Terapia Psiquiátrica', 'Sesiones de terapia y seguimiento', 8, 8),
(9, 'Revisión Oftalmológica', 'Examen de la vista y presión ocular', 9, 9),
(10, 'Tratamiento Traumatológico', 'Rehabilitación y cirugías menores', 10, 10);

-- Pacientes-Tratamientos (ejemplos)
INSERT INTO pacientes_tratamientos (id_paciente, id_tratamiento, fecha_inicio) VALUES
(1, 1, '2025-10-01'),
(2, 2, '2025-09-21'),
(3, 3, '2025-08-15'),
(4, 4, '2025-07-10'),
(5, 5, '2025-06-05'),
(6, 6, '2025-05-20'),
(7, 7, '2025-04-30'),
(8, 8, '2025-03-12'),
(9, 9, '2025-02-01'),
(10, 10, '2025-01-15');

-- Citas (ejemplo)
INSERT INTO citas (id_paciente, fecha) VALUES
(1, '2025-10-25'),
(2, '2025-11-05'),
(1, '2025-11-10'),
(3, '2025-10-28');
