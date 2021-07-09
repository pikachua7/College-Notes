/* Program for all lines except the input line are flooded */
package cn_assg;
import java.util.*;
/** 
 *
 * @author Atharva Paliwal
 */
public class Cn_assg_3b {
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
        Packetss p ;
        System.out.println();
        System.out.println("--------------------------------------------------");
        System.out.println("Enter source: ");
        int source=sc.nextInt();
        System.out.println("--------------------------------------------------");
        System.out.println("Enter destination: ");
        int dest=sc.nextInt();
        System.out.println("--------------------------------------------------");
        p = new Packetss(n,packetd);
        exceptinput(edges,p,source,dest,n,source);
    }
    static void exceptinput(int[][] network ,Packetss pack,int i,int dest,int n,int prev){
        Packetss[] p = new Packetss[n*n];
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
            p[cnt] = new Packetss(pack.h, pack.d);
            if(pack.h !=0 && j!=i && j!=prev && network[i][j]==1 ){
                exceptinput(network, p[cnt], j ,dest, n , i);
            }
            cnt++;
        }
    }
}
class Packetss{
    int h;
    String d;
    Packetss(int h, String d){
        this.h=h;
        this.d=d;
    } 
}