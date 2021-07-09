#include<stdio.h>
#include<sys/shm.h>
#include<sys/stat.h>
#include<sys/ipc.h>

int main()
{
	int shmid;
	key_t key=0x1000;
	
	shmid=shmget(key,10,IPC_CREAT|0666);
	if(shmid<0)
	{
		printf("unable to create shared memory");
	}
	printf("shmid:%d\n",shmid);
	key=0x1010;
	shmid=shmget(key,10,IPC_CREAT|0666);
	printf("shmid:%d\n",shmid);
	shmid=shmget(IPC_PRIVATE,10,IPC_CREAT|0666);
	return 0;
}

/*OUTPUT*/
/*shmid:7241743
shmid:7274512
*/
