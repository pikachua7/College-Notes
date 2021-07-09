import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintStream;
import java.net.ServerSocket;
import java.net.Socket;

public class ServerText 
{

    public static void main(String[] args) throws IOException, Exception {
        new Server().server();
    }
}

class Server
{ 
    public void server() throws Exception 
    { 
        
        // Create server Socket 
        ServerSocket ss = new ServerSocket(2546); 
        
        // connect it to client socket 
        Socket s = ss.accept(); 
        System.out.println("Connected to client Successfully"); 
  
        // to send data to the client 
        PrintStream ps  = new PrintStream(s.getOutputStream()); 
  
        // to read data coming from the client 
        InputStreamReader ir1 = new InputStreamReader( s.getInputStream());
        BufferedReader br1 = new BufferedReader( ir1); 
  
        // enter data for sending to client 
        InputStreamReader ir2 = new InputStreamReader(System.in);
        BufferedReader br2 = new BufferedReader( ir2); 
  
        // server executes continuously 
        while (true) { 
  
            String str1, str2;  
  
            // read from client 
            while ((str1 = br1.readLine()) != null) { 
                System.out.println("Client: " + str1); 
                System.out.print("Server: ");
                str2 = br2.readLine(); 
  
                // send to client 
                ps.println(str2); 
                
            } 
  
            // close all connection 
            ps.close(); 
            br1.close(); 
            br2.close(); 
            ss.close(); 
            s.close(); 
  
            // terminate application 
            System.exit(0); 
  
        } // end of while 
    } 
} 