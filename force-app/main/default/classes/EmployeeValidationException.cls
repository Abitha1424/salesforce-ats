public class EmployeeValidationException extends Exception {

    public static void validateSalary(Decimal salary) {
        if (salary == null || salary < 0) {
            throw new EmployeeValidationException(
                'Salary cannot be negative or blank.'
            );
        }

        System.debug('Salary is valid.');
    }
}