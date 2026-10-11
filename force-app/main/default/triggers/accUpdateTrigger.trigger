Trigger accUpdateTrigger on Account(before update){
    for (Account acc : Trigger.new) {

        Account oldAcc = Trigger.oldMap.get(acc.Id);

        if (oldAcc.Name != acc.Name) {
            acc.Description = 'Account name was changed';
        }
    }
}