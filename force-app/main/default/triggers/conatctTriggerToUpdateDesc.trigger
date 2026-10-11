trigger conatctTriggerToUpdateDesc on Contact (before insert) {
    for(Contact con:Trigger.new){
        if(con.description==null){
            con.description='contact created successfully';
         }
    }

}