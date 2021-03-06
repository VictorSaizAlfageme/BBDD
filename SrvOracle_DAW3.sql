  
/*SACAR LOS DATOS DE LOS EMPLEADOS QUE TRABAJAN EN UN DEPARTAMENTO
CUYA LOCALIDAD TENGA TAMBIEN ALMACENES*/

--EJERCICIO 3

ALTER TABLE EMPLEADOS ADD(
CONSTRAINT EM_DPT_FK FOREIGN KEY(DPTO_COD) REFERENCES DEPARTS(DEPT_NO));

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
FROM HISTORIAL_LABORAL H;

--EJERCICIO 5.2

SELECT EMP_NO , TRAB_COD 
FROM EMPLEADOS;