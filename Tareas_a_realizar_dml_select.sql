--Ejercicio 1

desc emple;

select * from user_constraints where table_name='EMPLE';
select * from emple;

create table empleados30 as select * from emple where dept_no=30;
select * from emple;

desc empleados30;

select *
from USER_CONS_COLUMNS
where upper(TABLE_NAME) = 'EMPLE';

select *
from USER_CONS_COLUMNS
where TABLE_NAME = 'empleados30';
alter table empleados30
add constraint emple30_depart_fk foreign key (dept_no) references depart on delete cascade;
alter table empleados30
add constraint emple30_emp_no_pk primary key (dept_no);
--Ejercicio 2

insert into emple (apellido, emp_no, fecha_alta, salario, oficio, id_jefe, comision_pct, dept_no)
values ('SAAVEDRA',2000, SYSDATE,salario+salario*0.2,comision_pct, dept_no)
where upper(apellido) = 'SALA';
        
        
--. 4 rollback