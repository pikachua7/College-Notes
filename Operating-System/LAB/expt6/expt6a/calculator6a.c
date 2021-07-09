#include<stdio.h>
#include<time.h>
int main(){
	int a,b;
	clock_t start=clock();
	FILE *fptr,*fw;
	fptr=fopen("input.txt","r");
	fw=fopen("output.txt","w");
	if(fptr == NULL)
   {
      printf("Error!");   
      exit(1);             
   }
   
   if(fw == NULL)
   {
      printf("Error!");   
      exit(1);             
   }
   fscanf(fptr,"%d", &a);
   fscanf(fptr,"%d", &b);
   //printf("\n1-> : %d",n1);
   //printf("\n2->: %d\n",n2);
   fprintf(fw,"%s","Addition =");
   fprintf(fw,"%d",(a+b));
   fprintf(fw,"%s","\n");
   fprintf(fw,"%s","Subtraction =");
   fprintf(fw,"%d",(a-b));
   fprintf(fw,"%s","\n");
   fprintf(fw,"%s","Multiplication=");
   fprintf(fw,"%d",(a*b));
   fprintf(fw,"%s","\n");
   fprintf(fw,"%s","Division=");
   fprintf(fw,"%d",(a/b));
   fprintf(fw,"%s","\n");

   close(fptr);
   open(fw);
   clock_t end=clock();
   double time=(double)(end-start)/CLOCKS_PER_SEC;
   
   printf("total time=%f\n",time);
   return 0;
   }
