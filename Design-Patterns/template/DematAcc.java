
package template;

public class DematAcc extends Account{

    String dematAccMembers;
    
    @Override
    protected void getDetails() {
        //scan name and dematAccMembers from user
    }

    @Override
    protected boolean verifyDetails() {
        //verify corresponding details of demat acc
        return true;
    }

    @Override
    protected void sendSMS_OTP() {
         //generate and send a alpha-numeric 6 digit OTP
    }

    @Override
    protected void sendEmail_OTP() {
        //gen and send email 8 digit otp
    }

   

    @Override
    protected int generateUniqueAccNo() {
        //return next available demat acc number 
        return 1111;
    }
    
}
