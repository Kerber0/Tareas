drop database if exists bd_empleados;
create database bd_empleados;
use bd_empleados;
create table tcentr
(
numce int not null,
nomce varchar(100),
senas varchar(100),
constraint pk_tcentr primary key (numce)
);
INSERT INTO `tcentr` (`numce`,`nomce`,`senas`) VALUES (10,'SEDE CENTRAL','Alcala');
INSERT INTO `tcentr` (`numce`,`nomce`,`senas`) VALUES (20,'RELACION CON CLIENTES','Atocha');
create table temple
(
numem int not null,
numde int not null,
extel varchar(10),
fecna date,
fecin date,
salar real,
comis real,
numhi int,
nomem varchar(100),
constraint pk_temple primary key (numem)
);
INSERT INTO `temple` (`numem`,`numde`,`extel`,`fecna`,`fecin`,`salar`,`comis`,`numhi`,`nomem`) VALUES (110,121,'350','2029-11-10','1950-02-15',1800,NULL,3,'PONS, CESAR');
INSERT INTO `temple` (`numem`,`numde`,`extel`,`fecna`,`fecin`,`salar`,`comis`,`numhi`,`nomem`) VALUES (120,112,'840','1935-06-09','1968-10-01',2100,1100,1,'LASA, MARIO');
INSERT INTO `temple` (`numem`,`numde`,`extel`,`fecna`,`fecin`,`salar`,`comis`,`numhi`,`nomem`) VALUES (130,112,'810','1945-09-09','1969-02-01',2900,1100,2,'TEROL, LUCIANO');
INSERT INTO `temple` (`numem`,`numde`,`extel`,`fecna`,`fecin`,`salar`,`comis`,`numhi`,`nomem`) VALUES (150,121,'340','1930-08-10','1948-01-15',4400,NULL,0,'PEREZ, JULIO');
INSERT INTO `temple` (`numem`,`numde`,`extel`,`fecna`,`fecin`,`salar`,`comis`,`numhi`,`nomem`) VALUES (160,111,'740','1939-07-09','1968-11-11',3100,1100,2,'AGUIRRE, AUREO');
INSERT INTO `temple` (`numem`,`numde`,`extel`,`fecna`,`fecin`,`salar`,`comis`,`numhi`,`nomem`) VALUES (180,110,'508','1934-10-18','1956-03-18',4800,500,2,'PEREZ, MARCOS');
INSERT INTO `temple` (`numem`,`numde`,`extel`,`fecna`,`fecin`,`salar`,`comis`,`numhi`,`nomem`) VALUES (190,121,'350','1932-05-12','1962-02-11',3000,NULL,4,'VEIGA, JULIANA');
INSERT INTO `temple` (`numem`,`numde`,`extel`,`fecna`,`fecin`,`salar`,`comis`,`numhi`,`nomem`) VALUES (210,100,'200','1940-09-28','1959-01-22',3800,NULL,2,'GALVEZ, PILAR');
INSERT INTO `temple` (`numem`,`numde`,`extel`,`fecna`,`fecin`,`salar`,`comis`,`numhi`,`nomem`) VALUES (240,111,'760','1942-02-26','1966-02-24',2800,1000,3,'SANZ, LAVINIA');
INSERT INTO `temple` (`numem`,`numde`,`extel`,`fecna`,`fecin`,`salar`,`comis`,`numhi`,`nomem`) VALUES (250,100,'250','1946-10-27','1967-03-01',4500,NULL,0,'ALBA, ADRIANA');
INSERT INTO `temple` (`numem`,`numde`,`extel`,`fecna`,`fecin`,`salar`,`comis`,`numhi`,`nomem`) VALUES (260,100,'220','1943-12-03','1968-07-12',7200,NULL,6,'LOPEZ, ANTONIO');
INSERT INTO `temple` (`numem`,`numde`,`extel`,`fecna`,`fecin`,`salar`,`comis`,`numhi`,`nomem`) VALUES (270,112,'800','1945-05-21','1966-09-10',3800,800,3,'GARCIA, OCTAVIO');
INSERT INTO `temple` (`numem`,`numde`,`extel`,`fecna`,`fecin`,`salar`,`comis`,`numhi`,`nomem`) VALUES (280,130,'410','1948-01-11','1971-10-08',2900,NULL,5,'FLOR, DOROTEA');
INSERT INTO `temple` (`numem`,`numde`,`extel`,`fecna`,`fecin`,`salar`,`comis`,`numhi`,`nomem`) VALUES (285,122,'620','1949-10-25','1968-02-15',3800,NULL,0,'POLO, OTILIA');
INSERT INTO `temple` (`numem`,`numde`,`extel`,`fecna`,`fecin`,`salar`,`comis`,`numhi`,`nomem`) VALUES (290,120,'910','1947-11-30','1968-02-14',2700,NULL,3,'GIL, GLORIA');
INSERT INTO `temple` (`numem`,`numde`,`extel`,`fecna`,`fecin`,`salar`,`comis`,`numhi`,`nomem`) VALUES (310,130,'480','1946-11-21','1971-01-15',4200,NULL,0,'GARCIA, AUGUSTO');
INSERT INTO `temple` (`numem`,`numde`,`extel`,`fecna`,`fecin`,`salar`,`comis`,`numhi`,`nomem`) VALUES (320,122,'620','1957-12-25','1978-02-05',4050,NULL,2,'SANZ, CORNELIO');
INSERT INTO `temple` (`numem`,`numde`,`extel`,`fecna`,`fecin`,`salar`,`comis`,`numhi`,`nomem`) VALUES (330,112,'850','1948-08-19','1972-03-01',2800,900,0,'DIEZ, AMELIA');
INSERT INTO `temple` (`numem`,`numde`,`extel`,`fecna`,`fecin`,`salar`,`comis`,`numhi`,`nomem`) VALUES (350,122,'610','1949-04-13','1984-09-10',4500,NULL,1,'CAMPS, AURELIO');
INSERT INTO `temple` (`numem`,`numde`,`extel`,`fecna`,`fecin`,`salar`,`comis`,`numhi`,`nomem`) VALUES (360,111,'750','1958-10-29','1978-10-10',2500,1000,2,'LARA, DORINDA');
INSERT INTO `temple` (`numem`,`numde`,`extel`,`fecna`,`fecin`,`salar`,`comis`,`numhi`,`nomem`) VALUES (370,121,'360','1967-06-22','1987-01-20',1900,NULL,1,'RUIZ, FABIOLA');
INSERT INTO `temple` (`numem`,`numde`,`extel`,`fecna`,`fecin`,`salar`,`comis`,`numhi`,`nomem`) VALUES (380,112,'880','1968-03-30','1988-01-01',1800,NULL,0,'MARTIN, MICAELA');
INSERT INTO `temple` (`numem`,`numde`,`extel`,`fecna`,`fecin`,`salar`,`comis`,`numhi`,`nomem`) VALUES (390,110,'500','1966-02-19','1986-10-08',2150,NULL,1,'MORAN, CARMEN');
INSERT INTO `temple` (`numem`,`numde`,`extel`,`fecna`,`fecin`,`salar`,`comis`,`numhi`,`nomem`) VALUES (400,111,'780','1969-08-18','1987-11-01',1850,NULL,0,'LARA, LUCRECIA');
INSERT INTO `temple` (`numem`,`numde`,`extel`,`fecna`,`fecin`,`salar`,`comis`,`numhi`,`nomem`) VALUES (410,122,'660','1968-07-14','1988-10-13',1750,NULL,0,'MUÑOZ, AZUCENA');
INSERT INTO `temple` (`numem`,`numde`,`extel`,`fecna`,`fecin`,`salar`,`comis`,`numhi`,`nomem`) VALUES (420,130,'450','1966-10-22','1988-11-19',4000,NULL,0,'FIERRO, CLAUDIA');
INSERT INTO `temple` (`numem`,`numde`,`extel`,`fecna`,`fecin`,`salar`,`comis`,`numhi`,`nomem`) VALUES (430,122,'650','1967-02-26','1988-11-19',2100,NULL,1,'MORA, VALERIANA');
INSERT INTO `temple` (`numem`,`numde`,`extel`,`fecna`,`fecin`,`salar`,`comis`,`numhi`,`nomem`) VALUES (440,111,'760','1966-09-26','1986-02-28',2100,1000,0,'DURAN, LIVIA');
INSERT INTO `temple` (`numem`,`numde`,`extel`,`fecna`,`fecin`,`salar`,`comis`,`numhi`,`nomem`) VALUES (450,112,'880','1966-10-21','1986-02-28',2100,1000,0,'PEREZ, SABINA');
INSERT INTO `temple` (`numem`,`numde`,`extel`,`fecna`,`fecin`,`salar`,`comis`,`numhi`,`nomem`) VALUES (480,111,'760','1965-04-04','1986-02-28',2100,1000,1,'PINO, DIANA');
INSERT INTO `temple` (`numem`,`numde`,`extel`,`fecna`,`fecin`,`salar`,`comis`,`numhi`,`nomem`) VALUES (490,112,'880','1964-06-06','1988-01-01',1800,1000,0,'TORRES, HORACIO');
INSERT INTO `temple` (`numem`,`numde`,`extel`,`fecna`,`fecin`,`salar`,`comis`,`numhi`,`nomem`) VALUES (500,111,'750','1965-10-08','1987-01-01',2000,1000,0,'VAZQUEZ, HONORIA');
INSERT INTO `temple` (`numem`,`numde`,`extel`,`fecna`,`fecin`,`salar`,`comis`,`numhi`,`nomem`) VALUES (510,110,'550','1966-05-04','1986-11-01',2000,NULL,1,'CAMPOS, ROMULO');
INSERT INTO `temple` (`numem`,`numde`,`extel`,`fecna`,`fecin`,`salar`,`comis`,`numhi`,`nomem`) VALUES (550,111,'780','1970-01-10','1988-01-21',1000,1200,0,'SANTOS, SANCHO');
create table tdepto
(
numde int not null,
numce int not null,
direc int,
tidir char,
presu real,
depde int,
nomde varchar(100),
constraint pk_tdepto primary key (numde),
constraint fk_1_depto foreign key (numce) references tcentr(numce) on delete restrict on update restrict,
constraint fk_2_depto foreign key (depde) references tdepto(numde) on delete restrict on update restrict,
constraint fk_3_depto foreign key (direc) references temple(numem) on delete restrict on update restrict
);
INSERT INTO `tdepto` (`numde`,`numce`,`direc`,`tidir`,`presu`,`depde`,`nomde`) VALUES (100,10,260,'P',720000,NULL,'DIRECCION GENERAL');
INSERT INTO `tdepto` (`numde`,`numce`,`direc`,`tidir`,`presu`,`depde`,`nomde`) VALUES (110,20,180,'P',90000,100,'DIRECCION COMERCIAL');
INSERT INTO `tdepto` (`numde`,`numce`,`direc`,`tidir`,`presu`,`depde`,`nomde`) VALUES (111,20,180,'F',66000,110,'SECTOR INDUSTRIAL');
INSERT INTO `tdepto` (`numde`,`numce`,`direc`,`tidir`,`presu`,`depde`,`nomde`) VALUES (112,20,270,'P',54000,110,'SECTOR SERVICIOS');
INSERT INTO `tdepto` (`numde`,`numce`,`direc`,`tidir`,`presu`,`depde`,`nomde`) VALUES (120,10,150,'F',18000,100,'ORGANIZACIÓN');
INSERT INTO `tdepto` (`numde`,`numce`,`direc`,`tidir`,`presu`,`depde`,`nomde`) VALUES (121,10,150,'P',12000,120,'PERSONAL');
INSERT INTO `tdepto` (`numde`,`numce`,`direc`,`tidir`,`presu`,`depde`,`nomde`) VALUES (122,10,350,'P',36000,120,'PROCESO DE DATOS');
INSERT INTO `tdepto` (`numde`,`numce`,`direc`,`tidir`,`presu`,`depde`,`nomde`) VALUES (130,10,310,'P',12000,100,'FINANZAS');
alter table temple add constraint fk_temple foreign key (numde) references tdepto(numde) on delete restrict on update restrict;

