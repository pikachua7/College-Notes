import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.Socket;
public class ClientImage 
{
    public static void main(String[] args) throws IOException, Exception 
    {
        new Client1().client();
    }
}

class Client1
{
    
    public void client() throws IOException,Exception
    {
        System.out.println("Connecting to Server");
        Socket s = new Socket("localhost",2546);
        byte[] b = new byte[25000];
        InputStream is = s.getInputStream();
        FileOutputStream fo = new FileOutputStream("C:\\Users\\user\\Desktop\\output.jpg");
        is.read(b,0,b.length);
        fo.write(b,0,b.length);
        System.out.println("Received Successfully");
        
        // closing all connections
        s.close();
    }
    
}


        