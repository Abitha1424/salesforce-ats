trigger industryTrigger on Account (before update) {

    for (Account acc : Trigger.new) {

        Account oldAcc = Trigger.oldMap.get(acc.Id);

        if (oldAcc.Industry != acc.Industry) {
            System.debug('Old Industry: ' + oldAcc.Industry);
            System.debug('New Industry: ' + acc.Industry);
        }
    }
}