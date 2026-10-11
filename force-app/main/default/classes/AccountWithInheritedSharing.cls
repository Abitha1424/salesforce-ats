public class AccountWithInheritedSharing {
    public static List<Account> getAccounts(){
        return AccountWithSharing.getAccounts();
    }
}