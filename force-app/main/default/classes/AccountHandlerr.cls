public class AccountHandlerr {

    public static void handleBeforeInsert(List<Account> accounts){
        
        for(Account acc:accounts){
            System.debug('Account Name: ' + acc.Name);
            System.debug('Industry Before: ' + acc.Industry);
            System.debug('Description Before: ' + acc.Description);
            System.debug('Phone Before: ' + acc.Phone);
            if(String.isBlank(acc.Industry)){
                acc.Industry='Technology';
            }
            if (String.isBlank(acc.Description)){
                acc.Description='New Account';
            }
            if (String.isBlank(acc.Phone)){
                acc.Phone='Not Provided';
            }
            System.debug('Industry After: ' + acc.Industry);
            System.debug('Description After: ' + acc.Description);
            System.debug('Phone After: ' + acc.Phone);
        }
    }
    
    public static void handleBeforeUpdate(List<Account> accounts,Map<Id,Account> mapAccId){
        for(Account acc:accounts){
            Account oldAcc=mapAccId.get(acc.Id);
            if(oldAcc.Name !=acc.Name){
                acc.Description='Account name changed from '+ oldAcc.Name +' to '+acc.Name;
                
            }
        }
    }
}