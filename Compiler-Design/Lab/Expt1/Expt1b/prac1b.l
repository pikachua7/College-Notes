%{
    #include<stdio.h>
    #include<string.h>
    int male=0,female=0,tcs=0,infsys=0,wipro=0,acc=0,infmat=0,n=0,it=0,ec=0,cs=0;

%} 

%% 

[a-z.0-9]+@[a-z]+.[a-z]+ {n++;printf("\nEMAIL : %s", yytext);}

Male|Female {printf("\nGENDER : %s", yytext);
    if(strcmp(yytext,"Male")==0) male++;
    else if(strcmp(yytext,"Female")==0) female++;
}

CSE|EC|IT {printf("\nBRANCH : %s", yytext);
    if(strcmp(yytext,"CSE")==0) cs++;
    else if(strcmp(yytext,"IT")==0) it++;
    else if(strcmp(yytext,"EC")==0) ec++;
}

TCS|Infosys|Wipro|Accenture|Informatica {printf("\nCOMPANY : %s", yytext);
    if(strcmp(yytext,"TCS")==0) tcs++;
    else if(strcmp(yytext,"Infosys")==0) infsys++;
    else if(strcmp(yytext,"Wipro")==0) wipro++;
    else if(strcmp(yytext,"Accenture")==0) acc++;
    else if(strcmp(yytext,"Informatica")==0) infmat++;
} 

[0-9][.][0-9] {n++;printf("\nCGPA : %s", yytext);} 

[0-9]*+"."+[0-9] {n++;printf("\nPACKAGE : %s", yytext);}

[8-9]{1}[0-9]{9} {n++;printf("\nMOBILE NO. : %s", yytext);}

[a-zA-Z_]+ {n++;printf("\nNAME : %s", yytext);} 

. ; 
%% 


int main(void) 
{
    yyin=fopen("data.txt","r");
    yylex(); 
    printf("\n");
    printf("\n==============PLACEMENT STATISTICS===================\n");
    printf("\nSTUDENTS PLACED IN TCS = %d\n",tcs); 
    printf("\nSTUDENTS PLACED IN INFOSYS = %d\n",infsys);
    printf("\nSTUDENTS PLACED IN WIPRO = %d\n",wipro);
    printf("\nSTUDENTS PLACED IN ACCENTURE = %d\n",acc);
    printf("\nSTUDENTS PLACED IN INFORMATICA = %d\n",infmat);
    printf("\n================STUDENTS STATISTICS=====================\n");
    printf("\nFEMALE STUDENTS PLACED = %d\n",female);
    printf("\nMALE STUDENTS PLACED = %d\n",male);
    printf("\n================BRANCH STATISTICS=====================\n");
    printf("\nSTUDENTS PLACED FROM CSE = %d\n",cs);
    printf("\nSTUDENTS PLACED FROM IT = %d\n",it);
    printf("\nSTUDENTS PLACED FROM EC = %d\n",ec);
} 

int yywrap(void){
    return(1);
}