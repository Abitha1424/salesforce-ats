public without sharing class AccountWithoutSharing {
    public static List<Account> getAccounts(){
        return [select id,name from Account];
    }
}