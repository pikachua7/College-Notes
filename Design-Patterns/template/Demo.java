
package template;

public class Demo {
    public static void main(String[] args) {
        Account a = new DematAcc();
        int alloted_no = a.createAccount();
        if(alloted_no<0)
            System.out.println("Account Creation Unsuccesful");
        else
            System.out.println("You have been allotted Acc no. "+alloted_no);
    }
}
