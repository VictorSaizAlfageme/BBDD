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
            
            
            
            
            
select distinct upper(d.loc) as localidad, nvl(to_char(d.dept_no), ' ') as codigo, nvl(' ',' ') as almacen
from depart d 
union select distinct upper(loc) as ciudad, null, nvl(anombre,'')
            from almacenes;
            
 --Sacar los datos de los empleados que trabajan en un departamento cuya localidad tenga tambien almacenes
           
            
            
--Ejercicio 
alter table empleados add constraint fk_dept_no foreign key (dpto_cod)  references  departs (dept_no);  

--Ejercicio 4
alter table DEPARTS add  PRESUPUESTO NUMBER(6);
alter table departs add CONSTRAINT presu_ck CHECK(presupuesto between  100000 AND 300000);

insert into departs( presupuesto) select presupuesto from departs where upper(dnombre) = 'INVESTIGACION' ;
                 