package cn_assg;
import java.io.*;
import java.net.*;
import java.util.*;

public class cn_assg2{
    public static void main(String[] args) {
        try {
            ServerSocket ss1 = new ServerSocket(9999);
            System.out.println("Server is waiting...");
            Socket s1 = ss1.accept();
            System.out.println("---------------------------------------------");
            System.out.println("Connection established !!");
            System.out.println("----Welcome Client1----");
            System.out.println("---------------------------------------------");

            ServerSocket ss2 = new ServerSocket(9002);
            System.out.println("Server is waiting...");
            Socket s = ss2.accept();
            System.out.println("---------------------------------------------");
            System.out.println("Connection established !!");
            System.out.println("----Welcome Client2----");
            System.out.println("---------------------------------------------");

            ServerSocket ss3 = new ServerSocket(9998);
            System.out.println("Server is waiting...");
            Socket s3 = ss3.accept();
            System.out.println("---------------------------------------------");
            System.out.println("Connection established !!");
            System.out.println("----Welcome Client3----");
            System.out.println("---------------------------------------------");

            BufferedReader br = new BufferedReader(new InputStreamReader(s1.getInputStream()));
            String str = br.readLine();
            System.out.println("---------------------------------------------");
            System.out.println("Message from Client1 : "+"-->"+str);
            System.out.println("---------------------------------------------");
            int id = Integer.parseInt(str.substring(15));
            
            BufferedReader br2 = new BufferedReader(new InputStreamReader(s.getInputStream()));
            String str2 = br2.readLine();
            System.out.println("---------------------------------------------");
            System.out.println("Message from Client2 : "+"-->"+str2);
            System.out.println("---------------------------------------------");
            int id2 = Integer.parseInt(str2.substring(15));

            BufferedReader br3 = new BufferedReader(new InputStreamReader(s3.getInputStream()));
            String str3 = br3.readLine();
            System.out.println("---------------------------------------------");
            System.out.println("Message from Client3 : "+"-->"+str3);
            System.out.println("---------------------------------------------");
            int id3 = Integer.parseInt(str3.substring(15));
            int max  = Math.max(id, id2);
            int maxid = Math.max(max, id3);

           StringBuffer sBuffer = new StringBuffer();
           System.out.println("---------------------------------------------");
           sBuffer.append("Data Of Client1 : "+"-->"+str);
           sBuffer.append("Data Of Client2 : "+"-->"+str2);
           System.out.println("---------------------------------------------");
           
            System.out.println("*********************************************");
            String notice = "Client having ID " +maxid +" is a leader";
            System.out.println("*********************************************");
            OutputStreamWriter ow2 = new OutputStreamWriter(s.getOutputStream());
            PrintWriter out2  = new PrintWriter(ow2);
            out2.println(notice);
            out2.flush();
            out2.close();
            OutputStreamWriter ow = new OutputStreamWriter(s1.getOutputStream());
            PrintWriter out  = new PrintWriter(ow);
            out.println(notice);
            out.flush();
            out.close();
            System.out.println("*********************************************");
            String msg = "You are a leader!! Go and Lead Your Team " + sBuffer;
            System.out.println("*********************************************");
            OutputStreamWriter ow3 = new OutputStreamWriter(s3.getOutputStream());
            PrintWriter out3  = new PrintWriter(ow3);
            out3.println(msg);
            out3.flush();
            out3.close();
            ss1.close();
            ss2.close();
            ss3.close();
            
        } 
        catch (Exception e) {
            System.out.println(e);
        }
    }
}