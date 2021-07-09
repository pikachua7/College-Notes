
package absFactory;

import java.util.Scanner;

class AbstractFactoryDemo{
    public static void main(String[] args) {
        
        System.out.println("Enter 1. Indian \t 2. Chinese");
        Scanner s = new Scanner(System.in);
        int ch = s.nextInt();
        MealFactory restaurent = null;
        if(ch==1){
            restaurent = new IndianMealFactory(); 
        }
        else if(ch==2){
            restaurent = new ChineseMealFactory();
        }
        else
            System.out.println("Wrong input");
        
        Meal m = new Meal(restaurent.createStarters(), restaurent.createMaincourse(), restaurent.createDessert());
        System.out.println(m);
    }
}

public abstract class MealFactory {
   abstract Starters createStarters();
   abstract Maincourse createMaincourse();
   abstract Dessert createDessert();

}
class Meal{
    Starters s; Maincourse m; Dessert d;
   
    public Meal(Starters s, Maincourse m, Dessert d) { 
        this.s = s;
        this.m = m;
        this.d = d;
        
    }

    @Override
    public String toString() {
        return "Starters "+ s+", Maincourse "+m+", Dessert " + d;
    }
    
    
}
class Starters{}
class Maincourse{}
class Dessert{}
class ABC extends Starters{
    @Override
    public String toString() {
        return "ABC Starter";
    }
}
class Tikka extends Starters{

    @Override
    public String toString() {
        return "Tikka";
    }
    
}

class Dumpling extends Starters{
     @Override
    public String toString() {
        return "Dumpling";
    }
}
class PalakPaneer extends Maincourse{
     @Override
    public String toString() {
        return "PalakPaneer";
    }
}
class FriedRice extends Maincourse{
     @Override
    public String toString() {
        return "FriedRice";
    }
}
class GulabJamun extends Dessert{
     @Override
    public String toString() {
        return "GulabJamun";
    }
}
class FriedIcecream extends Dessert{
     @Override
    public String toString() {
        return "FriedIcecream";
    }
}

class IndianMealFactory extends MealFactory{

    @Override
    Starters createStarters() {
        return new Tikka();
    }

    @Override
    Maincourse createMaincourse() {
        return new PalakPaneer();
    }

    @Override
    Dessert createDessert() {
        return new GulabJamun();
    }
    
   
}
class ChineseMealFactory extends MealFactory{
    @Override
    Starters createStarters() {
        return new Dumpling();
    }

    @Override
    Maincourse createMaincourse() {
        return new FriedRice();
    }

    @Override
    Dessert createDessert() {
        return new FriedIcecream();
    }
    
}