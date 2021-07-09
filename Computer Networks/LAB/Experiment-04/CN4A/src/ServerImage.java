import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;
import java.nio.file.Files;
public class ServerImage 
{
    public static void main(String[] args) throws IOException, Exception 
    {
        new Server1().server();
    }
}

class Server1
{
    public void server() throws Exception 
    { 
        
        // Create server Socket 
        ServerSocket sc = new ServerSocket(2546);
        
        // connect it to client socket 
        Socket s = sc.accept();
        System.out.println("Connected to client Successfully");
        
        // save image in file
        File f = new File("C:\\Users\\user\\Pictures\\Screenshots\\out2a.jpg");
        
        // convert image into byte array
        byte[] b = Files.readAllBytes(f.toPath());
        
        //send image to client
        OutputStream os = s.getOutputStream();
        os.write(b,0,b.length);
        
        System.out.println("Sending image...\nCompleted");
        
        // closing all connections 
        s.close();
    }
}
