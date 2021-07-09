/*NAME    :  ATHARVA PALIWAL
ROLL NO.  :   CS4B40
*/

#include<stdio.h>
#include<semaphore.h>
#include<pthread.h>
#include<stdlib.h>
#include<sys/shm.h>
#include<errno.h>
#include<fcntl.h>

int main(int argc,char* argv[])
{
	int i,j=0,k=0;
	int shmid;
	sem_t *sem;
	pid_t pid;
	int *p;
	unsigned int n;
	unsigned int value;
	shmid=shmget(NULL,sizeof(int),0644|IPC_CREAT);
	if(shmid<0)
	{
		perror("shmget\n");
		exit(1);
	}
	p=(int *)shmat(shmid,NULL,0);
	*p=1000;
	sem=sem_open("psem",O_CREAT|O_EXCL,0644,1);
	//Child
	for(i=0;i<2;i++)
	{
		pid=fork();
		if(pid<0)
		{
			printf("fork failed\n");
			sem_unlink("psem");
			sem_close(sem);
		}
		else
		{
			if(pid==0)
			{
				break;
			}
		}
	}
	if(pid!=0)
	{
		while(pid=waitpid(-1,NULL,0))
		{
			if(errno==ECHILD)
			{
				break;
			}
		}
		shmdt(p);
		shmctl(shmid,IPC_RMID,0);
		sem_unlink("psem");
		sem_close(sem);
		exit(0);
	}
	else
	{
		sem_wait(sem);
		if(i == 0)
		{
			for(; j< 5; j++)
			{	
				printf("\n Child(%d) is in critical section. ", i);
				*p += 200;
				printf("p=%d",*p);
				sleep(1);
			}
		}		
		sem_post(sem);

		sem_wait(sem);
		if(i == 1)
		{
			for(; k< 5; k++)
			{
				printf("\n Child(%d) is in critical section. ", i);
				*p += 100;
				printf("p=%d",*p);
				sleep(1);
			}
		}
		sem_post(sem);
	}
return 0;
}
	
/*OUTPUT -1*/

 /*atharva@atharva:~$ ./sem3

 Child(0) is in critical section. p=1200
 Child(0) is in critical section. p=1400
 Child(0) is in critical section. p=1600
 Child(0) is in critical section. p=1800
 Child(0) is in critical section. p=2000
 Child(1) is in critical section. p=2100
 Child(1) is in critical section. p=2200
 Child(1) is in critical section. p=2300
 Child(1) is in critical section. p=2400
 Child(1) is in critical section. p=2500
 atharva@atharva:~$ */
			
/*OUTPUT-2*/
 /*atharva@atharva:~$ ./sem3

//IF WE COMMENT THE WAIT AND POST OF ELSE PART

 Child(0) is in critical section. p=1200
 Child(1) is in critical section. p=1300
 Child(0) is in critical section. p=1500
 Child(1) is in critical section. p=1600
 Child(0) is in critical section. p=1800
 Child(1) is in critical section. p=1900
 Child(1) is in critical section. p=2200
 Child(0) is in critical section. p=2100
 Child(1) is in critical section. p=2300 
 Child(0) is in critical section. p=2500
 atharva@atharva:~$*/ 

	
	
