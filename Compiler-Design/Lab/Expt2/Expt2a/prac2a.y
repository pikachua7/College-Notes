%{ 
  
#include<stdio.h>

%} 
  
%token NUM ID   
%left '+' '-'
%left '*' '/'
  

%% 
S : exp {
    printf("\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
    printf("\nENTERED EXPRESSION IS VALID!!! ");
    if ($$!=0){
        printf("\nTHE VALUE OF THE EXPRESSION : %d\n", $$);
        printf("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
    }
    return 0; 
} 
  
exp : exp '+' exp { $$ = $1 + $3; } 
| exp '-' exp { $$ = $1 - $3; } 
| exp '*' exp { $$ = $1 * $3; } 
| exp '/' exp { $$ = $1 / $3; }
| '(' exp ')' { $$ = $2; } 
| NUM { $$ = $1; } 
| ID { $$ = $1; }; 
%% 
  
int main() {
    printf("\n-------------------------------------------------------------");
    printf("\nENTER THE EXPRESSION TO BE CHECKED : \n\t"); 
    yyparse(); 
    
} 
  

int yyerror(char* s) { 
    printf("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
    printf("\nTHE ENTERED EXPRESSION IS INVALID!!!\n"); 
    printf("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
}