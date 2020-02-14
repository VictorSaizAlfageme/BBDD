  
/*SACAR LOS DATOS DE LOS EMPLEADOS QUE TRABAJAN EN UN DEPARTAMENTO
CUYA LOCALIDAD TENGA TAMBIEN ALMACENES*/

--EJERCICIO 3

ALTER TABLE EMPLEADOS ADD(
CONSTRAINT EM_DPT_FK FOREIGN KEY(DPTO_COD) REFERENCES DEPARTS(DEPT_NO));

select c.constraint_name, c.constraint_type, col.column_name
from user_constraints c, user_cons_columns col
where upper(c.table_name) = 'EMPLEADOS'
and c.constraint_name = col.constraint_name;

--EJERCICIO 4

ALTER TABLE DEPARTS ADD(
PRESUPUESTO NUMBER(8)
CONSTRAINT DE_PRE_CK CHECK (PRESUPUESTO BETWEEN 100000 AND 300000));

UPDATE DEPARTS 
SET PRESUPUESTO=300000
WHERE UPPER(DNOMBRE)='INVESTIGACION';

UPDATE DEPARTS
SET PRESUPUESTO=150000
WHERE UPPER(DNOMBRE)!='INVESTIGACION';

--EJERCICIO 5

--CONSULTAS

--EJERCICIO 5.1

SELECT DISTINCT EMP_NO ,  TRAB_COD 
FROM HISTORIAL_LABORAL
union
select emp_no, trab_cod
from empleados;


--EJERCICIO 5.2

SELECT h.EMP_NO , h.TRAB_COD, d.dnombre
FROM HISTORIAL_LABORAL h, departs d
where d.dept_no = h.dpto_cod
UNION ALL
SELECT e.emp_no, e.trab_cod, d.dnombre
from empleados e, departs d
where d.dept_no = e.dpto_cod
order by dnombre;

--EJERCICIO 5.3

SELECT DISTINCT EMP_NO ,  TRAB_COD 
FROM HISTORIAL_LABORAL
intersect
select emp_no, trab_cod
from empleados;

--EJERCICIO 5.4

select emp_no, trab_cod
from empleados
minus
SELECT DISTINCT EMP_NO ,  TRAB_COD 
FROM HISTORIAL_LABORAL;


--EJERCICIO 5.5
/*Visualizar el codigo de empleado, codigo de trabajo y el salario actual*/
SELECT EMP_NO, TRAB_COD, SALARIO
FROM EMPLEADOS
UNION
SELECT EMP_NO, TRAB_COD, 0
FROM HISTORIAL_LABORAL;


