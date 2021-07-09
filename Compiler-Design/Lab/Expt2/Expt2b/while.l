%{
#include "y.tab.h"
%}
%%
"while" {return WHILE;}
"("   {return OPENBRACKET;}
")"   {return CLOSEDBRACKET;} 
"{"   {return CURLEOPEN;}
"}"   {return CURLECLOSED;}
"="   {return EQUAL;}
" "   {return SPACE;}
"<"|">"|"<="|">="|"!="   {return RELATIONALOPERATOR;}       
"&&"|"||"  {return LOGICALOPERATOR;}
";"   {return SEMICOLON;}
[0-9]+ {yylval=atoi(yytext); return NUMBER;}
[a-zA-Z] {return ID;}
\n {return NL;}
. {return yytext[0];}
%%