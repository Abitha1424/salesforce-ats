public class SoqlUsingApex {
    
   public static void getAcc(){
    List<Account> accounts=[select id,name from Account order by name DESC limit 10];

    for(Account acc:accounts){
        System.debug('Account Name : '+ acc.Name);
    }
   }
}