%{
  /*
Modificar el compilador del ejemplo para que tome como entrada un archivo con medidas  
en metros y en pies que representan perimetros de cuadrilateros y TRiangulos.  Presentar 
la medida de aquellos que sean mayor a 20 m y caldular su promedio.  (1 M =  3.28 PIES)
En el arcivo de entrada los triangulos tienen una T y los cuadrilateros una C en la primera 
columna. En la tercera columna las unidades de medidas M= Metros y P = Pies. 
Las unides de medidas siempre deben de presentarse en Metros.
*/

#include <stdio.h>
int numMedidas = 0;
%}
%union{
int valInt;
float valFloat;
}
%token tTriangulo tCuadrilatero tMetros tPies
%token <valInt> tValorMedida
%type <valFloat> MEDIDA MEDICION LISTA_MEDIDAS
%start S
%%
S : LISTA_MEDIDAS {printf("Medidas Media en Total: %f M\n",
$1/(float)numMedidas);}
 ;

LISTA_MEDIDAS : LISTA_MEDIDAS MEDICION {$$ = $1 + $2; if($2 != 0){numMedidas++;}}
| MEDICION {$$ = $1; if($1!=0){numMedidas++;}}
 ;
MEDICION : tTriangulo MEDIDA { if ($2 >= 20) {
  printf ("Triangulo con Medida: %f M\n", $2);
  $$= $2;
  }else{
  $$ = 0.0;
  }
  }
 | tCuadrilatero MEDIDA { if ($2 >= 20) {
  printf ("Cuadrilatero con Medida: %f M\n", $2);
  $$= $2;
  }else{
  $$ = 0.0;
  }
  }
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
