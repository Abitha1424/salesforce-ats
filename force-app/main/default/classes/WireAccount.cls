public class WireAccount {

	@AuraEnabled(cacheable=true)
	public static List<Account> getAccRecord() {
		List<Account> acc=[select Id,Name ,Industry,phone from Account limit 10];
		return acc;
		}

}