REM **** Borrado de las tablas

drop table employees cascade constraints;
drop table departments cascade constraints;
drop table articulos cascade constraints;
drop table fabricantes cascade constraints;
drop table tiendas cascade constraints;
drop table pedidos cascade constraints;
drop table ventas cascade constraints;
Error que empieza en la línea: 3/9 del comando :
drop table ventas cascade constraints
/*Informe de error -
ORA-00942: la tabla o vista no existe
00942. 00000 -  "table or view does not exist"
*Cause: No existe la tabla 
*Action: Crearla*/

/*

Informe de error -
ORA-00942: la tabla o vista no existe
00942. 00000 -  "table or view does not exist"
*Cause: CONSTRAINT MAL ESCRITA, TABLAS NO CREADAS 
*Action: CORREGIR EL ERROR GRAMATICAL, CREAR LAS TABLAS

*/
REM **** Creación de las tablas

CREATE TABLE fabricantes (
cod_fabricante VARCHAR(3),
nombre  VARCHAR2(15),
pais VARCHAR2(15), 
CONSTRAINT fab_cod_pk PRIMARY KEY(cod_fabricante),
CONSTRAINT fab_nom_ck CHECK (nombre = upper(nombre)),
CONSTRAINT fab_pais_ck CHECK (pais= upper(pais))
);
/*
Informe de error -
ORA-00907: falta el paréntesis derecho
00907. 00000 -  "missing right parenthesis"
*Cause:    
*Action:
*/


create table departments(
   department_id NUMBER(2),
   department_name VARCHAR2(30) NOT NULL, 
   manager_id NUMBER(3),
   location_id NUMBER(4),
CONSTRAINT dept_id_pk PRIMARY KEY(department_id)
);
/*
Informe de error -
ORA-00904: "DEPARMENT_ID": identificador no válido
00904. 00000 -  "%s: invalid identifier"
*Cause:    
*Action: 
*/

CREATE TABLE employees (
   employee_id NUMBER(6),
   first_name VARCHAR2(25) NOT NULL ,
   last_name VARCHAR2(25),
   email VARCHAR2(25) UNIQUE, 		
   phone_number NUMBER(12),
   hire_date DATE DEFAULT SYSDATE,
   job_id VARCHAR2(10),
   salary NUMBER(8,2),
   comission_pct NUMBER(5,2),
   manager_id NUMBER(3),
   department_id NUMBER(2),
    CONSTRAINT emp_id_pk PRIMARY KEY(employee_id),
    CONSTRAINT emp_dept_fk FOREIGN KEY(department_id) REFERENCES departments(department_id) 
    );

/*
Informe de error -
ORA-00922: falta la opción o no es válida
00922. 00000 -  "missing or invalid option"
*Cause:    
*Action:
*/


CREATE TABLE articulos (
articulo VARCHAR2(20),
cod_fabricante VARCHAR2(3),
peso NUMBER(3),
categoria VARCHAR2(10),
precio_venta NUMBER(4),
precio_costo NUMBER(4),
existencias NUMBER(5),
CONSTRAINT art_pk PRIMARY KEY(articulo, cod_fabricante, peso, categoria),
CONSTRAINT art_fab_fk FOREIGN KEY(cod_fabricante) REFERENCES fabricantes(cod_fabricante),
CONSTRAINT art_pre_ven_ck CHECK (precio_venta>0),   
CONSTRAINT art_pre_cos_ck CHECK ( precio_costo>0),
CONSTRAINT art_pes_ck CHECK (peso >0),
CONSTRAINT art_cat_ck CHECK (categoria IN('primero','segundo','tercero'))
);
/*
Informe de error -
ORA-00907: falta el paréntesis derecho
00907. 00000 -  "missing right parenthesis"
*Cause:    
*Action:
(articulo, cod_fabricante, peso, categoria) NOT NULL
QUITAR (cod_fabricante) CUANDO LE DAMOS FK
FALTA UN LOWER EN EL CK DE CATEGORIA y no puede tener un valor con decimales
art_pre_ck || POR OR
*/


CREATE TABLE tiendas (
nif VARCHAR2(10),
nombre VARCHAR2(20),
direccion  VARCHAR2(20),
poblacion  VARCHAR2(20),
provincia  VARCHAR2(20),
codpostal  VARCHAR2(5),
CONSTRAINT nif_pk PRIMARY KEY (nif),
CONSTRAINT tie_pro_ck CHECK (provincia = UPPER(provincia))
);
/*
CREAR CONSTRAINT CON LA PK
CORREGIR LA CONSTRAINT DE UPPER PONIENDO UPPER Y CHECK
*/


CREATE TABLE pedidos (
nif VARCHAR2 (10),
articulo VARCHAR2 (20),
cod_fabricante VARCHAR2 (3),
peso NUMBER(3),
categoria VARCHAR2 (10),
fecha_pedido DATE DEFAULT SYSDATE,
unidades_pedidas NUMBER(4),
CONSTRAINT ped_pk PRIMARY KEY(nif,articulo,cod_fabricante,peso,categoria,fecha_pedido),
CONSTRAINT ped_fab_fk FOREIGN KEY (cod_fabricante) REFERENCES fabricantes(cod_fabricante),
CONSTRAINT ped_uni_ck CHECK (unidades_pedidas>0),
CONSTRAINT ped_cat_ck CHECK  (lower(categoria) IN('primero','segundo','tercero')),
CONSTRAINT ped_art_fk FOREIGN KEY (articulo,cod_fabricante,peso,categoria) REFERENCES articulos(articulo,cod_fabricante,peso,categoria),
CONSTRAINT ped_tie_fk FOREIGN KEY (nif) REFERENCES tiendas(nif)
);

/*
Informe de error -
ORA-00907: falta el paréntesis derecho
00907. 00000 -  "missing right parenthesis"
*Cause:    
*Action:

QUITAMOS NOT NULL A LOS PK
DEFAULT EN DATE
CAMBIAR LOS NOMBRES DE LAS CONSTRAINT
corregir la ck de categoria poniendo lower y '
*/




CREATE TABLE ventas(
nif VARCHAR2(10),
articulo VARCHAR2(20),
cod_fabricante VARCHAR2(3),
peso NUMBER(3),
categoria VARCHAR2(10),
fecha_venta DATE DEFAULT SYSDATE,
unidades_vendidas NUMBER(4), 
CONSTRAINT ven_pk PRIMARY KEY(nif, articulo, cod_fabricante, peso, categoria, fecha_venta),
CONSTRAINT ven_fab_fk FOREIGN KEY(cod_fabricante) REFERENCES fabricantes,
CONSTRAINT ven_uni_ck CHECK (unidades_vendidas>0),
CONSTRAINT ven_cat_ck CHECK (lower(categoria) IN('primero','segundo','tercero')),
CONSTRAINT ven_art_fk FOREIGN KEY(articulo, cod_fabricante, peso, categoria) REFERENCES articulos,
CONSTRAINT ven_tie_fk FOREIGN KEY(nif) REFERENCES tiendas
);
/*
Informe de error -
ORA-00942: la tabla o vista no existe
00942. 00000 -  "table or view does not exist"
*Cause:    Esta intentando hacer FK a una tabla todavia no creada.
*Action:Crear la tabla en la cual la fk es clave primaria
*/