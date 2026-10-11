Trigger accountTrigger on Account(before update){
  for(Account acc:Trigger.new){
    Account oldAcc=Trigger.oldMap.get(acc.Id);
    if(oldAcc.Name != acc.Name){
        System.debug('Account name is changed');
    }else{
       System.debug(acc.Name);
      }
  }
 }