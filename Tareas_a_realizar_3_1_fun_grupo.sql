--Ejercicio 1
select avg(salario) as media, max(salario) as maximo, min(salario) as minimo, sum(salario) as suma
from emple
where Upper(oficio)='COMERCIAL';

--Ejercicio 2
select max(fecha_alta) as "mayor antigüedad", min(fecha_alta) as "menor antigüedad"
from emple;

select apellido, fecha_alta
from emple
where fecha_alta in (select min(fecha_alta) from emple);

--Ejercicio 3
select apellido from emple order by apellido asc;

select min(apellido) primero, max (apellido) as ultimo
from emple;

--Ejercicio 4
select count(emp_no)
from emple
where dept_no = 40;

--Ejercicio 5
select count(emp_no)
from emple
where dept_no = 30 and comision_pct is not null;

--Ejericio 6
select  count(dept_no), depart.dnombre
from emple, depart
group by dept_no;