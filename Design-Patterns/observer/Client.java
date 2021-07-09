
package observer;

import java.util.Scanner;

public class Client {
    public static void main(String[] args) {
        Employee e = new Employee("EN201", "anu", 85000);
        Employee e2 = new Employee("EN201", "anu", 85000);
        FileView v1 = new FileView("e1.txt");
        FileView v2 = new FileView("e2.txt");
        FileView v3 = new FileView("e3.txt");
        e.attach(v1);//b1.setOnClickListener(this);
        e.attach(v3);
        e2.attach(v3);
        
        e.setEid("er");
        e.setName("rtg");
        e.setSalary(0);
        e.notifyViews();
        
        int c = 0;
        Scanner sc = new Scanner(System.in);
        while(c!=4){
            System.out.println("enter choice 1. to set id   2. to set name   4. to exit");
            c = sc.nextInt();
            switch(c){
                case 1: e.setEid(sc.next());e.detach(v3);break;
                case 2: e.setName(sc.next());break;
            }
        }
    }
}
