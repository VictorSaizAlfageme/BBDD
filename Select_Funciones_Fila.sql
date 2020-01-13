/*1*/

select emp_no, apellido as "Empleado", 
nvl(to_char (id_jefe),'NO TIENE JEFE') as jefe
from emple
order by id_jefe desc ;
--Ejercicio 2
select trunc(salario/1000) as "porcentaje de movilizacion",salario+(salario*trunc(salario/1000))/100 as salario, 
    emp_no, apellido 
from emple;
--Ejercicio 3
select initcap(substr(apellido,1,3)),length(apellido) as "Longitud Apellido",oficio, 
    (to_char(substr(fecha_alta,4,2)) || to_char(substr(fecha_alta,7,2)) || 
    upper(reverse(substr(reverse(apellido),1,2)))) as contraseña
from emple;

select initcap(substr(apellido,1,3)),length(apellido) as "Longitud Apellido",oficio, 
   extract(month from fecha_alta) || substr(extract(year from fecha_alta),2,2) || 
    upper(substr(apellido,-2)) as contraseña
from emple;

--Ejercicio 4
select emp_no as "codigo empleado", apellido, to_char(salario, '999,999.999') as "salario actual" , 
    salario*substr(salario,1,1)/100 as "porcentaje de aumento" , 
    to_char((salario+(salario*substr(salario,1,1))/100), '999,999.999') as salario
from emple;
--Ejercicio 5
select emp_no as "id_emp", salario as "salario actual", 
    nvl(to_char(comision_pct), 'Sin comision') as "porcentaje de comision", 
    nvl(salario*comision_pct/100, 0) as "comision", 
    nvl(salario+salario*comision_pct/100, salario) as "salario total calculado"
from emple;

select nvl2(comision_pct, salario*comision_pct/100, 0) as "comision"
from emple;

select salario, nvl2(comision_pct, salario+salario*comision_pct/100, salario) as "salario total calculado"
from emple;

--5.1 lo mismo que el 5 pero sacar el nombre del departamento
select emp_no as "id_emp", salario as "salario actual", 
    nvl(to_char(comision_pct), 'Sin comision') as "porcentaje de comision", 
    nvl(salario*comision_pct/100, 0) as "comision", 
    nvl(salario+salario*comision_pct/100, salario) as "salario total calculado",
    depart.dnombre as "Nombre Departamento"
from emple, depart
where emple.dept_no = depart.dept_no;

--Ejercicio 6
select emp_no fecha_alta, round(months_between(sysdate, fecha_alta)) as "meses en la empresa",
add_months(fecha_alta,6) as "fecha revision",
next_day(fecha_alta,'viernes') as "Primer Viernes",
last_day(fecha_alta) as "Ultimo dia mes"
from emple
where round(months_between(sysdate, fecha_alta)) <460;
