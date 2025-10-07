drop database if exists Hospital;

create database Hospital;

use Hospital;

create table Persona (
DNI char(9) not null,
Telefono char(12) not null,
Nombre char(40) not null,
Fecha_nacimiento date not null,
primary key (DNI)
);

create table Medico (
DNI char(9) not null,
Salario real not null,
primary key (DNI),
foreign key (DNI) references Persona(DNI),
check (Salario >=0)
);

create table Paciente (
DNI char(9) not null,
num_ss char(15) not null,
primary key(DNI),
unique(num_ss),
foreign key(DNI) references Persona(DNI)
);

create table Planta (
Numero integer not null,
Nombre char(40) not null,
primary key(Numero)
);

create table Cama (
Numero_planta integer not null,
Numero_cama integer not null,
primary key(Numero_planta, Numero_cama),
foreign key (Numero_planta) references Planta(Numero)
);

create table Reconocimiento (
codigo char(20) not null,
fecha date not null,
duracion integer not null,
DNI_Medico char(9) not null,
DNI_Paciente char(9) not null,
primary key(codigo),
foreign key (DNI_Medico) references Medico(DNI),
foreign key (DNI_Paciente) references Paciente(DNI)
);

create table ingreso (
codigo char(20) not null,
fecha_entrada date not null,
fecha_alta date,
DNI_Paciente char(9) not null,
Numero_Planta integer not null,
Numero_Cama  integer not null,
primary key (codigo),
foreign key (DNI_Paciente) references Paciente(DNI),
foreign key (Numero_Planta,Numero_Cama) references Cama(Numero_Planta,Numero_Cama)
);
