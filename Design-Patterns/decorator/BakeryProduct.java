
package decorator;

public interface BakeryProduct {
    public void bake();
    public int getCost();
}
class ChocoCake implements BakeryProduct{

    int wt;

    public ChocoCake() {
        this(1);
    }

    public ChocoCake(int wt) {
        this.wt = wt;
    }
    
    @Override
    public void bake() {
        System.out.println("Baking a chocolate cake");
            //some operations
    }

    @Override
    public int getCost() {
        return wt*300;
    }
    
}
class VanillaCake implements BakeryProduct{
    int wt;

    public VanillaCake() {
        this(1);
    }

    public VanillaCake(int wt) {
        this.wt = wt;
    }
    
    @Override
    public void bake() {
    System.out.println("Baking a Vanilla cake");
            //some operations
    }

    @Override
    public int getCost() {
        return wt*250;
    }
    
}
abstract class CakeDeco implements BakeryProduct{
    BakeryProduct component;

    public CakeDeco(BakeryProduct component) {
        this.component = component;
    }

}

class Nuts extends CakeDeco{

    public Nuts(BakeryProduct component) {
        super(component);
    }
    
    @Override
    public void bake() {
        
        component.bake();
        System.out.println("Adding nuts to cake");
    }

    @Override
    public int getCost() {
        return component.getCost()+100;
    }
}
class Icing extends CakeDeco{

    public Icing(BakeryProduct component) {
        super(component);
    }
    
    @Override
    public void bake() {
        
        component.bake();
        System.out.println("Icing the cake");
    }

    @Override
    public int getCost() {
        return component.getCost()+70;
    }
}