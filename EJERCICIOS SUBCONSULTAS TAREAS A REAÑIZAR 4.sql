--Ejercicio 1
select apellido 
from emple 
where oficio in (select oficio
                 from emple         
                 where upper(apellido) = 'GIL') 
and upper(apellido) not like 'GIL';

--Ejercicio 2
select e.* 
from emple e, depart d
where e.dept_no = d.dept_no and d.loc IN (select loc from depart where upper(loc) in ('MADRID','BARCELONA'));

--Ejercicio 3
select apellido
from emple
where oficio in (select oficio
                 from emple         
                 where upper(apellido) = 'GIL')
and salario = (select salario
                from emple         
                where upper(apellido) = 'GIL')
and upper(apellido) not like 'GIL';

--Ejercicio 4
select * 
from emple
where oficio in (select oficio
                 from emple         
                 where upper(apellido) = 'JIMENEZ')
and salario >= (select salario
                from emple         
                where upper(apellido) = 'FERNANDEZ');
                
--Ejercicio 5
select distinct e.dept_no, count(emp_no)
from emple e, depart d
where e.dept_no = d.dept_no
group by e.dept_no
having count(emp_no)=(select max(count(emp_no))
                    from emple
                    group by dept_no);
                    
--Ejercicio 6
select oficio
from emple
where  salario = (select round(min(salario))
                    from emple);
                    
                    
--Ejercicio 7
SELECT EMP_NO, APELLIDO
FROM EMPLE
WHERE SALARIO in ( SELECT MIN(SALARIO)
				FROM EMPLE
				GROUP BY DEPT_NO);
                
--Ejercicio 8
SELECT APELLIDO, OFICIO
FROM EMPLE
WHERE OFICIO = (SELECT OFICIO
			FROM EMPLE
			WHERE upper(APELLIDO) = 'PEREZ');