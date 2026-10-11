public class ExceptionDemo1 {
    public static void dmlExcep(){
	 try {
    	Account acc = new Account();
    	insert acc;
		}
	 catch (DmlException e) {
    	System.debug('DML Error: ' + e.getMessage());
    	System.debug('DML Message: ' + e.getDmlMessage(0));
    	System.debug('Exception Type: ' + e.getTypeName());
		}
	}	
}