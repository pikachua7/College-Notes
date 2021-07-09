#include<stdio.h>
#include<stdlib.h>
#include<sys/types.h>
#include<sys/ipc.h>
#include<sys/msg.h>
#include<string.h>

struct mesgq
{
	long type;
	char text[200];
} mq;


void main()
{
	int msqid1,msqid2,msqid3,msqid4,msqid5,len;
	key_t key1 = 1000;
	key_t key2 = 1001;
	key_t key3 = 1002;
	key_t key4 = 1003;
	key_t key5 = 1004;
	
	if((msqid1 =msgget(key1,0644|IPC_CREAT))==-1)
	{
		perror("msgget error client 1 ");
		exit(1);
	}
	if((msqid2 =msgget(key2,0644|IPC_CREAT))==-1)
	{
		perror("msgget error client 2 ");
		exit(1);
	}
	if((msqid3 =msgget(key3,0644|IPC_CREAT))==-1)
	{
		perror("msgget error client 3");
		exit(1);
	}
	if((msqid4 =msgget(key4,0644|IPC_CREAT))==-1)
	{
		perror("msgget error client 4 ");
		exit(1);
	}
	if((msqid5 =msgget(key5,0644|IPC_CREAT))==-1)
	{
		perror("msgget error client 5 ");
		exit(1);
	}
	
	printf("Server Ready \n");
	printf("Enter text, ^D to quit \n");
	mq.type=1;
	while(fgets(mq.text,sizeof(mq.text),stdin)!=NULL)
	{
		len=strlen(mq.text);
		if(mq.text[len-1]=='\n')
		{
			mq.text[len-1]=='\0';
		}
		msgsnd(msqid1,&mq,len+1,0);
		msgsnd(msqid2,&mq,len+1,0);
		msgsnd(msqid3,&mq,len+1,0);
		msgsnd(msqid4,&mq,len+1,0);
		msgsnd(msqid5,&mq,len+1,0);
		
		if(msgrcv(msqid1,&mq,sizeof(mq.text),1,0));
		{
			printf("From Client 1: \"%s\"\n",mq.text);
		}
		if(msgrcv(msqid2,&mq,sizeof(mq.text),1,0));
		{
			printf("From Client 2: \"%s\"\n",mq.text);
		}
		if(msgrcv(msqid3,&mq,sizeof(mq.text),1,0));
		{
			printf("From Client 3: \"%s\"\n",mq.text);
		}
		if(msgrcv(msqid4,&mq,sizeof(mq.text),1,0));
		{
			printf("From Client 4: \"%s\"\n",mq.text);
		}
		if(msgrcv(msqid5,&mq,sizeof(mq.text),1,0));
		{
			printf("From Client 5: \"%s\"\n",mq.text);
		}
	}
	msgctl(msqid1,IPC_RMID,NULL);
	msgctl(msqid2,IPC_RMID,NULL);
	msgctl(msqid3,IPC_RMID,NULL);
	msgctl(msqid4,IPC_RMID,NULL);
	msgctl(msqid5,IPC_RMID,NULL);
}
	
		
		
