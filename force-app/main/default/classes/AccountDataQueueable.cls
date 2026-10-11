public class AccountDataQueueable implements Queueable {

    public void execute(QueueableContext context) {

        List<Account> accounts = [
            SELECT Id, Name, Description
            FROM Account
        ];

        for (Account acc : accounts) {
            acc.Description =
                'Processed by Account Data Batch - Queueable completed';
        }

        Database.SaveResult[] results =
            Database.update(accounts, false);

        for (Database.SaveResult result : results) {

            if (result.isSuccess()) {
                System.debug('Queueable processing successful');
            } else {
                for (Database.Error error : result.getErrors()) {
                    System.debug(
                        'Queueable processing failed: ' +
                        error.getMessage()
                    );
                }
            }
        }

        System.debug('Queueable additional processing completed.');
    }
}