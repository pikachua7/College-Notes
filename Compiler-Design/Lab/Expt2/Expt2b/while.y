%{
#include<stdio.h>
#include<stdlib.h>
%}
%token WHILE OPENBRACKET CLOSEDBRACKET CURLEOPEN CURLECLOSED EQUAL RELATIONALOPERATOR SEMICOLON NUMBER ID NL LOGICALOPERATOR SPACE
%left '+' '-'
%left '*' '/'
%%
stmt: WHILE OPENBRACKET CONDITION CLOSEDBRACKET CURLEOPEN NL STATEMENT CURLECLOSED NL {printf("\nACCEPTED\n",$1);exit(0);}
;
  
CONDITION: ID RELATIONALOPERATOR STATEMENT
| STATEMENT RELATIONALOPERATOR STATEMENT
| CONDITION SPACE LOGICALOPERATOR SPACE CONDITION
;

STATEMENT: STATEMENT '+' STATEMENT
| STATEMENT '-' STATEMENT
| STATEMENT '*' STATEMENT
| STATEMENT '/' STATEMENT
| '(' STATEMENT ')'
| ID
| ID EQUAL STATEMENT SEMICOLON NL
| STATEMENT STATEMENT
| NUMBER
;

%%
int yyerror(char *msg)
{
printf("Invalid Expression \n");
}
main()
{
printf("\nEnter the expression : \n\n");
yyparse();
return 0;
}
int yywrap(){return 1;}