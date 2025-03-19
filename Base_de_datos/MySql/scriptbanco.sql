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

/*B*/

insert into cliente values ("11111111A", "Marta", "Principal", 5, 32852, "Lugo"),
("11111111B", "Pedro", null, null, null, null),
("11111111C", "Luis", "Plaza España", 50, 30500, "Ourense"),
("11111111D", "Ana", null, null, null, null);

insert into cliente_telefono values ("11111111A", "666666666"),
("11111111B", "666666667"),
("11111111B", "666666668"),
("11111111C", "666666669");

insert into tipo(nombre, beneficios) values ("Ahorro", null), ("Inversion", null);

insert into cuenta values 
("C1", 1000, 1),
("C2", 2000, 1),
("C3", 1800, 1),
("C4", 3000, 1),
("C5", 750, 1);

insert into cliente_cuenta values 
("11111111A", "C1"),
("11111111C", "C2"),
("11111111D", "C3"),
("11111111D", "C4"),
("11111111C", "C4"),
("11111111B", "C5");

insert into movimiento(num_cuenta, num_movim, fecha, cantidad, importe_final, descripcion)
	values('C1', 1, '2017/01/01', 800, 800, 'Ingreso inicial');
insert into movimiento(num_cuenta, num_movim, fecha, cantidad, importe_final, descripcion)
	values('C1', 2, '2017/01/14', -300, 500, 'Cajero Autom.');
insert into movimiento(num_cuenta, num_movim, fecha, cantidad, importe_final, descripcion)
	values('C1', 3, '2017/02/05', 500, 1000, 'Ingreso');
insert into movimiento(num_cuenta, num_movim, fecha, cantidad, importe_final, descripcion)
	values('C2', 1, '2017/01/01', 1000, 1000, 'Nomina');
insert into movimiento(num_cuenta, num_movim, fecha, cantidad, importe_final, descripcion)
	values('C2', 2, '2017/01/04',  1000, 2000, 'Nomina');
insert into movimiento(num_cuenta, num_movim, fecha, cantidad, importe_final, descripcion)
	values('C3', 1, '2017/01/09', 2100, 2100, 'Ingreso inicial');
insert into movimiento(num_cuenta, num_movim, fecha, cantidad, importe_final, descripcion)
	values('C3', 2, '2017/01/18', -300, 1800, 'Compra TPV');
insert into movimiento(num_cuenta, num_movim, fecha, cantidad, importe_final, descripcion)
	values('C4', 1, '2017/01/14', 1500, 1500, 'Ingreso');
insert into movimiento(num_cuenta, num_movim, fecha, cantidad, importe_final, descripcion)
	values('C4', 2, '2017/01/23', 1500, 3000, 'Ingreso');
insert into movimiento(num_cuenta, num_movim, fecha, cantidad, importe_final, descripcion)
	values('C5', 1, '2017/01/01', 750, 750, 'Ingreso inicial');
    
    
    /*C*/
    set @@autocommit = 0; /*cambiar la variable autocommit a off*/
start transaction;
update cuenta set saldo = saldo - 100 where numero = "C2";
update cuenta set saldo = saldo + 100 where numero = "C4";
update cuenta set saldo = saldo - 100 where numero = "C3";
update cuenta set saldo = saldo + 100 where numero = "C4";
insert into movimiento(num_cuenta, num_movim, fecha, cantidad, importe_final, descripcion)
	values('C2', 3, '2017/01/25', -100, 1900, 'Retiro Transaccion'),
	('C4', 3, '2017/01/25', +100, 3100, 'Ingreso Transaccion'),
    ('C3', 3, '2017/01/25', -100, 1700, 'Retiro Transaccion'),
    ('C4', 4, '2017/01/25', +100, 3200, 'Ingreso Transaccion');
commit;

select * from movimiento;

/*D*/

start transaction;
update cuenta set saldo = saldo - 50 where numero = "C4";
update cuenta set saldo = saldo + 50 where numero = "C5";
rollback;

/*F*/

start transaction;
set @@sql_safe_updates = 0; /* evita problemas para actualizar y borrar datos*/
delete telefono from cliente_telefono where telefono = "666666668";

