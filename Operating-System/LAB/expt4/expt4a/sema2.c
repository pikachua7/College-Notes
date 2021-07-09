#include<stdio.h>
#include<semaphore.h>
#include<pthread.h>
#include<stdlib.h>
#include<unistd.h>
#include<sys/stat.h>
#include<fcntl.h>

int main(int argc,char* argv[])
{
	char *name="my semaphore";
	int VALUE=2;
	sem_t *sema;
	printf("Open or Creat a named semaphore,%s,its value is %d\n",name,VALUE);
	sema=sem_open(name,O_CREAT,0666,VALUE);
	sem_wait(sema);
	printf("decreae semaphore by 1\n");
	sem_post(sema);
	printf("add semaphore by 1\n");
	sem_close(sema);
	sem_unlink(name);
	return 0;
}
