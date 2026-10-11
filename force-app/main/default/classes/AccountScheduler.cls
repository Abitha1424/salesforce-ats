public class AccountScheduler implements Schedulable {

    public void execute(SchedulableContext sc) {
        System.debug('Scheduled Apex executed successfully');
    }
}