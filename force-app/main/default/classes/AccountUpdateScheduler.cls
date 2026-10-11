public class AccountUpdateScheduler implements Schedulable {

    public void execute(SchedulableContext context) {
        
        // 1. Fetch records created today (cannot filter Description in SOQL)
        List<Account> freshAccounts = [
            SELECT Id, Description 
            FROM Account 
            WHERE CreatedDate = TODAY 
            LIMIT 200
        ];
        
        List<Id> accountIds = new List<Id>();
        
        // 2. Filter for null Description in Apex
        for (Account acc : freshAccounts) {
            if (String.isBlank(acc.Description)) {
                accountIds.add(acc.Id);
            }
        }
        
        // 3. Call the @future method if records exist
        if (!accountIds.isEmpty()) {
            AccountProcessor.updateAccountDescriptions(accountIds);
        }
    }
}