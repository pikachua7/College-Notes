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
   int msqid2,len;
   key_t key2=1001;
   if((msqid2= msgget(key2, 0644)) == -1)
     {
       printf("server not active");
       exit(1);
     } 
     printf("client ready 2: \n");
     while(msgrcv(msqid2, &mq ,sizeof(mq.text), 1, 0)!= -1)
       {
        printf("from server : \"%s\"\n",mq.text);
        printf("enter the text");
        fgets(mq.text, sizeof(mq.text),stdin);
        len=strlen(mq.text);
        if(mq.text[len-1]== '\n')
           mq.text[len-1]== '\0';
        msgsnd(msqid2, &mq, len+1, 0);   
       }
       printf("server disconnected \n");
 
 } 
