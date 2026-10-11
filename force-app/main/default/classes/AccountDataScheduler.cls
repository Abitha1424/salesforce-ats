public class AccountDataScheduler implements Schedulable {

    public void execute(SchedulableContext sc) {
        AccountDataBatch batchJob = new AccountDataBatch();
        Database.executeBatch(batchJob, 5);
    }
}