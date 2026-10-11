public class SecondQueueable implements Queueable {
    public void execute(QueueableContext context){
        System.debug('Second queueable job is running');
        
    }

}