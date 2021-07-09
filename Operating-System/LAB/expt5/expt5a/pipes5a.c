#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include<sys/types.h>
#include<string.h>
#include<sys/wait.h>

int main(){
    int fd1[2],n;
    pid_t  pid;
	printf("\n Enter the number in the Fibonacci series :\n");
	scanf("%d",&n);
	int inbuf[n];
	int k=0,even_count=0,odd_count=0;
	int odd_array[n],even_array[n];
	if(pipe(fd1)==-1){
		fprintf(stderr, "Pipe Failed");
		return 1;
	}
	pid = fork();
	if(pid<0){
		fprintf(stderr,"Pipe failed");
		return 1;
	}
	else if (pid>0){
		close(fd1[1]);
		wait(NULL);
		read(fd1[0],inbuf,sizeof(inbuf));
		for(k=0;k<n;k++){
			if((inbuf[k]%2)==0){
				even_array[even_count]=inbuf[k];
				even_count++;
			}
			else{
				odd_array[odd_count]=inbuf[k];
				odd_count++;
			}
		}
		printf("\n");
		printf("\nFrom Parent Process(%d) : ",getppid());
		printf("\nEven elements from fibonnaci series:\n");
		for(k=0;k<even_count;k++){
			printf("%d  ",even_array[k]);
		}
		printf("\nOdd elements from fibonnaci series:\n");
		for(k=0;k<odd_count;k++){
			printf("%d  ",odd_array[k]);
		}
		printf("\n");
		close(fd1[1]);
	}
	else{
		int fibo[n],f=0,s=1,i=0;
		close(fd1[0]);
		for(i=0;i<n;i++){
			if(i<=1){
				fibo[i] = i;
			}
			else{
				fibo[i] = f + s;
				f = s;
				s = fibo[i];
			}
		}
		write(fd1[1],fibo,sizeof(fibo));
		printf("\nFibonacci series from child process(%d) :\n",getpid());
		for(i=0;i<n;i++)
			printf("%d  ",fibo[i]);
		close(fd1[1]);
	}
}
