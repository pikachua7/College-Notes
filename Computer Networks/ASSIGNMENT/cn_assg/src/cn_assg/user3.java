package cn_assg;
import java.io.*;
import java.net.*;
import java.util.*;

public class user3 {
    public static void main(String args[]) throws IOException, Exception
    {
        String ip = "localhost";
        int port = 9998;
        int id = 3;
        Socket s = new Socket(ip,port);
        
        String str = "Hello Everyone "+ "My ID is "+id;
        
        OutputStreamWriter ow = new OutputStreamWriter(s.getOutputStream());
        PrintWriter out  = new PrintWriter(ow);
        out.println(str);
        out.flush();
        BufferedReader br = new BufferedReader(new InputStreamReader(s.getInputStream()));
        String msg = br.readLine();
        
        System.out.println("Data from server : "+msg);
        
        out.close();
        s.close();
        
    }
}
