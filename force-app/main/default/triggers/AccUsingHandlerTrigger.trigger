Trigger AccUsingHandlerTrigger on Account (before insert,before update) {
    
    if(Trigger.isBefore){
        if(Trigger.isInsert){
            AccountHandler.handleBeforeInsert(Trigger.new);
        }
        if(Trigger.isUpdate){
            AccountHandler.handleBeforeUpdate(Trigger.new,Trigger.oldMap);
        }
    }
}