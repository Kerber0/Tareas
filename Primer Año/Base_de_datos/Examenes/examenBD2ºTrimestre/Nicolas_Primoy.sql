

/*1*/  insert into persona(dni, telefono, nombre, fecha_nacimiento)
values("34255814P", "678254231", "Emilio Casas Novas", "1992/10/10");

	insert into medico(dni, salario)
    values ("34255814P", 2800);
    
   
/*2*/     insert into ingreso(codigo, fecha_entrada, fecha_alta, dni_paciente, numero_planta, numero_cama)
values("I04", "2025/04/02", null, (select dni from persona
    where nombre = "Maria Garcia Lopez"),(   select numero from planta 
    where nombre = "Medicina Interna"), "8");
   
   /*3*/  update  ingreso set fecha_alta = "2025/04/03" 
   where codigo = "I04";
   
   /*4 */
   
   delete from reconocimiento_medico where dni_medico = (select dni from persona where nombre = "Borja Valle Estevez");
   delete from medico where dni = (select dni from persona where nombre = "Borja Valle Estevez");
   delete from persona where nombre = "Borja Valle Estevez";
   
