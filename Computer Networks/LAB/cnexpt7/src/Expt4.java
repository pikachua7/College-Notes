import java.util.ArrayList;
import java.util.Arrays;
import java.util.*;

/**
 *
 * @author ASUS
 */
public class Expt4{
    public static void main(String args[]){
        Scanner sc = new Scanner(System.in);
        int start=0;
        System.out.println("Enter the number of vertices: ");
        int v = sc.nextInt();
        System.out.println("Enter the distance matrix:");
        int[][] graph = new int[v][v];
        for(int i=0;i<v;i++)
            for(int j=0;j<v;j++){
                System.out.print("City "+(i+1)+" to City "+(j+1)+" = ");
                graph[i][j]=sc.nextInt();
            }
                
        for(int i=0; i < v;i++){
            long startTime = System.nanoTime();
            TSP t = new TSP(graph,v,start);
            start = i;
            t.cost(t,start);
            t.print(t);
            long endTime = System.nanoTime();
            long timeElapsed = (endTime - startTime);
            System.out.println("Time required : " +timeElapsed + " ns");
        }
    }
}

class TSP {
    
    int[][] graph;
    int startCity;
    int vertex = 0;
    int cost = 0;
    int[] visited;
    Integer path[] = new Integer[vertex+1];
    public TSP(int[][] graph, int vertex,int startCity){
        this.graph = graph;
        this.vertex = vertex;  
        this.startCity = startCity;
        
        visited = new int[vertex+1];
        for(int i=0 ; i<vertex;i++){
            visited[i]=0;
        }
    }
    
    public void cost(TSP t,int startCity){
        int nextCity = 99999999;
        visited[startCity] = 1;
        t.path = add(t.path,startCity+1);
        nextCity = t.nearestCity(startCity);
        if(nextCity == 99999999){
            nextCity =0;
            cost += graph[startCity][nextCity];
            return;
        }
        t.cost(t,nextCity);
    }
    
    int nearestCity(int city){
        int nextCity = 99999999;
        int  minCost = 999999999;
        int temp = 0;
        for(int i = 0; i < vertex;i++){
            if(graph[city][i]!=0 && visited[i]==0){
                if(graph[city][i]+graph[i][city] < minCost){
                    minCost = graph[i][0] + graph[city][i];
                    temp = graph[city][i];
                    nextCity = i;
                }
            }
        }
        if(minCost != 999999999){
            cost += temp;
        }
        return nextCity;
    }
    
    public Integer[] add(Integer arr[], int x){
        List<Integer> arrlist; 
        arrlist = new ArrayList<>( Arrays.asList(arr));
        arrlist.remove(null);
        arrlist.add(x); 
        arr = arrlist.toArray(arr); 
        return arr;
    } 
    
    public void print(TSP t){
        System.out.println("\nPath starting from City "+ t.path[0] +":");
        for(int i : t.path){
            System.out.print(i+" ---> ");
        }
        System.out.print(t.path[0]);
        
        System.out.println(" , Cost of travelling is " + t.cost);
    }

}
