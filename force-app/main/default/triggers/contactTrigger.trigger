trigger contactTrigger on Contact (before update) {
    for(Contact con:Trigger.new ){
        con.description='contact created successfully'+userInfo.getUserName();
      }
}