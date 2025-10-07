drop database if exists banco;
create database banco;
use banco;

create table cliente(
	dni varchar(9) not null, 
    nombre varchar(50) not null, 
    calle varchar(50), 
    numero int, 
    cp int, 
    localidad varchar(50),
    primary key(dni)
);

create table cliente_telefono(
	dni varchar(9) not null,
    telefono varchar(9) not null,
    primary key(dni, telefono),
    foreign key(dni) references cliente(dni) on delete cascade
);

create table tipo(
	id int not null auto_increment,
    nombre varchar(20) not null,
	beneficios varchar(500),
    primary key(id)
);

create table cuenta(
	numero varchar(50) not null,
    saldo real not null,
	tipo int,
    primary key(numero),
	foreign key (tipo) references tipo(id) on delete set null
);

create table cliente_cuenta(
	dni varchar(9) not null,
    num_cuenta varchar(50) not null,
    primary key(dni, num_cuenta),
    foreign key(dni) references cliente(dni) on delete cascade,
    foreign key(num_cuenta) references cuenta(numero) on delete cascade on update cascade
);

create table movimiento(
	num_cuenta varchar(50) not null, 
    num_movim int not null, 
    fecha date not null, 
    cantidad real not null, 
    importe_final real not null, 
    descripcion varchar(100) not null default 'Movimiento',
    primary key(num_cuenta, num_movim),
    foreign key(num_cuenta) references cuenta(numero) on delete cascade on update cascade
);