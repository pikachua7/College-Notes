package cn_assg;

/**
 *
 * @author Atharva Paliwal
 */

import java.util.*;
/*program for all lines are flooded.*/

public class Cn_assg {
    public static void main(String[] args){
        Scanner sc=new Scanner(System.in);
        System.out.println("-------------------------------------------------");
        System.out.println("Enter data to be sent: ");
        String packetd = sc.nextLine();
        System.out.println("-------------------------------------------------");
        System.out.println("Enter hops: "); 
        int n=sc.nextInt();
        System.out.println("-------------------------------------------------");
        //adjacency matrix
        int edges[][] =new int[n][n]; 
        for(int i=0;i<n;i++){
            for(int j=0;j<n;j++){
                edges[i][j]=sc.nextInt();
            }
        }
        Packets packet ;
        System.out.println();
        System.out.println("-------------------------------------------------");
        System.out.println("Enter source: ");
        int source=sc.nextInt();
        System.out.println("---------------------------------------------------");
        System.out.println("Enter destination: ");
        int dest=sc.nextInt();
        System.out.println("-------------------------------------------------");
        packet = new Packets(n,packetd);
        flood(edges,packet,source,dest,n);
    }
    static void flood(int[][] edges ,Packets pack,int i,int dest,int n){
        Packets[] p = new Packets[n*n];
        int cnt=0;
        System.out.println("Packet received at station"+"--->"+ i);
        if(i==dest){
            System.out.println("*********************************************");
            System.out.println("Data After Reaching Destination is: "+"--->"+pack.d); 
            System.out.println("*********************************************");
        }
        pack.h-=1;
        if(pack.h==0 && i!=dest){
            System.out.println("Packet Discarded"+" "+"At station"+"--->"+i);
        }
        for(int j=0;j<n;j++){
            p[cnt] = new Packets(pack.h, pack.d);
            if(pack.h !=0 && edges[i][j]==1 && j!=i){
                flood(edges, p[cnt], j ,dest, n );
            }
            cnt++;
        }
    }
}


class Packets{
    int h;
    String d;
    Packets(int h, String d){
        this.h=h;
        this.d=d;
    }
} 

