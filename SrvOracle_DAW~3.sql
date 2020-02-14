
View LOCALIDADES creado.


View LOCALIDADES creado.


View LOCALIDADES creado.


Error que empieza en la línea: 34 del comando :
create or replace view Localidades as select distinct upper(loc)
            from depart
            intersect 
            select upper(loc)
            from almacenes
Informe de error -
ORA-00998: debe proporcionar un nombre a esta expresión con un alias de columna
00998. 00000 -  "must name this expression with a column alias"
*Cause:    
*Action:

View LOCALIDADES creado.

Nombre           ¿Nulo?   Tipo           
---------------- -------- -------------- 
VIEW_NAME        NOT NULL VARCHAR2(128)  
TEXT_LENGTH               NUMBER         
TEXT                      LONG           
TEXT_VC                   VARCHAR2(4000) 
TYPE_TEXT_LENGTH          NUMBER         
TYPE_TEXT                 VARCHAR2(4000) 
OID_TEXT_LENGTH           NUMBER         
OID_TEXT                  VARCHAR2(4000) 
VIEW_TYPE_OWNER           VARCHAR2(128)  
VIEW_TYPE                 VARCHAR2(128)  
SUPERVIEW_NAME            VARCHAR2(128)  
EDITIONING_VIEW           VARCHAR2(1)    
READ_ONLY                 VARCHAR2(1)    
CONTAINER_DATA            VARCHAR2(1)    
BEQUEATH                  VARCHAR2(12)   
ORIGIN_CON_ID             NUMBER         
