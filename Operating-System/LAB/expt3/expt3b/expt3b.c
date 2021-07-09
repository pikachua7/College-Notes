/* *****sum of integers upto that number
#include<pthread.h>
#include<stdio.h>

int sum;
void *runner(void *param);

int main(int argc,char* argv[]){
    pthread_t tid;
    pthread_attr_t attr;
    
    if(argc!=2){
        fprintf(stderr,"usage : a.out <integer value>\n");
        return -1;
    }
    if(atoi(argv[1]) < 0){
        fprintf(stderr,"%d must be >=0\n",atoi(argv[1]));
        return -1;
    }
    pthread_attr_init(&attr);
    pthread_create(&tid,&attr,runner,argv[1]);
    pthread_join(tid,NULL);
    printf("Sum = %d\n",sum);
}

void *runner(void *param){
    int i,upper=atoi(param);
    sum=0;
    for(i=1;i<=upper;i++){
        sum+=i;
    }
    pthread_exit(0);
}*/





//sum upto integers using 2 threads ex. 500 given  .. 
//thread 1 : sum 1 to 250  thread 2: sum 251 to 500
#include<pthread.h>
#include<stdio.h>
#include<stdlib.h>
#include<sys/types.h>
#include<sys/syscall.h>
#include<linux/unistd.h>

int sum;
void *runner(void *param);
int main(int argc,char* argv[]){
    pthread_t tid1;
    pthread_t tid2;
    pthread_attr_t attr1,attr2;
    
    if(argc!=2){
        fprintf(stderr,"usage : a.out <integer value>\n");
        return -1;
    }
    if(atoi(argv[1]) < 0){
        fprintf(stderr,"%d must be >=0\n",atoi(argv[1]));
        return -1;
    }
    
    pthread_attr_init(&attr1);
    pthread_create(&tid1,&attr1,runner,argv[1]);
    printf("1111\n");
    //printf("Thread id1=%d\n",gettid()); 
    pthread_join(tid1,NULL); 
    printf("2222\n");
    printf("Thread id1=%ld\n",pthread_self()); 
      
    pthread_attr_init(&attr2);
    pthread_create(&tid2,&attr2,runner,argv[1]);
    printf("3333\n");
    //printf("Thread id2=%d\n",gettid()); 
    pthread_join(tid2,NULL);
    printf("4444\n");
    printf("Thread id2=%ld\n",pthread_self()); 
    
    printf("Sum = %d\n",sum);
}

void *runner(void *param){
    int i,upper1=(atoi(param))/2;
    int j,upper2=atoi(param);
    if(sum==0){
        for(i=1;i<=upper1;i++){
            sum+=i;    
        }
        printf("sum1=%d\n",sum);
        printf("Thread id3=%d\n",syscall(__NR_gettid)); 
    }
    
    
    else{
        for(j=upper1+1;j<=upper2;j++){
            sum+=j;
        }
        printf("sum2=%d\n",sum); 
        printf("Thread id4=%ld\n",syscall(__NR_gettid)); 
    }
    
    pthread_exit(0);
}







































