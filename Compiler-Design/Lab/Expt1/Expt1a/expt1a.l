%{
#include<stdio.h> 
int functions=0, logicaloperators=0, assignmentoperators=0, arithmeticoperators=0 ,relationaloperators=0, keywords=0, integerconstants=0, floatingconstants=0, charconstants=0, identifiers=0, symbol=0, strings=0, lines=0; 
%}
 
%%
"#include".* {printf("\n%s is HEADER\n",yytext);}

scanf|printf {printf("\n%s is FUNCTION\n",yytext); functions++;}
 
[&&]|[!]|[||] {printf("\n%s is LOGICAL OPERATOR\n",yytext);logicaloperators++;}

[-+%/*] {printf("\n%s is ARITHMETIC OPERATOR\n",yytext);arithmeticoperators++;}

[=]|[-=]|[+=] {printf("\n%s is ASSIGNMENT OPERATOR\n",yytext);assignmentoperators++;}

[==]|[!=]|[<=]|[>=]|[<>] {printf("\n%s is RELATIONAL OPERATOR\n",yytext);relationaloperators++;}

int|float|void|main|char|if|while {printf("\n%s is KEYWORD\n",yytext); keywords++;}
 
[0-9]+ {printf("\n%s is INTEGER CONSTANT\n ",yytext);integerconstants++;}
 
[0-9]+[.][0-9]+ {printf("\n%s is FLOATING CONSTANT\n ",yytext);floatingconstants++;}

['][a-zA-z]+['] {printf("\n%s is CHAR CONSTANT\n",yytext);charconstants++;}

[A-Za-z][A-Za-z0-9]* {printf("\n%s is IDENTIFIER\n",yytext);identifiers++;} 

[{}#()@$:;,?] {printf("\n%s is SPECIAL SYMBOL",yytext);symbol++;} 

\".*\" {printf("\n%s is STRING\n",yytext);strings++;} 

\n lines++; 
%%

int main(void)
{
yyin = fopen("expt1a.txt","r");
yylex();
printf("\n----------------------------------------------");
printf("\n%d KEYWORDS IN C FILE", keywords);
printf("\n%d FUNCTIONS IN C FILE", functions);
printf("\n%d ASSIGNMENT OPERATORS IN C FILE", assignmentoperators);
printf("\n%d RELATIONAL OPERATORS IN C FILE", relationaloperators);
printf("\n%d LOGICAL OPERATORS IN C FILE", logicaloperators);
printf("\n%d ARITHMETIC OPERATORS IN C FILE", arithmeticoperators);
printf("\n%d INTEGER CONSTANTS IN C FILE", integerconstants);
printf("\n%d CHAR CONSTANTS IN C FILE", charconstants);
printf("\n%d FLOATING CONSTANTS IN C FILE", floatingconstants);
printf("\n%d IDENTIFIERS IN C FILE", identifiers);
printf("\n%d STRINGS IN C FILE", strings);
printf("\n%d SYMBOLS IN C FILE", symbol);
printf("\n----------------------------------------------");
printf("\n%d LINES IN C FILE", lines);
}
int yywrap(){
return(1);
}
