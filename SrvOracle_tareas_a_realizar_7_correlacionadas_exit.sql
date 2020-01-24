--Ejercicio 1
select *
from emple
where salario > (select avg(salario)
                from emple);
                
--Ejercicio 2

select apellido, salario, dept_no
from emple 
where salario > (select avg(salario) from emple);

--Ejercicio 3

select d.loc
from emple e, depart d
where e.comision_pct > e.salario*0.10;

select d.loc
from emple e, depart d
where e.comision_pct > e.salario/1.10;

--Ejercicio 4
select e.apellido
from emple e
where exists(select 'x' from emple ea where e.dept_no = ea.dept_no and e.salario < ea.salario and e.fecha_alta > ea.fecha_alta group by dept_no);

--Ejercicio 5
select  d.dept_no , d.dnombre, count(*) as "Nº Empleados"
from  depart d, emple e
where not exists(select * from emple where d.dept_no = e.dept_no)
group by d.dnombre, d.dept_no
order by d.dept_no;


