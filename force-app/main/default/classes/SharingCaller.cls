public with sharing class SharingCaller {
    public static List<Account> getAccounts(){
        return AccountWithInheritedSharing.getAccounts();
    }
}