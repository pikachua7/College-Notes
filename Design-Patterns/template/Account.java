
package template;

public abstract class Account {
    int accno;
    String acc_holder_name;
     void printWelcomeMessage(){
        //hi
    }
    abstract protected void getDetails();//primitive
    abstract protected boolean verifyDetails();
    abstract protected void sendSMS_OTP();
       protected void sendEmail_OTP(){}
    protected boolean matchSMS_OTP() {
        //if match
        return true;
        //else ....
    }
    protected boolean matchEmail_OTP() { return true; }
    abstract protected int generateUniqueAccNo();
    
    //template method
    final int createAccount(){//returns accno(a unique positive int) if account is created
                        //else returns a negative value
        
                        //factory method
                        printWelcomeMessage();
                        getDetails();
        if(verifyDetails()){
            sendSMS_OTP();
            sendEmail_OTP();
            if(matchSMS_OTP() && matchEmail_OTP()){
                accno = generateUniqueAccNo();
                return accno;
            }
        }
        return -99;
    }
}
