public class AccountOperations{ 
   public static void  createAccount(Account account){ 
      if(Schema.sObjectType.Account.isCreateable()){ 
           insert account; 
		}else{ 
 			throw new SecurityException ('User dont have access for the records');
		} 
	} 

	public  static List<Account> readAccount(){
		if(Schema.sObjectType.Account.isAccessible()){
     		return [select id,name from Account];
		} else{
			throw new SecurityException  ('User dont have access to read the account');
		}
	}
	public  static void updateAccount(Account account){
		if(Schema.sObjectType.Account.isUpdateable()){
   			 update account;
		} else{
			throw new SecurityException ('User dont have access to update the account');
		}
	}
	public  static void deleteAccount(Account account){
		if(Schema.sObjectType.Account.isDeletable()){
    		delete account;
		} else{
			throw new SecurityException ('User dont have access to delete the account');
		}
	}

}