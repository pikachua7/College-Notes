/*-------------EXPERIMENT-7-------------------*/
/*
NAME  : ATHARVA PALIWAL

ROLL NO. : 40

TOPIC : DISK SCHEDULING ALGORITHM
*/

/*-------------HEADER FILES----------------*/

#include <stdio.h>
#include <stdlib.h>
#include<stdbool.h>

/*----------------CODE-------------------*/

bool find_Update(int x,int arr[],bool ref_bit[],int frames)
{
	for (int i = 0; i < frames; i++)
	{
		if (arr[i] == x)
		{
			ref_bit[i] = true;
			return true;
		}
	}
	return false;
}
int update(int x,int arr[],bool ref_bit[],int frames,int pt)
{
	while(true)
	{
		if(!ref_bit[pt])
		{
			arr[pt] = x;
			return ((pt+1)%frames);
		}
		ref_bit[pt] = false;
		pt = (pt+1)%frames;
	}
}
int hit_Falut(int refString[], int frames,int len)
{
	int pt,i,x,pf;
	pt=0;
	pf=0; //page faults
	int arr[frames];
	for(int j=0;j<frames;j++) //intially page array all element = -1
	{
		arr[j]=-1;
	}
	bool ref_bit[frames];// for reference bit : true =1 and false=0
	for (i = 0; i <18; i++)
	{
		x = refString[i];
		if(!find_Update(x,arr,ref_bit,frames))
		{
			pt = update(x,arr,ref_bit,frames,pt);
			pf++;
		}
	}
	return pf;
}
int main()
{
	int refString[] = {0,4,1,4,2,4,3,4,2,4,0,4,1,4,2,4,3,4};
	int frames =0,pf=0;
	printf("\n::::::::::::::::::::::::::::::::::::::::::::::::::::\n");
	printf("Enter number of frames: \n");
	scanf("%d",&frames);
	printf("\n......................................\n");
	int len = (sizeof(refString)/sizeof(refString[0]));
	printf("\n......................................\n");
	printf("sizeof(refString) = %d , length = %d\n",sizeof(refString),len);
	printf("\n::::::::::::::::::::::::::::::::::::::::::::::::::::\n");
	for(int j=0;j<(sizeof(refString)/sizeof(refString[0]));j++)
	{
		printf("%d ",refString[j]);
	}
	printf("\n");
	pf = hit_Falut(refString,frames,len);
	printf("\n===================================\n");
	printf("The Number of Page faults are : %d\n",pf);
	printf("\n......................................\n");
	printf("The Page fault probability is : %f\n",(float) pf/18);
	printf("\n.......................................\n");
	printf("The Page fault percentage is : %f\n",(float) (pf*100)/18 );
	printf("\n........................................\n");
	printf("EXITING....\n");
	printf("\n===================================\n");
	return 0;
}

/*-----------------OUTPUT-------------------*/

::::::::::::::::::::::::::::::::::::::::
Enter number of frames: 
5

......................................

......................................
sizeof(refString) = 72 , length = 18

::::::::::::::::::::::::::::::::::::::
0 4 1 4 2 4 3 4 2 4 0 4 1 4 2 4 3 4 

===================================
The Number of Page faults are : 5

......................................
The Page fault probability is : 0.277778

.......................................
The Page fault percentage is : 27.777779

........................................
EXITING....

===================================

