
package builder;

public class TeaMaker {
    public static void main(String[] args) {
      TeaBuilder tb = new TeaBuilder().addWater(50).addTealeaves(2).addMilk(100).addSugar(2);
      Tea t = tb.getTea();t.boil();t.strain();
      
      Tea t2 = new TeaBuilder().addWater(50).addTealeaves(2).addMilk(100).addSugar(2).getTea();
    }
}
class Tea{
    int milk;
    int tealeaves;
    int water; 
    int sugar;

    public Tea() {
    }

    public void setMilk(int milk) {
        this.milk = milk;
    }

    public void setTealeaves(int tealeaves) {
        this.tealeaves = tealeaves;
    }

    public void setWater(int water) {
        this.water = water;
    }

    public void setSugar(int sugar) {
        this.sugar = sugar;
    }

    public Tea(int milk, int tealeaves, int water, int sugar) {
        this.milk = milk;
        this.tealeaves = tealeaves;
        this.water = water;
        this.sugar = sugar;
    }

    
    
    public void boil(){}
    
    public void strain(){
        System.out.println("Tea is ready");
    }
}

class TeaBuilder{
    Tea tea;

    public TeaBuilder() {
    tea = new Tea();
    }
    
    public TeaBuilder addMilk(int milk){
        tea.setMilk(milk);
        return this;
    }
    
     public TeaBuilder addSugar(int milk){
        tea.setSugar(milk);
        return this;
    } 
     public TeaBuilder addWater(int milk){
        tea.setWater(milk);
        return this;
    }
     public TeaBuilder addTealeaves(int milk){
        tea.setTealeaves(milk);
        return this;
    }

    public Tea getTea() {
        return tea;
    }
     
     
}