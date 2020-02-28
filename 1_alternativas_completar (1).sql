-- EJERCICIO 1
/* 
 Autor: Victor
 Fecha: 25/02
 Descripcion: Averiguar si hace el valor de a es 50 o 75;
*/
-- IF

DECLARE
   a number(3) := 75;
   -- a emple.apellido%type;
 
BEGIN
     IF ( a = 50 ) THEN
        dbms_output.put_line('El valor exacto de a es: 10' );
     ELSIF ( a = 75 ) THEN
        dbms_output.put_line('El valor exacto de a es: 20' );
     ELSE
        dbms_output.put_line('Ninguno de los valores coincide');
    END IF;
    --- Sacar por pantalla el valor de la variable a
    dbms_output.put_line ('El valor exacto de a es: '|| a ); 
END;

-- EJERCICIO 2
/* 
 Autor: Victor
 Fecha: 25/02
 Descripcion: si el numero es 1,2,3 saldra por pantalla diciendo el numero que es , y sino es el caso decir que no es 
 ninguno de los casos.
 poner coma final del else,a�adir exit y una condciion,se necesita alguna concicion en alguna parte
*/
--CASE
set SERVEROUTPUT ON;
Declare
    LN$Num pls_integer := 0 ;
    Begin
        Loop
          LN$Num := LN$Num + 1 ;
          CASE LN$Num
            WHEN 1 THEN dbms_output.put_line( '1' ) ;
            WHEN 2 THEN dbms_output.put_line( '2' ) ;
            WHEN 3 THEN dbms_output.put_line( '3' ) ;
           ELSE 
            dbms_output.put_line('no es 1,2,3');
            EXIT ;
            --Exit; Evitar salir de estructuras 
            -- exit when  LN$Num>5;
         END CASE ;
       End loop ;
   End ;

--Otra forma de escribirlo
Declare
     LN$Num pls_integer := 0 ;
Begin
      Loop
          LN$Num := LN$Num + 1 ;
          CASE 
            WHEN LN$Num=1 THEN dbms_output.put_line ( '1' ) ;
            WHEN LN$Num=2 THEN dbms_output.put_line  ( '2' ) ;
            WHEN LN$Num=3 THEN dbms_output.put_line  ( '3' ) ;
           ELSE      
              EXIT ;
            -- EXIT ;--Evitar salir de estructuras
            -- exit when  LN$Num>5;
        end case;
       End loop ;
End ;

-- EJERCICIO 3
/* 
 Autor: Victor
 Fecha: 25/02
 Descripcion: sacar por consola cuando un numero es menor que 5 ,esta entre 1 y 3 y cuando se mayor que 5,falta 
 una condicion para salir del bucle,en las sentencia between a�adir una concicion.
*/
-- CASE MULTIPLES
Declare
     LN$Num pls_integer := 0 ;
Begin
      Loop
          LN$Num := LN$Num + 1 ;
          CASE
            WHEN LN$Num between  1 and 3 
                 THEN dbms_output.put_line( To_char( LN$Num ) || ' -> 1-3' ) ;
            WHEN LN$Num < 5 
                 THEN dbms_output.put_line( To_char( LN$Num ) || ' < 5' ) ;
            ELSE 
                 dbms_output.put_line( To_char( LN$Num ) || ' >= 5' ) ;
          END CASE ;
         -- Condición de salida LN$Num = 5
          exit when LN$Num = 5 ;
       End loop ;
End ;
