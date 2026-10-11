public class FirstQueueable implements Queueable {
    public void execute(QueueableContext context){
        System.debug('First queueable job is executing');
        System.enqueueJob(new SecondQueueable());
    }
}