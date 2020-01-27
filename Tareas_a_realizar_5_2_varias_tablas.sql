--Ejercicio 1
select distinct e.oficio, d.loc
from emple e, depart d
where d.dept_no = 10;

--Ejercicio 2
select  d.dept_no , d.dnombre, count(*) as "Nº Empleados"
from  depart d, emple e
where e.dept_no(+) = d.dept_no 
group by d.dnombre, d.dept_no
order by d.dept_no;

--Ejercicio 3 
select  e.dept_no , d.dnombre, count(*) as "Nº Empleados"
from  depart d, emple e
where e.dept_no = d.dept_no 
group by d.dnombre, e.dept_no -- hay que poner d.nombre cuando la seleccionamos porque si no  no se podria escoger de ambs tablas
having count(*) = (select max(count(*)) from emple group by dept_no);

--Ejercicio 4
select e.apellido, d.dnombre, e.salario, e.comision_pct, d.dept_no
from emple e, depart d;

select e.apellido, d.dnombre, e.salario, nvl(to_char(e.comision_pct),'Sin comi') as comision
from emple e, depart d
where d.dept_no = e.dept_no and
(salario, nvl(comision_pct, -1)) in (select e.salario , nvl(e.comision_pct,-1) from depart d, emple e 
where e.dept_no = d.dept_no
and upper(d.loc)='BARCELONA')
and upper(d.loc) != 'BARCELONA';