%{
  /*
Modificar el compilador del ejemplo para que tome como entrada un archivo con medidas  
en metros y en pies que representan perimetros de cuadrilateros y TRiangulos.  Presentar 
la medida de aquellos que sean mayor a 20 m y caldular su promedio.  (1 M =  3.28 PIES)
En el arcivo de entrada los triangulos tienen una T y los cuadrilateros una C en la primera 
columna. En la tercera columna las unidades de medidas M= Metros y P = Pies. 
Las unides de medidas siempre deben de presentarse en Metros.
*/
int numMedidasTriangulos = 0;
int numMedidasCuadrilateros = 0;
#include <stdio.h>
%}
%union{
int valInt;
float valFloat;
}
%token tTriangulo tCuadrilatero tMetros tPies
%token <valInt> tValorMedida
%type <valFloat> MEDIDA TRIANGULOS CUADRILATEROS LISTA_TRIANGULOS LISTA_CUADRILATEROS
%start S
%%
S : LISTA_CUADRILATEROS LISTA_TRIANGULOS {printf("CUADRILATEROS Media en Total: %f C\n", $1/(float)numMedidasCuadrilateros);
printf("TRIANGULOS Media en Total: %f C\n", $2/(float)numMedidasTriangulos);}
 ;

LISTA_CUADRILATEROS : LISTA_CUADRILATEROS CUADRILATEROS {$$ = $1 + $2; numMedidasCuadrilateros++;}
 | CUADRILATEROS {$$ = $1; numMedidasCuadrilateros++;}
 ;

LISTA_TRIANGULOS : LISTA_TRIANGULOS TRIANGULOS {$$ = $1 + $2; numMedidasTriangulos++;}
 | TRIANGULOS {$$ = $1; numMedidasTriangulos++;}
 ;

CUADRILATEROS : tCuadrilatero MEDIDA {if($2 >= 20) { $$ = $2;}}
 ;

TRIANGULOS : tTriangulo MEDIDA { if($2 >= 20) { $$ = $2;}}
 ;

MEDIDA : tValorMedida tMetros {$$ = $1;}
 | tValorMedida tPies {$$ = $1 / 3.28;}
 ;
 
%%
int yyerror(char *m){
   fprintf(stderr,"Error: %s\n",m);
   return(1);
 }
main() {
 yyparse();
}
