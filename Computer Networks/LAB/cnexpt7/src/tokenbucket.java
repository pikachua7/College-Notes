/**
 *
 * @author Atharva Paliwal
 */

class Bucket{
	
    public int tokens, maxsize;

    Bucket(int max){
            tokens = 0;
            maxsize = max;
    }

    synchronized void addToken(int n) 
    // adding to the quantity of tokens that are generated after time t
    {
            if(tokens >= maxsize) return;
            tokens = tokens + 1;
            System.out.println("Added a token || Number of tokens in bucket : " + tokens);
    }

    synchronized void addPacket(int n){
            System.out.println(" >> Packet of size " + n + " arrived in bucket");
            if(n > tokens){ // n : number of packet
                System.out.println("Token not available || Can't transmit the packet");
            }
            else{
                    tokens = tokens - n; 
//while transmitting the packet the host capture and destroy one token
System.out.println("--------------------------------");                    
System.out.println("Transmitting packet || Number of tokens in bucket : " + tokens);
                    System.out.println("--------------------------------");
            }
    }
    
}

class generateToken extends Thread{
	Bucket b;
        int count = 0; //No. of tokens
	generateToken(Bucket b){
		this.b = b;
	}
        @Override
	public void run(){
            while(count != 5) 
//Here we have set limit to 5 to avoid infinite loop for demonstration
            {
                b.addToken(1);
                try
                {
                    Thread.sleep(1000);
                } catch(Exception e){}
                
                count ++;
            }
	}
}

class generatePacket extends Thread{
	Bucket b;
        int count = 0; //No of packets
	generatePacket(Bucket b){
		this.b = b;
	}

        @Override
	public void run(){
            while(count != 5) 
            //Here we have set limit to 5 to avoid infinite loop for demonstration
            {
                try
                {
                    Thread.sleep(500 + (int) (Math.random()*3000)); 
                //Setting the random time of arrival
                }
                catch(Exception e){}
                b.addPacket(1 + (int) (Math.random()*9)); 
                //Random generation of size of packet
                count++;
            }
	}
}

class TokenBucket{
	public static void main(String args[]){
		Bucket b = new Bucket(10);
		Thread tokens = new generateToken(b);
		Thread packets = new generatePacket(b);
		try{
                    tokens.start();
                    packets.start();
		}
		catch(Exception e){}
                
	}
}
