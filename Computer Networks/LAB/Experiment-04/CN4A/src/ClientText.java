import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.Socket;

public class ClientText 
{

    public static void main(String[] args) throws IOException, Exception 
    {
        new Client().client();
    }
}

class Client
{ 
   
    public void client() throws Exception 
    { 
  
        // Create client socket 
        Socket s = new Socket("localhost", 2546); 
        System.out.println("Connecting to Server");
        // to send data to the server 
        DataOutputStream dos = new DataOutputStream(s.getOutputStream()); 
  
        // to read data coming from the server 
        InputStreamReader ir1 = new InputStreamReader(s.getInputStream());
        BufferedReader br1 = new BufferedReader(ir1); 
  
        // write data that to be send or "exit" to end connection
        InputStreamReader ir2 = new InputStreamReader(System.in);
        BufferedReader br2 = new BufferedReader(ir2); 
        String str1, str2; 
        
        System.out.print("Client: ");
        // repeat as long as exit 
        // is not typed at client 
        while (!(str1 = br2.readLine()).equals("exit")) { 
  
            // write data that to be send or "exit" to end connection 
            dos.writeBytes(str1 + "\n"); 
  
            // receive from the server   
            str2 = br1.readLine(); 
  
            System.out.println("Server: "+str2); 
            System.out.print("Client: ");
        } 
  
        // close all connection. 
        dos.close(); 
        br1.close(); 
        br2.close(); 
        s.close(); 
    } 
} 