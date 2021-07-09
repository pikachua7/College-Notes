
package decorator;

public class Demo {
    public static void main(String[] args) {
//        BakeryProduct c = new ChocoCake(2);
//        c = new Nuts(c); 
//        c = new Icing(c);
//        c = new Nuts(c); 
        BakeryProduct c = new Nuts(new Icing(new VanillaCake(3)));
        c.bake();
        System.out.println("Total cost = "+c.getCost());
    }
}
