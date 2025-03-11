/*1a*/

Insert into hotel (nome, calle, numero, CP, localidade) Value ("Hotel Rey", "Avda. Principal", 5, "35700", "A Coruña"),
("Hotel Pazo Verde", "Plaza de España", 18, "35700", "A Coruña"), ("Hotel Sta. María", "Progreso", 114, "35700", "A Coruña");

/*1b*/

alter table participante add participante_hotel char(40);
Insert into participante values ("12345678Z", "Antonio Rodríguez Pérez", "Hotel Rey"),
("11111111B", "María García López", "Hotel Rey"),
("22222222C", "Marcos Veiga López", "Hotel Pazo Verde"),
("33333333B", "María Estévez Ramos", "Hotel Pazo Verde"),
("44444444E", "Javier Rodríguez Cabana", "Hotel Sta. María"),
("55555555T", "Lucía Graña Gómez", "Hotel Sta. María"),
("66666666N", "Borja Valle Estévez", "Hotel Rey");

/*1c*/

insert into arbitro (dni, salario)
(select dni, 500 from participante where participante_hotel = "Hotel Sta. María");

/*1d*/

insert into xogador(dni, data_nacemento)
(select dni, date("1900/01/01") from participante
where participante_hotel <> "Hotel Sta. María");

/*1e*/

update xogador set data_nacemento = 
1985/06/15 where dni = 12345678Z,
1980/09/23 where dni = 11111111B ,
1979/10/03 where dni = 22222222C,
1986/12/17 where dni = 33333333B,
1977/01/30 where dni = 66666666N;


/*1f*/

update arbitro set salario = 450 where dni = 44444444E;