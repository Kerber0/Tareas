DROP DATABASE IF EXISTS hospital_mysql;
CREATE DATABASE IF NOT EXISTS hospital_mysql CHARACTER SET = 'utf8mb4' COLLATE = 'utf8mb4_unicode_ci';
USE hospital_mysql;

-- ##################################################################

CREATE TABLE IF NOT EXISTS pacientes (
    id_paciente INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(150),
    fecha_nacimiento DATE,
    PRIMARY KEY (id_paciente)
);

CREATE TABLE IF NOT EXISTS tratamientos (
    id_tratamiento INT NOT NULL AUTO_INCREMENT,
    nombre_tratamiento VARCHAR(150) NOT NULL,
    descripcion TEXT,
    id_medico INT,       
    id_especialidad INT, 
    PRIMARY KEY (id_tratamiento)
);

CREATE TABLE IF NOT EXISTS citas (
    id_cita INT NOT NULL AUTO_INCREMENT,
    id_paciente INT NOT NULL,
    fecha DATE NOT NULL,
    PRIMARY KEY (id_cita),
    FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS pacientes_tratamientos (
    id_paciente INT NOT NULL,
    id_tratamiento INT NOT NULL,
    fecha_inicio DATE,
    PRIMARY KEY (id_paciente, id_tratamiento),
    FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente) ON DELETE CASCADE ON UPDATE CASCADE
    , FOREIGN KEY (id_tratamiento) REFERENCES tratamientos(id_tratamiento) ON DELETE CASCADE ON UPDATE CASCADE
);


-- #######################################################################
--               DATOS DE EJEMPLO                                        #
-- #######################################################################

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
('Pablo Álvarez',   'p.alvarez@mail.com',   '1984-02-19'),
('Elena Martín',    'elena.m@mail.com',     '1991-07-03'),
('Gonzalo Prieto',  'g.prieto@mail.com',    '1975-12-28'),
('Noelia Duarte',   'noelia.d@mail.com',    '1999-05-14'),
('Ricardo Serra',   'ric.serra@mail.com',   '1968-10-09'),
('Tamara Ponce',    't.ponce@mail.com',     '2001-03-22'),
('Hugo Varela',     'h.varela@mail.com',    '1987-11-30'),
('Marina López',    'marina.l@mail.com',    '1993-08-17'),
('Agustín Ríos',    'agustin.r@mail.com',   '2002-04-01'),
('Verónica Sosa',   'vero.sosa@mail.com',   '1972-09-25'),
('Cintia Molina',   'c.molina@mail.com',    '1996-01-12'),
('Jorge Benítez',   'j.benitez@mail.com',   '1980-06-08'),
('Soledad Ibáñez',  'sole.i@mail.com',      '1989-12-05');

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
(11, 'Eco Cardíaca Avanzada',       'Estudio cardiológico con doppler color',          11, 1),
(12, 'Control Pediátrico Ampliado', 'Chequeo pediátrico con calendario vacunal',       12, 2),
(13, 'Cirugía Laparoscópica',       'Procedimiento mínimamente invasivo',              13, 3),
(14, 'RMN Cerebral',                'Resonancia magnética de alta resolución',         14, 4),
(15, 'Tratamiento Acne Crónico',    'Isotretinoína con seguimiento dermatológico',     15, 5),
(16, 'Evaluación Cognitiva',        'Batería neuropsicológica y EEG',                  16, 6),
(17, 'Control Prenatal Integral',   'Seguimiento trimestral con analíticas',           17, 7),
(18, 'Terapia Cognitivo-Conductual','Sesiones semanales individuales',                 18, 8),
(19, 'Fondo de Ojo + OCT',          'Estudio de retina con tomografía óptica',         19, 9),
(20, 'Rehabilitación Post Fractura','Plan de fisioterapia de 8 semanas',               20,10),
(21, 'Test de Esfuerzo',            'Ergometría graduada con informe',                 21, 1),
(22, 'Control Niño Sano',           'Chequeo de desarrollo y nutrición',               22, 2);

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
(11, 11, '2025-10-12'),
(12, 12, '2025-10-13'),
(13, 13, '2025-10-14'),
(14, 14, '2025-10-15'),
(15, 15, '2025-10-16'),
(16, 16, '2025-10-17'),
(17, 17, '2025-10-18'),
(18, 18, '2025-10-19'),
(19, 19, '2025-10-20'),
(20, 20, '2025-10-21'),
(21, 21, '2025-10-22'),
(22, 22, '2025-10-23'),
(13, 21, '2025-10-24'), 
(12, 19, '2025-10-24'),
(18, 15, '2025-10-25');

INSERT INTO citas (id_paciente, fecha) VALUES
(1, '2025-10-25'),
(2, '2025-11-05'),
(1, '2025-11-10'),
(3, '2025-10-28');
(11, '2025-11-02'),
(12, '2025-11-03'),
(13, '2025-11-04'),
(14, '2025-11-05'),
(15, '2025-11-06'),
(16, '2025-11-07'),
(17, '2025-11-08'),
(18, '2025-11-09'),
(19, '2025-11-10'),
(20, '2025-11-11'),
(21, '2025-11-12'),
(22, '2025-11-13'),
(23, '2025-11-14');

