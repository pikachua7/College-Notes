
package dp_assg;

import java.math.BigDecimal;
public class MainObserver {
    public static void main(String args[]){
        Subject product=new Product("MS DHONI",new BigDecimal(350));
        Observer bidder1=new Bidder("Mukesh Ambani");
        Observer bidder2=new Bidder("Sharukh Khan");
        Observer bidder3=new Bidder("Priety Zinta");
        product.registerObserver(bidder1);
        product.registerObserver(bidder2);
        product.registerObserver(bidder3);
        product.setBidAmount(bidder1, new BigDecimal(375));
        product.removeObserver(bidder2);
        product.setBidAmount(bidder3, new BigDecimal(400));
    }
}   