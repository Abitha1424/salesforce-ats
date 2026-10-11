public with sharing class AccountLwc {

    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts() {

        return [
            SELECT Id,
                   Name,
                   Industry,
                   Phone,
                   (SELECT Id, Name FROM Contacts)
            FROM Account
            ORDER BY Name
        ];
    }
}