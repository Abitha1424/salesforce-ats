public class QueueableDemo implements Queueable {

    String name;

    // Constructor to receive the input value
    public QueueableDemo(String name) {
        this.name = name;
    }

    // Executes asynchronously
    public void execute(QueueableContext context) {

        // Query records
        List<Account> accounts = [
            SELECT Id, Name, Description
            FROM Account
            LIMIT 5
        ];

        // Process records
        for (Account acc : accounts) {
            acc.Description = this.name;
        }

        // Update records
        update accounts;

        // Display result
        System.debug('Number of records processed: ' + accounts.size());
        System.debug('Queueable Job Id: ' + context.getJobId());
    }
}