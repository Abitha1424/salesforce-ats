public class EmployeeService {
    public static void createEmployee(Employee__c employee) {
        try{
            if(employee==null){
              throw new EmployeeValidationException('Employee cannot be null');
            }
            if(employee.salary__c==null || employee.salary__c<0){
                throw new EmployeeValidationException('Salary cannot be negative or null');
            }
            if(employee.Department__c==null){
                throw new EmployeeValidationException('Department should not be blank');
            }
            
              insert employee;
        }
        catch(EmployeeValidationException e){
            System.debug('validation error :'+e.getMessage());
            throw e;
            
        }
        catch (DMLException e){
            System.debug('DML error:'+e.getMessage());
        }
    }
    
    public static void updateEmployee(Employee__c employee){
        try{
            if(employee==null){
              throw new EmployeeValidationException('Employee cannot be null');
            }
             if(employee.id==null){
                throw new EmployeeValidationException('required employee Id to update records ');
            }
            if(employee.salary__c==null || employee.salary__c<0){
                throw new EmployeeValidationException('Salary cannot be negative or null');
            }
            if(employee.Department__c==null){
                throw new EmployeeValidationException('Department should not be blank');
            }
            update employee;
        }
        catch(EmployeeValidationException e){
            System.debug('validation error :'+e.getMessage());
            
        }
        catch (DMLException e){
            System.debug('DML error:'+e.getMessage());
        }
    }
    public static void deleteEmployee(Id employeeId){
        try{
            if(employeeId==null){
                throw new EmployeeValidationException('required employee Id to update records ');
            }
            Employee__c employee = [SELECT Id FROM Employee__c WHERE Id = :employeeId];
            delete employee;
        }
        catch(EmployeeValidationException e){
            System.debug('validation error :'+e.getMessage());
            
        }
        catch (DMLException e){
            System.debug('DML error:'+e.getMessage());
        }
    }
    
    public static void createMultipleEmployee(List<Employee__c>employees){
        if (employees == null || employees.isEmpty()) {
            System.debug('No employees provided.');
            return;
        }

        for (Employee__c employee : employees) {

            if (employee == null) {
                System.debug('Employee is null.');
                continue;
            }

            if (employee.Salary__c == null || employee.Salary__c < 0) {
                System.debug(
                    'Invalid salary for employee: ' + employee.Name
                );
            }

            if (employee.Department__c==null) {
                System.debug(
                    'Department missing for employee: ' + employee.Name
                );
            }
        }
   List<Database.SaveResult> results = Database.insert(employees, false);

    for (Integer i = 0; i < results.size(); i++) {

    Database.SaveResult result = results[i];

    if (result.isSuccess()) {
        System.debug(
            'Employee inserted successfully: ' + result.getId()
        );
    }
        else {
         for (Database.Error error : result.getErrors()) {

            System.debug('Employee failed: ' +employees[i].Name +' | Error: ' +error.getMessage());
            }
         }
        }
    }
}