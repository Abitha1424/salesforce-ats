public class AccountFieldSecurity {

    public static void checkAnnualRevenueAccess() {

        Schema.DescribeFieldResult result =
            Account.AnnualRevenue.getDescribe();

        if (result.isAccessible()) {
            System.debug('The user has access to read the AnnualRevenue field');
        }

        if (result.isCreateable()) {
            System.debug('The user has access to create the AnnualRevenue field');
        }

        if (result.isUpdateable()) {
            System.debug('The user has access to update the AnnualRevenue field');
        }
    }
}