select distinct upper(loc) as ciudades
from depart
intersect select upper(loc)
            from almacenes;
            
select distinct upper(loc) as ciudades
from depart
union select upper(loc)
            from almacenes;
      
select distinct upper(loc) as ciudades
from depart
union all select upper(loc)
            from almacenes;
            
select distinct upper(loc) as ciudades
from depart
minus select upper(loc)
            from almacenes;
            
            
            
            
            
SELECT UPPER(LOC) "LOCALIDAD", NVL(NULL,' ') "NOMBRE ALMACEN" ,  NVL(DNOMBRE,' ') "NOMBRE DEPARTAMENTO"
FROM DEPART 
UNION
SELECT UPPER(LOC) , NVL(ANOMBRE, ' ') , NVL(NULL,' ')
FROM ALMACENES;

 --Sacar los datos de los empleados que trabajan en un departamento cuya localidad tenga tambien almacenes
select distinct upper(loc) as ciudades
from depart
intersect select upper(loc)
            from almacenes;
            
            
--Ejercicio 
alter table empleados add constraint fk_dept_no foreign key (dpto_cod)  references  departs (dept_no);  

--Ejercicio 4
alter table DEPARTS add  PRESUPUESTO NUMBER(6);
alter table departs add CONSTRAINT presu_ck CHECK(presupuesto between  100000 AND 300000);

insert into departs( presupuesto) select presupuesto from departs where upper(dnombre) = 'INVESTIGACION' ;
                 