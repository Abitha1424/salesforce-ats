public class FutureDemo {
    @future
    public static void processAccount(Set<Id> accId){
        List<Account> accountId=[select id ,name from Account where Id in :accId ];
        for(Account acc:accountId){
            acc.Description='updated scuuessfully';
        }
        update accountId;
        
        System.debug('number of records processed:'+accountId.size());
    } 
}