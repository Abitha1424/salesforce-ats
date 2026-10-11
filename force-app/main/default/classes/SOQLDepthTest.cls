public with sharing class SOQLDepthTest {
    
    /**
     * Executes queries demonstrating valid (5 levels) and invalid (6 levels) SOQL parent-child depth.
     */
    public static void testChildToParentDepth() {
        
        // 1. VALID QUERY: 5 total object levels / 4 relationship joins
        // Case (1) -> Contact (2) -> Account (3) -> Owner (4) -> Manager (5)
        try {
            List<Case> validCases = [
                SELECT Id, 
                       Subject, 
                       Contact.Account.Owner.Manager.FirstName 
                FROM Case 
                LIMIT 1
            ];
            System.debug('=== VALID QUERY EXECUTED SUCCESSFULLY ===');
            System.debug(JSON.serializePretty(validCases));
        } catch (Exception e) {
            System.debug('Unexpected Error on Valid Query: ' + e.getMessage());
        }

        // 2. INVALID QUERY: 6 total object levels / 5 relationship joins (TRIP SYSTEM LIMIT)
        // Case (1) -> Contact (2) -> Account (3) -> Owner (4) -> Manager (5) -> Manager (6)
        try {
            // Using dynamic query to guarantee runtime parser execution
            String invalidQuery = 'SELECT Id, Contact.Account.Owner.Manager.Manager.FirstName FROM Case LIMIT 1';
            List<SObject> invalidCases = Database.query(invalidQuery);
            
            System.debug('Query executed without error: ' + invalidCases);
        } catch (System.QueryException e) {
            System.debug('=== CAUGHT EXPECTED SOQL DEPTH LIMIT ERROR ===');
            System.debug('Error Message: ' + e.getMessage());
        }
    }
}