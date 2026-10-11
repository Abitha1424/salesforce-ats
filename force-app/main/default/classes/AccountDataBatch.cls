public class AccountDataBatch implements Database.Batchable<SObject> {

    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            'SELECT Id, Name, Description FROM Account'
        );
    }

    public void execute(Database.BatchableContext bc, List<SObject> scope) {

        List<Account> accounts = new List<Account>();

        for (SObject record : scope) {
            accounts.add((Account) record);
        }

        for (Account acc : accounts) {
            acc.Description = 'Processed by Account Data Batch';
        }

        Database.SaveResult[] results =
            Database.update(accounts, false);

        for (Database.SaveResult result : results) {

            if (result.isSuccess()) {
                System.debug('Account processed successfully');
            } else {
                for (Database.Error error : result.getErrors()) {
                    System.debug(
                        'Account processing failed: ' +
                        error.getMessage()
                    );
                }
            }
        }
    }

    public void finish(Database.BatchableContext bc) {

        System.debug('Batch processing completed.');

        System.enqueueJob(new AccountDataQueueable());
    }
}