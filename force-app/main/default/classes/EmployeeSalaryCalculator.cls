public class EmployeeSalaryCalculator {
	String employeeName;
	Integer salary;
	Integer hra;
	Integer allowance;
	Integer totalSalary;
 	
    public EmployeeSalaryCalculator(String employeeName, Integer salary, Integer hra, Integer allowance){
        this.employeeName =employeeName; 
        this.salary=salary; 
        this.hra=hra; 
        this.allowance=allowance; 
    }
    public void calculateSalary(){
        totalSalary=salary + hra + allowance;
    }
        public void checkSalaryGrade(){
        if (salary>=50000){
            System.debug('High');
        }
        else if(salary>=30000){
			System.debug('Medium');
        }
        else
        {
            System.debug('Low');        
        }
		System.debug('Employee Details :');
        System.debug('Salary : '+totalSalary);
    }
}