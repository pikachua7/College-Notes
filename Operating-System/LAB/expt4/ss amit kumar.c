#include<stdio.h>
#include<errno.h>
#include<sys/shm.h>
#include<semaphore.h>
#include<fcntl.h>
#include<stdlib.h>
#include<sys/stat.h>

int main(){
	int i;
	int shmid;
	sem_t *sem;
	pid_t pid;
	int *p;
	int j = 0;
	int k =0;
	
	shmid = shmget(NULL, sizeof(int), 0644 | IPC_CREAT);
	if(shmid < 0){
		perror("shmget \n");
		exit(1);
	}
	p = shmat(shmid, NULL, 0);
	*p = 1000;
	sem = sem_open("pSem", O_CREAT | O_EXCL, 0644, 1);
	int asli = getpid();
	for( i = 0; i< 2; i++){
		pid = fork();
		if( pid == 0)
			break;
	}
	
	if ( pid != 0){
		while(pid = waitpid(-1, NULL, 0)){
			if(errno == ECHILD)
				break;
		}
		
		shmdt(p);
		shmctl(shmid, IPC_RMID, 0);
		
		sem_unlink("pSem");
		sem_close(sem);
		
		exit(0);
	}
	else{
		//sem_wait(sem);
		if(i == 0)
			for(; j< 5; j++){	
				printf("\n Child(%d) is in critical section. ", i);
				*p += 200;
				printf(" %d",*p);
				sleep(2);
			}
		//sem_post(sem);
		
		
		//sem_wait(sem);
		if(i == 1)
			for(; k< 5; k++){
				printf("\n Child(%d) is in critical section. ", i);
				*p += 100;
				printf(" %d",*p);
				sleep(2);
			}
		//sem_post(sem);
		
	}
	
	
	
}
