--Sacar localidades las cuales tienen almacen y departamento
select distinct upper(loc) as ciudades
from depart
intersect 
select upper(loc)
from almacenes;

--Sacar codigo de departamento cuya loc tenga almacen
select dept_no as cod
from depart
where upper(loc) in (select distinct upper(loc) as ciudades
            from depart
            intersect 
            select upper(loc)
            from almacenes);
            
--Sacar datos de los empleados cuyos departamento este en una loc con un almacen
select *
from emple
where dept_no in (select dept_no
                from depart
                where upper(loc) in (select distinct upper(loc)
                                    from depart
                                    intersect 
                                    select upper(loc)
                                    from almacenes));
            
--Vista localidades
create or replace view Localidades as select distinct upper(loc) as loc
            from depart
            intersect 
            select upper(loc)
            from almacenes;
            
create or replace view Localidades(loc) as select distinct upper(loc)
            from depart
            intersect 
            select upper(loc)
            from almacenes
            with read only CONSTRAINT loc_lectura;
    
select * from Localidades;

--Sacar datos de los empleados cuyos departamento este en una loc con un almacen
--con una vista anteriormente creada.
select *
from emple
where dept_no in (select dept_no
                from depart
                where upper(loc) in (select upper(loc) 
                                     from Localidades));
desc user_views;                                    
select view_name, text, read_only 
from user_views
where upper(view_name) = 'LOCALIDADES';

select view_name, text 
from user_views
where lower(text_vc) like '%depart%';

--Ejercicio 1
create view EMP_30 as select emp_no, apellido, salario, dept_no
                      from emple
                      where dept_no = 30;
                      
--Sacar las columnas de la vista
desc EMP_30;                     

--Comprobar datos
select * from EMP_30;


--Ejercicio 2
INSERT INTO EMPLE VALUES(9999,'URRUTIA','ANALISTA',7698,NULL,200000,NULL,30);
--Se ha añadido urrutia a la vista

--Ejercicio 3

INSERT INTO EMP_30 VALUES(8888,'RUIZ',280000,30);
--al estar situado en el dept 30 aparecerá en la vista, si añadimos a alguien que no sea del 30 no aparecerá


--Ejercicio 5
create or replace view SAl_20 as
select emp_no as id_emp, apellido as ape_emp, salario*12 as salarioAnual
from emple
where dept_no = 20; 