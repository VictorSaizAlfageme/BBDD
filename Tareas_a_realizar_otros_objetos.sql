--Ejercicio 1
desc depart;

select constraint_name, column_name
from user_cons_columns
where lower(table_name) = 'depart';

create table departseq
as select * from depart;

select * from departseq;

--Ejercicio 2

create sequence DEPT_ID_SEQ
start with 200
maxvalue 1000
increment by 10
nocycle nocache;

desc user_sequences;

select sequence_name, min_value, max_value, increment_by
from user_sequences
where lower(sequence_name) = 'dept_id_seq';

--Ejercicio 3

select sequence_name, max_value, increment_by, last_number
from user_sequences;

--Ejercicio 4

--está en el script lab9_4.sql

--Ejercicio 5
select dept_id_seq.nextval
from dual;

--Añadir un departamento con la secuandia recien generada
insert into departseq values
(dept_id_seq.currval, 'LOQUEQUIERAS', 'CORONAVIRUS');

select *
from departseq
where dnombre = 'LOQUEQUIERAS';

COMMIT;




