public class AccountProcessor {

    /**
     * Future method to update account descriptions asynchronously.
     * The (callout=true) parameter allows external API calls if needed.
     */
    @future(callout=true)
    public static void updateAccountDescriptions(List<Id> accountIds) {
        
        // 1. Always check if the list is empty to save processing resources
        if (accountIds == null || accountIds.isEmpty()) {
            return;
        }

        // 2. Fetch the records that need processing
        List<Account> accountsToUpdate = [SELECT Id, Description FROM Account WHERE Id IN :accountIds];
        
        // 3. Process the records
        for (Account acc : accountsToUpdate) {
            acc.Description = 'Processed asynchronously via @future method at ' + System.now();
            
            // Optional: You could make an HTTP callout here because callout=true is set
            // Http h = new Http();
            // HttpRequest req = new HttpRequest(); ...
        }

        // 4. Perform the DML operation
        if (!accountsToUpdate.isEmpty()) {
            update accountsToUpdate;
        }
    }
}