%{
/*
Modificar el compilador del ejemplo para que tome como entrada un archivo con medidas  
en metros y en pies que representan perimetros de cuadrilateros y TRiangulos.  Presentar 
la medida de aquellos que sean mayor a 20 m y caldular su promedio.  (1 M =  3.28 PIES)
En el arcivo de entrada los triangulos tienen una T y los cuadrilateros una C en la primera 
columna. En la tercera columna las unidades de medidas M= Metros y P = Pies. 
Las unides de medidas siempre deben de presentarse en Metros.
*/
#include <stdlib.h>
#include "y.tab.h"
%}
entero [0-9]+
%%
T {return tTriangulo;}
C {return tCuadrilatero;}
M {return tMetros;}
P {return tPies;}
{entero} {yylval.valInt = atoi(yytext); return tValorMedida;}
. ;
\n ;
