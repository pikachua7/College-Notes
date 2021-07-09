#include<stdio.h>
#include<sys/shm.h>
#include<sys/stat.h>
int main()
{
	int seg_id;
	char *shared_memory;
	struct shmid_ds shmbuffer;
	int seg_size;
	const int shared_segment_size=0x6400;
	
	/*Allocate a shared memory segment */
	
	seg_id=shmget(IPC_PRIVATE,shared_segment_size,
					IPC_CREAT| IPC_EXCL|S_IRUSR|S_IWUSR);
					
	/* Attach shared memory segment */
	
	shared_memory=(char*)shmat(seg_id,0,0);
	printf("shared memory attached at addresss %p\n",shared_memory);
	
	/*Determine the segment size*/
	
	shmctl(seg_id,IPC_STAT,&shmbuffer);
	seg_size=shmbuffer.shm_segsz;
	printf("segment size:%d\n",seg_size);
	
	/*Write a string to the shared memory segment*/
	
	sprintf(shared_memory,"Hello World");
	
	/*Detach the shared memory segment */
	
	shmdt(shared_memory);
	
	/*Rettach shared memory segment,at a diff address*/
	
	shared_memory=(char*)shmat(seg_id,(void*) 0x5000000,0);
	printf("shared memory reattached at address %p\n",shared_memory);
	
	/*Print out string form shared memory*/
	
	printf("%s\n",shared_memory);
	
	/*Detach shared memory segment*/
	
	shmdt(shared_memory);
	
	/*Deallocate shared memory segment*/
	
	shmctl(seg_id,IPC_RMID,0);
	
	return 0;
}

/*OUTPUT*/

/*shared memory attached at addresss 0x7f50abfc0000
segment size:25600
shared memory reattached at address 0x5000000
Hello World
*/
	
	
	

