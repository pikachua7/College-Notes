#include <stdio.h>
#include <sys/types.h>
#include <string.h>
#include <stdlib.h>
#include <sys/ipc.h>
#include <sys/msg.h>

struct mesgq
{
  long type;
  char text[200];
  
}mq;
 
 void main()
 {
   int msqid5,len;
   key_t key5=1004;
   if((msqid5= msgget(key5, 0644)) == -1)
     {
       printf("server not active");
       exit(1);
     } 
     printf("client ready 5: \n");
     while(msgrcv(msqid5, &mq ,sizeof(mq.text), 1, 0)!= -1)
       {
        printf("from server : \"%s\"\n",mq.text);
        printf("enter the text");
        fgets(mq.text, sizeof(mq.text),stdin);
        len=strlen(mq.text);
        if(mq.text[len-1]== '\n')
           mq.text[len-1]== '\0';
        msgsnd(msqid5, &mq, len+1, 0);   
       }
       printf("server disconnected \n");
 
 } 
