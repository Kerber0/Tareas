
/*1*/

/*2*/

/*3*/

/*4*/

/*5*/

/*6*/

/*7*/

/*8*/

select emp_num, emp_salario, emp_comm, (emp_salario+emp_comm) as salarioTotal
from emp
where emp_comm > 0
order by emp_num;

/*9*/

select emp_nome
from emp
where emp_salario >1000
and emp_xefe = 7698;

/*10*/

select emp_nome
from emp
where emp_salario not <= 1000
and emp_xefe not = 7698;

/*11*/

select (emp_comm/(emp_salario+emp_comm)*100) as porcentaje
from emp
where emp_comm > 0
order by emp_nome;

/*12*/

select *
from emp
where emp_xefe is null;

/*13*/

select dep_nome, dep_loc
from dep
where dep_nome not in ("vendas", "I+D")
order by dep_loc;

/*14*/

select emp_nome, emp_salario, emp_comm
from emp
where emp_salario 
BETWEEN (select avg(emp_salario)from emp) and (select max(emp_salario)/2 from emp);

/*15*/

select *
from emp
where emp_num in (7844, 7900, 7521, 7782, 7934, 7678, 7369);

/*16*/

select *
from emp join dep
on emp_depnum = dep_num
order by dep_nome, emp_num desc;

/*17*/

select max(emp_salario), min(emp_salario), max(emp_salario)- min(emp_salario)
from emp;

/*18*/

select emp_num, emp_nome from emp 
where emp_salario = (select max(emp_salario) from emp) 
or emp_salario = (select min(emp_salario) from emp);

/*19*/

select emp_nome, emp_salario, emp_posto from emp 
where emp_salario > (select emp_salario from emp where emp_nome = 'Foxo')
or emp_nome = 'Foxo';  

/*20*/

select emp_nome from emp 
order by emp_nome desc
limit 1;

/*21*/

select dep_nome, dep_num, avg(emp_salario), min(emp_salario) from dep, emp
where dep_num = emp_depnum group by dep_num having min(emp_salario)>900;

/*22*/

select emp_nome from emp
where emp_salario >= (select avg(emp_salario) from emp);

/*23*/

select distinct(emp_posto) from emp, dep
where dep_num = emp_depnum and dep_num = 20;

/*24*/

select count(emp_nome) from emp, dep
where dep_num = emp_depnum and dep_num = 30;

/*25*/

select emp_depnum, count(emp_nome) from emp
group by emp_depnum having count(emp_nome) > 3;

/*26*/

select emp_nome from emp
where emp_nome in (select emp_xefe from emp);

/*27*/

select distintc (emp_posto) as Puesto, count(*) as numero from emp
group by emp_posto; 

/*28*/

select dep_nome, sum(emp_salario)
from dep join empon emp_depnum = dep_num
group by dep_nome;



/*29*/

select emp_nome from emp
where emp_nome not in (select emp_xefe from emp where emp_xefe is not null);

/*30*/

select a1.emp_nome as empleado, a2.emp_nome as jefe, (a2.emp_salario-a1.emp_salario) as diferencia
from emp as a1 join emp as a2
where a1.emp_xefe = a2.emp_num order by diferencia;

/*31*/

select em1.emp_nome, em2.emp_nome from emp as em1, emp as em2
where em1.emp_depnum = em2.emp_depnum
and em1.emp_nome> em2.emp_nome;

/*32*/

select e1.emp_nome, e1.emp_salario, e2.emp_nome, e2.emp_salario from emp as e1, emp as e2
where e1.emp_salario> e2.emp_salario and e1.emp_xefe = e2.emp_xefe;

/*33*/

select emp_nome from emp
where emp_xefe = (select emp_num from emp where emp_nome = "Saco");

/*34*/

select emp_nome from emp
where emp_xefe = (select emp_num from emp where emp_nome = "Saco") 
or emp_xefe = (select emp_num from emp where emp_nome ="Rei");

/*35*/

 select e1.emp_nome, e1.emp_salario, e2.emp_nome, e2.emp_salario from emp as e1, emp as e2
where e1.emp_salario= e2.emp_salario and e1.emp_depnum < e2.emp_depnum;
 
 /*36*/
 
 select e1.emp_nome, e2.emp_nome from emp as e1, emp as e2
 where e1.emp_posto = e2.emp_posto and e1.emp_nome> e2.emp_nome;
 
 /*37*/
 
 select e1.emp_nome as empleado, e2.emp_nome as jefe from emp as e1, emp as e2
 where e1.emp_xefe = e2.emp_num
 and e1.emp_depnum != e2.emp_depnum;
 
 /*38*/
 
 select dep_nome, dep_loc, emp_nome, emp_posto
 from dep left join emp on dep_num = emp_depnum;
 
 
/*39*/

select dep_nome, emp_nome 
from emp left join dep on dep_num = emp_depnum;
 
 /*40*/
 
 select emp_nome, dep_nome 
 from  emp left join dep on dep_num = emp_depnum
 union
 select emp_nome, dep_nome
 from  emp right join dep on dep_num = emp_depnum;
 
 /*View*/

create view empleados_saco as select * from emp
where emp_xefe = (select emp_num from emp where emp_nome = "Saco");
 
select * from empleados_saco
 order by emp_salario desc limit 3;

create view empleadosbienpagados as  select * 
from emp where emp_salario >= (select avg(emp_salario) from emp);

select * from empleadosbienpagados;
