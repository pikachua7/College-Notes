import java.util.Scanner;

/**
 *
 * @author Atharva Paliwal
 */

public class cnlab7 {

    public static void main(String[] args) {
        //Variable declaration
        int inPktSize , leakedPktSize , bucketSize;
        int count = 0; //amount of data in the bucket
        
        //Variable initialization
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter input : ");
        int t = sc.nextInt();
        System.out.println("Enter bucket size : ");
        bucketSize = sc.nextInt();
        System.out.println("Enter incomming packet size : ");
        inPktSize =sc.nextInt();
        System.out.println("Enter leaking packet size : ");
        leakedPktSize = sc.nextInt();
        System.out.println("***************************************************************************************");
        while(t != 0)
        {
            System.out.println("Incomming packet with size : " + inPktSize);
            if(inPktSize <= (bucketSize - count))
            {
                // updating the store size
                count = count + inPktSize;
                System.out.println("Bucket buffer size : " + count);

            }
            else
            {
                System.out.println("Packet loss : " + (inPktSize - (bucketSize - count)));
                // Incomming packet size - Storage of bucket left
                count = bucketSize;
                System.out.println("Bucket buffer size : " + count);
              
            }
            //Leakage will cause decrease in store
            count = count - leakedPktSize;
            System.out.println("After outgoing(leakage) : "+ count + " packets left out of " + bucketSize + " in buffer(bucket)");
                System.out.println("********************************************************************************************");
            t--;
        }

    }
    
}
