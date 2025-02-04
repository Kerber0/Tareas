
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
where emp_salario not >1000
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

select emp_num, emp_nome, max(emp_salario), min(emp_salario) from emp 
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

select dep_nome, dep_num, avg(emp_salario) from dep, emp
where dep_num = emp_depnum and avg(emp_salario) > 900;

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


/*26*/


/*27*/








