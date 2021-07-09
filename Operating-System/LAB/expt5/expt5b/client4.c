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
   int msqid4,len;
   key_t key4=1003;
   if((msqid4= msgget(key4, 0644)) == -1)
     {
       printf("server not active");
       exit(1);
     } 
     printf("client ready 4: \n");
     while(msgrcv(msqid4, &mq ,sizeof(mq.text), 1, 0)!= -1)
       {
        printf("from server : \"%s\"\n",mq.text);
        printf("enter the text");
        fgets(mq.text, sizeof(mq.text),stdin);
        len=strlen(mq.text);
        if(mq.text[len-1]== '\n')
           mq.text[len-1]== '\0';
        msgsnd(msqid4, &mq, len+1, 0);   
       }
       printf("server disconnected \n");
 
 } 
