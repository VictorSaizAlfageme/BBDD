--Ejercicio 1
select dept_no, count(*) as "cantidad de empleados" 
from emple
group by dept_no
having count(*)>4
order by count(*) desc;

--Ejericicio 2
select dept_no, sum(salario) as "suma de los salarios", max(salario) as "salario maximo", min(salario) as "salario minimo"
from emple
group by dept_no
order by dept_no asc;

--Ejercicio 3

select count(emp_no) as "num empleados", dept_no
from emple
group by oficio, dept_no;

--Ejercicio 4
select count(emp_no) as "num empleados", dept_no
from emple
group by dept_no;

----------------------------------sacar codigo, nombre del departamento y el numero maximo--------------------------------

select max(count(emp_no)) as "num empleados"
from emple
group by emp_no;

--Ejercicio 5

select dept_no, round(avg(salario*12)) as "salario medio"
from emple
group by dept_no
having max(salario*12) > 25000
order by dept_no;

--Ejercicio 6

select dept_no, round(avg(salario),2) as "salario maximo"
from emple
group by dept_no
order by dept_no asc;

--Ejercicio 7

select count(*) as "num personas", oficio
from emple
group by oficio
order by oficio;

--Ejercicio 8

select id_jefe, min(salario) as " salario minimo"
from emple 
where id_jefe is not null
group by id_jefe
having min(salario*12) <= 20000
order by min(salario) desc;