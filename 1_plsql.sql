-- EJERCICIO 1
/* 
 Autor: VA
 Fecha: 20/02/2020
 Descripcion: MOSTAR EL NUMERO DE LA VARIABLE, Y VER SI COINCIDE CON LOS DE LA IF
 
*/
-- IF

DECLARE
   a number(3) := 10;
BEGIN
     IF ( a = 50 ) THEN
        dbms_output.put_line('El valor exacto de a es: 10' );
     ELSIF ( a = 75 ) THEN
        dbms_output.put_line('El valor exacto de a es: 20' );
     ELSE
        dbms_output.put_line('Ninguno de los valores coincide');
    END IF;
    --- Sacar por pantalla el valor de la variable a
    dbms_output.put_line('El valor exacto de a es: '|| a ); 
END;

-- EJERCICIO 2
/* 
 Autor: VA
 Fecha: 20/02/2020
 Descripcion: DEFINIR UNA VARIABLE Y CON UNA REPETITIVA, IR SUMANDO ESA VARIABLE.
 CON UN SWITCH COMPARAR ESA VARIABLE Y MOSTRAR UN TEXTO
*/
--CASE
--set SERVEROUTPUT ON;
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
           dbms_output.put_line( 'NO ES NI 1, NI 2, NI 3') ;
              --EXIT ;
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
            WHEN LN$Num=1 THEN xxxx ( '1' ) ;
            WHEN LN$Num=2 THEN xxxx ( '2' ) ;
            WHEN LN$Num=3 THEN xxxx ( '3' ) ;
           ELSE      
              EXIT ;
         xxxxx;
       End loop ;
End ;

-- EJERCICIO 3
/* 
 Autor: xxxx
 Fecha: xxxxx
 Descripcion: xxxxx
*/
-- CASE MULTIPLES
Declare
     LN$Num pls_integer := 0 ;
Begin
      Loop
          LN$Num := LN$Num + 1 ;
          CASE
            WHEN LN$Num between  xxxx 
                 THEN dbms_output.put_line( To_char( LN$Num ) || ' -> 1-3' ) ;
            WHEN LN$Num < 5 
                 THEN dbms_output.put_line( To_char( LN$Num ) || ' < 5' ) ;
            ELSE 
                 dbms_output.put_line( To_char( LN$Num ) || ' >= 5' ) ;
          END CASE ;
         -- Condición de salida LN$Num = 5
         xxxx ;
       End loop ;
End ;
