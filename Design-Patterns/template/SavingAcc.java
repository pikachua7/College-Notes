
package template;

public class SavingAcc extends Account{

    int savingAccMembers;
    
   

    @Override
    protected void getDetails() {
         //scan name and savingAccMembers from user
    }

    @Override
    protected boolean verifyDetails() {
        //verify corresponding details of saving acc
        return true;
    }

    @Override
    protected void sendSMS_OTP() {
        //generate send a numeric 4 digit OTP
        
    }

   

    @Override
    protected int generateUniqueAccNo() {
        //return next available saving acc number 
        return 5555;
    }
    
}
