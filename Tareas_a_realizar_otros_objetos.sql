--Ejercicio 1
desc depart;

select constraint_name, column_name
from user_cons_columns
where lower(table_name) = 'depart';

create table departseq
as select * from depart;

select * from departseq;

--Ejercicio 2

create sequence DEP_IP_SEQ
start with 200
maxvalue 1000
increment by 10
nocycle nocache;

desc user_sequences;

select sequence_name, min_value, max_value, increment_by
from user_sequences
where lower(sequence_name) = 'dep_ip_seq';
