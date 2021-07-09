#include<stdio.h>
#include<stdlib.h>
#include<pthread.h>
#define BufferSize 10

void *Producer();
void *Consumer();

int BufferIndex=-1;
char BUFFER[10];

pthread_cond_t Buffer_Empty=PTHREAD_COND_INITIALIZER;
pthread_cond_t Buffer_Full=PTHREAD_COND_INITIALIZER;
pthread_mutex_t mVar=PTHREAD_MUTEX_INITIALIZER;

int main()
{	
	pthread_t ptid,ctid;
	
	pthread_create(&ptid,NULL,Producer,NULL);
	pthread_create(&ctid,NULL,Consumer,NULL);
	
	pthread_join(ptid,NULL);
	pthread_join(ctid,NULL);
	return 0;
}

void *Producer()
{
	int i;
	for(i=0;i<15;i++)
	{
		pthread_mutex_lock(&mVar);
		if(BufferIndex==BufferSize-1)
		{
			pthread_cond_wait(&Buffer_Empty,&mVar);
		}
		BUFFER[++BufferIndex]='#';
		printf("Produce :%d \n",BufferIndex);
		pthread_mutex_unlock(&mVar);
		pthread_cond_signal(&Buffer_Full);
	}
}
	
void *Consumer()
{
	int i;
	for(i=0;i<15;i++)
	{
		pthread_mutex_lock(&mVar);
		if(BufferIndex==-1)
		{
			pthread_cond_wait(&Buffer_Full,&mVar);
		}
		
		printf("Consume :%d \n",BufferIndex--);
		pthread_mutex_unlock(&mVar);
		pthread_cond_signal(&Buffer_Empty);
	}
}








/*OUTPUT :

srcoem@srcoem-Veriton-M200-H81:~$ gcc pthrdcond1.c -o pthrd -lpthread
srcoem@srcoem-Veriton-M200-H81:~$ ./pthrd
Produce :0 
Produce :1 
Produce :2 
Produce :3 
Produce :4 
Produce :5 
Produce :6 
Produce :7 
Produce :8 
Produce :9 
Consume :9 
Consume :8 
Produce :8 
Produce :9 
Consume :9 
Consume :8 
Consume :7 
Consume :6 
Consume :5 
Consume :4 
Consume :3 
Consume :2 
Consume :1 
Consume :0 
Produce :0 
Produce :1 
Consume :1 
Consume :0 
Produce :0 
Consume :0 
srcoem@srcoem-Veriton-M200-H81:~$ 
*/


