@isTest
public class EmployeeServiceTest {

    @isTest
    static void testCreateEmployee() {

        Employee__c employee = new Employee__c(
            Name = 'Test Employee',
            Salary__c = 50000,
            Department__c = 'IT',
            Emp_contact__c = '9876543210',
            Experience__c = 2
        );

        Test.startTest();

        EmployeeService.createEmployee(employee);

        Test.stopTest();

        System.assertNotEquals(
            null,
            employee.Id,
            'Employee should have been created successfully.'
        );
    }


    @isTest
    static void testInvalidSalary() {

        Employee__c employee = new Employee__c(
            Name = 'Invalid Employee',
            Salary__c = -1000,
            Department__c = 'IT',
            Emp_contact__c = '9876543210',
            Experience__c = 2
        );

        Test.startTest();

        try {
            EmployeeService.createEmployee(employee);

            System.assert(
                false,
                'EmployeeValidationException should have been thrown.'
            );

        } catch (EmployeeValidationException e) {

            System.assert(
                e.getMessage().contains('Salary'),
                'Expected salary validation error.'
            );
        }

        Test.stopTest();
    }


    @isTest
    static void testUpdateEmployee() {

        // Step 1: Create employee
        Employee__c employee = new Employee__c(
            Name = 'Update Employee',
            Salary__c = 50000,
            Department__c = 'IT',
            Emp_contact__c = '9876543210',
            Experience__c = 2
        );

        // Step 2: Insert employee
        EmployeeService.createEmployee(employee);

        // Step 3: Verify employee was created
        System.assertNotEquals(
            null,
            employee.Id,
            'Employee should have been created before update.'
        );

        // Step 4: Change salary
        employee.Salary__c = 55000;

        // Step 5: Test update operation
        Test.startTest();

        EmployeeService.updateEmployee(employee);

        Test.stopTest();

        // Step 6: Query updated record
        Employee__c result = [
            SELECT Id, Salary__c
            FROM Employee__c
            WHERE Id = :employee.Id
        ];

        // Step 7: Verify new salary
        System.assertEquals(
            55000,
            result.Salary__c,
            'Employee salary was not updated.'
        );
    }
    
    @isTest
static void testDeleteEmployee() {

    // Step 1: Create employee
    Employee__c employee = new Employee__c(
        Name = 'Delete Employee',
        Salary__c = 50000,
        Department__c = 'IT',
        Emp_contact__c = '9876543210',
        Experience__c = 2
    );

    // Step 2: Insert employee
    EmployeeService.createEmployee(employee);

    // Step 3: Verify employee was created
    System.assertNotEquals(
        null,
        employee.Id,
        'Employee should have been created before deletion.'
    );

    // Step 4: Test delete operation
    Test.startTest();

    EmployeeService.deleteEmployee(employee.Id);

    Test.stopTest();

    // Step 5: Query deleted record
    Employee__c result = [
        SELECT Id, IsDeleted
        FROM Employee__c
        WHERE Id = :employee.Id
        ALL ROWS
    ];

    // Step 6: Verify that record is deleted
    System.assertEquals(
        true,
        result.IsDeleted,
        'Employee should have been deleted.'
    );
}
}