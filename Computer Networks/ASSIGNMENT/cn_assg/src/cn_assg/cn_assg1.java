package cn_assg;

import java.util.Arrays;
import java.util.Scanner;
import java.io.*;
import java.nio.channels.Pipe;
import java.nio.*;
class Compute{
    int[] send(int[] c1,int[] c2,int[] c3,int[] c4,int d1,int d2,int d3,int d4,int clen){
        int[] c1d1 = new int[clen];
        int[] c2d2 = new int[clen];
        int[] c3d3 = new int[clen];
        int[] c4d4 = new int[clen];
        int[] joinp = new int[clen];
        //calculating joiner process
        for(int i = 0;i<clen;i++){
            c1d1[i] = d1*c1[i];  
            c2d2[i] = d2*c2[i];  
            c3d3[i] = d3*c3[i];  
            c4d4[i] = d4*c4[i];
            joinp[i] = c1d1[i]+c2d2[i]+c3d3[i]+c4d4[i];   
        }
        return joinp;
    }
    int receive(int[] joiner,int[] c,int clen){
        int[] rec_j = new int[clen];
        int sum = 0;
        //calculating data bits using the joiner process for station which is passed in the method call
        for(int i = 0;i<clen;i++){
            rec_j[i] = c[i]*joiner[i];
            sum += rec_j[i];
        }
        int databit = sum/clen;
        return databit;
    }
}
public class cn_assg1
{
    public static void main(String args[]) throws IOException{
        final PipedOutputStream output = new PipedOutputStream();
        final PipedInputStream  input  = new PipedInputStream(output);
        Scanner sc = new Scanner(System.in);
        int[] c1 = new int[8];
        int[] c2 = new int[8];
        int[] c3 = new int[8];
        int[] c4 = new int[8];
        System.out.println("-------------------------------------------------");
        System.out.println("Enter the length of chip sequence");
        int clen = sc.nextInt();
        System.out.println("-------------------------------------------------");
        System.out.println("Enter the chip sequence for station 1");
        for(int i =0;i<clen;i++){
            c1[i]=sc.nextInt();
        }
        System.out.println("-------------------------------------------------");
        System.out.println("Enter the chip sequence for station 2");
        for(int i =0;i<clen;i++){
            c2[i]=sc.nextInt();
        }
        System.out.println("-------------------------------------------------");
        System.out.println("Enter the chip sequence for station 3");
        for(int i =0;i<clen;i++){
            c3[i]=sc.nextInt();
        }
        System.out.println("-------------------------------------------------");
        System.out.println("Enter the chip sequence for station 4");
        for(int i =0;i<clen;i++){
            c4[i]=sc.nextInt();
        }
        System.out.println("-------------------------------------------------");
        System.out.println("Enter the values for data signal as follows: \n-1 for Bit 0\n +1 for Bit 1\n 0 for Silent");
        System.out.println("Enter the data signal for station 1");
        int d1 = sc.nextInt();
        System.out.println("-------------------------------------------------");
        System.out.println("Enter the data signal for station 2");
        int d2 = sc.nextInt();
        System.out.println("-------------------------------------------------");
        System.out.println("Enter the data signal for station 3");
        int d3 = sc.nextInt();
        System.out.println("-------------------------------------------------");
        System.out.println("Enter the data signal for station 4");
        int d4 = sc.nextInt();
        System.out.println("-------------------------------------------------");
        Compute c = new Compute();
        //The Pipe is created  
        Pipe pipe = Pipe.open();  
         //For accessing the pipe sink channel   
        Pipe.SinkChannel skChannel = pipe.sink();  
        //Now we have the joiner process of all the stations
        int[] joinerp = c.send(c1, c2, c3, c4, d1, d2, d3, d4,clen);
        String joiner_process = Arrays.toString(joinerp);
        ByteBuffer bb = ByteBuffer.allocate(512);  
        bb.clear();  
        bb.put(joiner_process.getBytes());  
        bb.flip();  
        //sending the joiner process for decoding
        while(bb.hasRemaining()) {  
            skChannel.write(bb);  
        }  
        //For accessing the pipe source channel  
        Pipe.SourceChannel sourceChannel = pipe.source();  
        bb = ByteBuffer.allocate(512);  
        String received = "";
        //Accessing the joiner process    
        while(sourceChannel.read(bb) > 0){  
            bb.flip();  
              
            while(bb.hasRemaining()){  
                char TestData = (char) bb.get();  
                received += TestData;
            }  
            // System.out.println("received joiner process --> "+received);
            String[] strings = received.replace("[", "").replace("]", "").split(", ");
                int result[] = new int[strings.length];
                for (int i = 0; i < result.length; i++) {
                result[i] = Integer.parseInt(strings[i]);
                }
                //calculating the data bits for all stations
                int data_bit1 = c.receive(result, c1, clen);
                int data_bit2 = c.receive(result, c2, clen);
                int data_bit3 = c.receive(result, c3, clen);
                int data_bit4 = c.receive(result, c4, clen);
                System.out.println("-------------------------------------------------");
                System.out.println("-1 is representing Bit 0\n +1 is representing Bit 1\n 0 is representing Silent");
                System.out.println("-------------------------------------------------");
                System.out.println("\ndata bit received from station 1 - > "+data_bit1);
                System.out.println("data bit received from station 2 - > "+data_bit2);
                System.out.println("data bit received from station 3 - > "+data_bit3);
                System.out.println("data bit received from station 4 - > "+data_bit4);
                System.out.println("-------------------------------------------------");
            bb.clear();  
        }  
    }
}