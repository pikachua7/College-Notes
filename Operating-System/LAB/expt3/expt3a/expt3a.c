//NAME    : Atharva Paliwal
//ROLL NO : CS4B 40

//Header declaration
#include<sys/types.h>
#include<stdio.h>
#include<sys/ipc.h>
#include<sys/shm.h>
#include<sys/stat.h>

int main()
{
    
    //Variable declaration
    int row,col,i,j;
    int sum1=0;
    
    //Input Section
    printf("Enter no of rows : ");scanf("%d",&row);
    printf("\nEnter no of cols : ");scanf("%d",&col);
    int a[row][col];
    for(i=0;i<row;i++)
    {
        for(j=0;j<col;j++)
        {
            printf("\nEnter element a[%d][%d] : ",i,j);
            scanf("%d",&a[i][j]);
        }
    }
    printf("\n===============================================\n");
    //Allocation of a shared memory segment
    int shmid;
    shmid=shmget(IPC_PRIVATE,sizeof(int),IPC_CREAT | SHM_R | SHM_W);
    
    //Attaching the shared memory segment
    int *sum= shmat(shmid,NULL,0);
       
    for(i=0;i<row;i++)
    {
         if(!fork()) //childProcess
          {
            sum[i]=0;
            for(j=0;j<col;j++)
            {
                sum[i] = sum[i] + a[i][j];
                
            }
            printf("\nChild Process no. %d has PID : %d \n",i+1,getpid());
            printf("\nRow no %d has sum = %d\n",i+1,sum[i]);
          }
             
        else   //parentProcess
        {
            wait(3);
            for(i=0;i<row;i++)
            {
                sum1 = sum1 + sum[i];
                
            }
            printf("\nThis is Parent Process whose PID is : %d\n",getpid());
            printf("\nTotal sum of all elements is %d\n",sum1);
        }     
    }     
    return 0;
    }
