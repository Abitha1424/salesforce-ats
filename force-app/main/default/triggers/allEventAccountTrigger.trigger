trigger allEventAccountTrigger on Account (
    before insert,
    before update,
    after insert,
    after delete
) {

    if (Trigger.isBefore && Trigger.isInsert) {

        for (Account acc : Trigger.new) {
            if (String.isBlank(acc.Industry)) {
                acc.Industry = 'Technology';
            }
        }

    } else if (Trigger.isBefore && Trigger.isUpdate) {

        for (Account acc : Trigger.new) {

            Account oldAcc = Trigger.oldMap.get(acc.Id);

            if (oldAcc.Name != acc.Name) {
                acc.Description = 'Account name was changed';
            }
        }

    } else if (Trigger.isAfter && Trigger.isInsert) {

        for (Account acc : Trigger.new) {
            System.debug('Account Id: ' + acc.Id);
            System.debug('Account Name: ' + acc.Name);
        }

    } else if (Trigger.isAfter && Trigger.isDelete) {

        for (Account acc : Trigger.old) {
            System.debug('Deleted Account Id: ' + acc.Id);
            System.debug('Deleted Account Name: ' + acc.Name);
        }
    }
}