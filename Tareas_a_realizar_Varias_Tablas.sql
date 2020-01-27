--Ejercicio 1
select emple.apellido, emple.oficio, emple.emp_no, depart.dnombre, depart.loc
from emple, depart
WHERE EMPLE.DEPT_NO = depart.dept_no;

--Ejercicio 2
select emple.apellido, emple.oficio, emple.emp_no, depart.loc, id_jefe
from emple, depart
where upper(depart.loc) in (('MADRID'),('BARCELONA'));

--Ejercicio 3
select e.emp_no as "codigo",e.apellido , e.id_jefe as cd ,j.apellido as "apellido jefe", j.emp_no as "codigo jefe"
from emple e, emple j 
where e.id_jefe=j.emp_no ;
-- Salen los apellidos de los jefes ya que al coger la e.id_jefe es a la vez la id de del jefe como empleado y lo comparas con
-- el emp_no de jefe y sacas su apellido ya que a la vez de jefe es empleado

--Ejercicio 4

select e.apellido, e.oficio, d.loc
from emple e, depart d
where  e.dept_no = d.dept_no and 
        upper(e.oficio) = 'ANALISTA';

--Ejercicio 5

select e.apellido, nvl(j.apellido, 'NO TIENE JEFE') AS "APELLIDO JEFE"
from emple e, emple j
where e.id_jefe = j.emp_no(+);

--EJERCICIO 6
select e.apellido, nvl(d.dnombre, 'NO TIENE departamento') as departamento
from emple e, depart d
where e.dept_no = d.dept_no(+);




----prueba

select d.dept_no, d.dnombre, e.apellido 
from emple e, depart d 
where e.dept_no(+)=d.dept_no;