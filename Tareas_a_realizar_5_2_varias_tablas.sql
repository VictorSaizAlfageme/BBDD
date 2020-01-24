--Ejercicio 1
select distinct e.oficio, d.loc
from emple e, depart d
where d.dept_no = 10;

--Ejercicio 2
select  d.dept_no , d.dnombre, count(*) as "Nº Empleados"
from  depart d, emple e
where e.dept_no = d.dept_no 
group by d.dnombre, d.dept_no
order by d.dept_no;

--Ejercicio 3 
select  d.dept_no , d.dnombre, count(*) as "Nº Empleados"
from  depart d, emple e
where e.dept_no = d.dept_no
having max(*)
group by d.dnombre, d.dept_no;

--Ejercicio 4
select e.apellido, d.dnombre, e.salario, e.comision_pct, d.dept_no
from emple e, depart d;

select e.apellido, d.dnombre, e.salario, e.comision_pct,  d.dept_no
from emple e, depart d
where (select e.salario from emple e where Upper(d.loc) != 'BARCELONA') in (select e.salario from emple e where Upper(d.loc) = 'BARCELONA');
