public with sharing class SecureAccountService {
	public static List<Account> getAccounts() {
        if(!Schema.sObjectType.Account.isAccessible()){
            throw new SecurityException('user dont have access to object ');
        }else{
            return [select id,name,phone from Account with USER_MODE];
        }
	}
    public static void createAccount(Account account){
        if(Schema.sObjectType.Account.isCreateable()){
            List<Account>accounts=new List<Account>{account};
           sObjectAccessDecision decision =Security.stripInAccessible(AccessType.CREATABLE, accounts);
           List<Account>finalRec= decision.getRecords();
            insert finalRec;
        }else {
            throw new SecurityException ('user does not have the access ');
        }
    }
    public static void updateAccount(Account account){
        if(Schema.sObjectType.Account.isUpdateable()){
            List<Account>accounts=new List<Account>{account};
            sObjectAccessDecision decision =Security.stripInAccessible(AccessType.UPDATABLE, accounts);
          	List<Account>finalRec= decision.getRecords();
            update finalRec;
        }else{
            throw new SecurityException('user do not have access to update the field');
        }
    }
    
      public static void deleteAccount(Account account){
        if(Schema.sObjectType.Account.isDeletable()){
            List<Account>accounts=new List<Account>{account};
            delete accounts;
        }else{
            throw new SecurityException('user do not have access to delete the field');
        }
    }

}