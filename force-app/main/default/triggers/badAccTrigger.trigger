Trigger badAccTrigger on Account(after insert){ 
for(Account acc : Trigger.new) { 
 
    List<Contact> contacts = [ 
        SELECT Id, FirstName 
        FROM Contact 
        WHERE AccountId = :acc.Id 
    ]; 
 
} 
}