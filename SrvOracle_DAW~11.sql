/*1*/

select emp_no, apellido, 
nvl(to_char (id_jefe),'NO TIENE JEFE') as jefe
from emple
order by jefe;
--Ejercicio 2
select substr(salario,1,1) as "porcentaje de movilizacion",salario+(salario*substr(salario,1,1))/100 as salario, emp_no, apellido 
from emple;
--Ejercicio 3


























select initcap(substr(apellido,1,3)),length(apellido) as "Longitud Apellido",oficio, (to_char(substr(fecha_alta,4,2))|| to_char(substr(fecha_alta,7,2)) || upper(reverse(substr(reverse(apellido),1,2)))) as contraseña
from emple;
--Ejercicio 4
select concat(emp_no , apellido) as nombre, round(rpad((salario+(salario*substr(salario,1,1))/100),7,0),3) as salario
from emple

