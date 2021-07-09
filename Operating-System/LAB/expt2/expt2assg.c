/*
NAME :           ATHARVA PALIWAL
ROLL NO.:        CS4B40
FILENAME:        expt2assg.c
PROBLEM STATEMENT:
Fdupes is a Linux utility written by Adrian Lopez in C programming Language 
released under MIT License. The application is able to find duplicate files in 
the given set of directories and sub-directories.
Various options can be passed with Fdupes to list, delete and replace the files
 with hard links to duplicates.
Simulate a command named dup that will remove duplicate entries from working 
directory.
The comparison should starts in following order:
Size > Group id > Permissions
Keep the fist created copy only
Note: Make use of cwd(), opendir()/fopendir(), scandir(),
 stat()/ fstat() system calls.*/

/* HEADER FILES */
#include <stdlib.h>
#include <unistd.h>
#include<sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include<stdio.h>
#include<string.h>
#include<dirent.h>
#include<sys/dir.h>
#include<errno.h>
#include<limits.h>
#include <time.h>
#include <sys/sysmacros.h>


/*MAIN*/
int main()
{
	char *str,buff[100],name[100];
	
	//GET CWD
	str=getcwd(buff,sizeof(buff));
	printf("Current Working Directory : ",str);
	printf("----------------------------------");
	
	//SCANDIR
	struct dirent **namelist;
	int n,n1,fd;
    n1 = scandir(".", &namelist, NULL, alphasort);
    if (n1 == -1)
    {
    	perror("scandir");
        exit(EXIT_FAILURE);
    }
    n=n1;
    while(n--)
	{
		printf("%s\n", namelist[n]->d_name);
    }
    
    //STAT
    struct stat s[n1];
    n=n1;
    while(n--)
    {
		stat(namelist[n]->d_name,&s[n]);	
		printf("\n\n");
        printf("Mode: %lo (octal)\n",
                   (unsigned long) s[n].st_mode);
        printf("Ownership:  UID=%ld   GID=%ld\n",
                   (long) s[n].st_uid, (long) s[n].st_gid);
        printf("File size:  %lld bytes\n",
                   (long long) s[n].st_size);
	}
	
	//COMPAIRING FILE
	n=n1;
	while(n-1)
	{
		if(s[n].st_size==s[n-1].st_size)
		{
			if(s[n].st_gid==s[n-1].st_gid)
			{
				if(s[n].st_mode==s[n-1].st_mode)
				{
					printf("\n***************************\n");
					printf("DUPLICATE\nDELETING FILE=%s\n",namelist[n]->d_name);
					fd=unlink(namelist[n]->d_name);
					printf("\nfd=%d\n\n",fd);
				}
				
			}
		}	
		n--;
	}


	exit(EXIT_FAILURE);
	return 0;
}
	
         		
    

