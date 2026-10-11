trigger PhoneNumTrigger on Account (before update) {

    for (Account acc : Trigger.new) {

        if (String.isBlank(acc.Phone)) {
            acc.addError('Phone number cannot be blank.');
        }
    }
}