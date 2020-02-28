-- EJERCICIO 1
/* 
 Autor: Victor
 Fecha: 25/02
 Descripcion: una repetitva qeu muestre en pantalla el numero y que acabe cuano el valor de la varuable sea mayor que 2
*/
-- LOOP
Declare
    LN$I pls_integer := 0 ;
Begin
    Loop
        LN$I := LN$I + 1 ;
        dbms_output.put_line( to_char( LN$I) ) ;
        exit when LN$I > 2 ;
    End loop ;
End ;

-- EJERCICIO 2
/* 
 Autor: Victor
 Fecha: 26/02
 Descripcion: sacar por pantalla los numeros del 1 al 3, mientras que la variable sea menor o igual a 3.
*/
-- WHILE
Declare
      LN$I pls_integer := 0 ;
Begin
    While LN$I < 3
      Loop
        LN$I := LN$I + 1 ;
        dbms_output.put_line( to_char( LN$I) ) ;
      End loop ;
End ;

-- EJERCICIO 3
/* 
 Autor: Victor
 Fecha: 25/02
 Descripcion: sacar por pantalla los numeros del 3 al 1, hasta que la variable llege a 1.
*/
--FOR
Declare
--binary tipo de dato, igual  que pls_integer????
Begin
    -- FOR de 3 a 1
    For i in reverse 1..3
      Loop
        dbms_output.put_line( to_char( i ) ) ;
      End loop ;
  End ;


-- EJERCICIO 4
/* 
 Autor: Victor
 Fecha: 25/02
 Descripcion: sacar por pantalla los numeros del 1 al 3, hasta que la variable llege a 3.
*/
-- FOR  de 1 a 3 
Declare 
    LN$I pls_integer := 0 ; 
  -- FOR  de 1 a 3
BEGIN
    For i in 1..3
      Loop
        -- Sacar el valor de i
        dbms_output.put_line ( to_char(i));

      End loop ;
End ;