#include<stdio.h>
#include<semaphore.h>
#include<pthread.h>
#include<stdlib.h>
#include<unistd.h>
#include<sys/stat.h>
#include<fcntl.h>

int main(int argc,char* argv[])
{
	int fd;
	int VALUE=1;
	sem_t *mutex;
	mutex=sem_open("mutex",O_CREAT,0666,VALUE);
	printf("mom comes home\n");
	sem_wait(mutex);
	printf("mom checks fridge\n");
	fd=open("fridge",O_CREAT|O_RDWR|O_APPEND,0777);
	if(lseek(fd,0,SEEK_END)==0)
	{
		printf("mom goes to buy milk..\n");
		sleep(2);
		write(fd,"milk",5);
		printf("mom puts milk in fridge and leaves..\n");
		if(lseek(fd,0,SEEK_END)>5)
			printf("waste of food..cannot put milk on fridge\n");
	}
	else
	{
		printf("mom closes fridge and leaves..\n");
	}
	close(fd);
	sem_post(mutex);
	sem_wait(mutex);
	sem_unlink(mutex);
	return 0;
}
