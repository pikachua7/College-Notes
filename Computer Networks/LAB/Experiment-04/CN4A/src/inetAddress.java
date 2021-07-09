import java.io.IOException;
import java.net.InetAddress; 
/*The java.net.InetAddress class provides 
methods to get the IP of any host name for example www.javatpoint.com, 
www.google.com, www.facebook.com, etc.*/
public class inetAddress 
{
    public static void main(String[] args) throws IOException, InterruptedException, Exception 
    {
        
        InetAddress ip1 = InetAddress.getByName("www.amazon.com"); //remote website 
        
        System.out.println("Host Name: "+ ip1.getHostName());  
        System.out.println("IP Address: "+ ip1.getHostAddress()); 
        
        InetAddress ip2 = InetAddress.getByName("localhost"); //local pc
        System.out.println("Host Name: "+ ip2.getHostName());  
        System.out.println("IP Address: "+ ip2.getHostAddress());    
    }
}
