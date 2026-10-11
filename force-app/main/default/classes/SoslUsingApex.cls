public class SoslUsingApex {
    public static void getRec(){
   	 	List<List<SObject>> result=[FIND 'abitha'
                                 RETURNING
                                 	Account(Name,phone,Id),
                                  	Contact(Name,Id),
                                  	Opportunity(Name,Id)];
   	   	System.debug(result);
    }
}