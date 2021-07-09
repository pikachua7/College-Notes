package cn_assg;
import java.util.*;
/**
 *
 * @author Atharva Paliwal
 */
public class cn_assg_3c {
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
        Packetsss p ;
        System.out.println(); 
        System.out.println("-------------------------------------------------");
        System.out.println("Enter source: ");
        int source=sc.nextInt();
        System.out.println("-------------------------------------------------");
        System.out.println("Enter destination: ");
        int dest=sc.nextInt();
        System.out.println("-------------------------------------------------");
        p = new Packetsss(n,packetd);
        System.out.println("Enter the number of nodes in a routing path");
        int nn=sc.nextInt();
        System.out.println("-------------------------------------------------");
        System.out.println("Enter the nodes of a routing path");
        int num;
        ArrayList<Integer> path = new ArrayList<>();
        for(int i=0;i<nn;i++){
            num= sc.nextInt();
            path.add(num);
        }
        System.out.println("-------------------------------------------------");
        klines(edges,p,source,dest,n,source,path);

    }
    static void klines(int[][] network , Packetsss pack, int i, int dest, int n,int prev, ArrayList<Integer>r){
        Packetsss[] p = new Packetsss[n*n];
        int cnt=0;
        System.out.println("Packet received at station"+"--->"+ i);
        if(i==dest){
            System.out.println("**********************************************");
            System.out.println("Data After Reaching Destination is: "+"--->"+pack.d); 
            System.out.println("**********************************************");
        }
        pack.h-=1;
        if(pack.h==0 && i!=dest){
            System.out.println("Packet Discarded"+" "+"At station"+"--->"+i);
        }
        for(int j=0;j<n;j++){ 
            p[cnt] = new Packetsss(pack.h, pack.d);
            if(pack.h !=0 && j!=i && j!=prev &&r.contains(j) && network[i][j]==1 ){
                klines(network, p[cnt], j ,dest, n ,i,r);
            }
            cnt++;
        }
    }
}


class Packetsss{
    int h;
    String d;
    Packetsss(int h, String d){
       this.h=h;
       this.d=d;
    }
} 