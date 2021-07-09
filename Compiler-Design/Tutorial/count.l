%{
    #include<stdio.h>
	#include<stdlib.h>
    #include<string.h>
	typedef struct node {
    	char word[20];
		int count;
    	struct node * next;
	} node_t ;
	node_t * list = NULL;
	int total_count=0;
%} 

%%

[a-zA-Z0-9]+ {
	printf("%s ",yytext);
	total_count++;
	char temp_word[20];
	strcpy(temp_word,yytext); 
	if(list==NULL){
		list = (node_t *) malloc(sizeof(node_t));
		list->count=1;
		strcpy(list->word,temp_word);
		list->next=NULL;
	}
	else{
		node_t * temp=list;
		while(temp->next!=NULL && strcmp(temp->word,temp_word)!=0){
			temp=temp->next;
		}
		if(strcmp(temp->word,temp_word)!=0){
			node_t *temp1=(node_t *) malloc(sizeof(node_t));
			temp1->count=1;
			strcpy(temp1->word,temp_word);
			temp1->next=NULL;
			temp->next=temp1;
		}
		else{
			temp->count++;
		}
	}
}

. ; 
%% 


int main(void) 
{
    yyin=fopen("document.txt","r");
	printf("\n--------------------------------------------------------------------------------------------------------------------");
	printf("\n DOCUMENT CONTAINS : \n");
    yylex(); 
	printf("\n--------------------------------------------------------------------------------------------------------------------");
	printf("\nCOUNT OF WORDS IN THE DOCUMENT :- ");
	while(list!=NULL){
		printf("\n %s : %d \n",list->word,list->count);
		list=list->next;
	}
	printf("\n---------------------------------------------------------");
	printf("\n Total Count of the Words in Document : %d",total_count);
	printf("\n---------------------------------------------------------");
} 

int yywrap(void){
    return(1);
}