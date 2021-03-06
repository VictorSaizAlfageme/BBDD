--EJERCICIO 1

SELECT APELLIDO, SALARIO, DEPT_NO FROM EMPLE WHERE SALARIO > 2000 AND DEPT_NO IN (10,20);

--EJERCICIO 2

SELECT APELLIDO, SALARIO FROM EMPLE WHERE (SALARIO > 1500 AND SALARIO < 2000);

--EJERCICIO 3

SELECT APELLIDO, DEPT_NO FROM EMPLE WHERE DEPT_NO IN (10, 30);

--EJERCICIO 4

SELECT APELLIDO, OFICIO FROM EMPLE  WHERE ID_JEFE IS NULL;



--TAREAS A REALIZAR_SELECT_BASICAS

--EJERCICIO 1
SELECT EMP_NO, APELLIDO, OFICIO
FROM EMPLE
WHERE DEPT_NO=20 AND UPPER(OFICIO)='ANALISTA'
ORDER BY APELLIDO DESC, EMP_NO DESC;

--EJERCICIO 2
SELECT APELLIDO, OFICIO, FECHA_ALTA
FROM EMPLE
WHERE FECHA_ALTA BETWEEN TO_DATE('01/05/1981','DD/MM/YYYY') AND TO_DATE('30/09/1981','DD/MM/YYYY')
ORDER BY FECHA_ALTA;

--EJERCICIO 3
SELECT APELLIDO||','||OFICIO AS "EMPLE Y OFI"
FROM EMPLE
WHERE UPPER(OFICIO) LIKE ('%R%')
ORDER BY APELLIDO;

--EJERCICIO 4
SELECT DISTINCT OFICIO
FROM EMPLE;

--EJERCICIO 5
SELECT APELLIDO, SALARIO AS "SALARIO MENSUAL", SALARIO*12 AS "SALARIO ANUAL"
FROM EMPLE
WHERE SALARIO*12 NOT BETWEEN 9000 AND 20000;

--EJERCICIO 6
SELECT *
FROM EMPLE
WHERE COMISION_PCT IS NOT NULL;

SELECT APELLIDO ||'NO TIENE COMISION'
FROM EMPLE
WHERE COMISION_PCT IS NULL;

SELECT APELLIDO, SALARIO || NVL(TO_CHAR(COMISION_PCT) , 'SIN COMISION')
FROM EMPLE;

SELECT USER_CONSTRAINTS.TABLE_NAME, USER_CONSTRAINTS.CONSTRAINT_NAME, 
USER_CONSTRAINTS.CONSTRAINT_TYPE, USER_CONSTRAINTS.SEARCH_CONDITION, USER_CONS_COLUMNS.COLUMN_NAME
FROM USER_CONSTRAINTS, USER_CONS_COLUMNS
WHERE UPPER(USER_CONSTRAINTS.TABLE_NAME) IN ('EMPLE','DEPART')
    AND USER_CONSTRAINTS.CONSTRAINT_NAME = USER_CONS_COLUMNS.CONSTRAINT_NAME;

