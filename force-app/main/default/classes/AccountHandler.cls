public class AccountHandler{
    public static Account insertNewAccount(String accName){
    try{
        Account account=new Account(Name=accName);
        	insert account;
        	return account;
        
    }
        catch(DmlException e){
            System.debug('name should not be empty string');
            return null;
         }
      }
 }