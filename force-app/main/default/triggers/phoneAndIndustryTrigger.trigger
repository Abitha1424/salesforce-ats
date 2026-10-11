Trigger phoneAndIndustryTrigger on Account(before insert){

    for (Account acc : Trigger.new) {

        if (String.isBlank(acc.Phone)) {
            acc.Description = 'Phone number is not provided';
        }

        if (String.isBlank(acc.Industry)) {
            acc.Industry = 'Technology';
        }
    }
}