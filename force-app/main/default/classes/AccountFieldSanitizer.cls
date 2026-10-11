public class AccountFieldSanitizer {

    public static List<Account> getAccounts() {
        List<Account> accounts = [select Id,Name,AnnualRevenue from Account WITH USER_MODE];
        SObjectAccessDecision decision =Security.stripInAccessible(AccessType.READABLE,accounts);
        return decision.getRecords();
    }
}