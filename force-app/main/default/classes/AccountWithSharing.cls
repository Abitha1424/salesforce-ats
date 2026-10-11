public with sharing class AccountWithSharing {
    public static List<Account> getAccounts(){
        return [select id,name from Account];
    }
}