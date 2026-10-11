public virtual class Employee {
	public Integer empId;
    public  String empName;
    public String empDepartment;
    private Integer salary;
    public Integer experience ;
    public Boolean isActive;
 
    
    public Employee(Integer empId,String empName,String empDepartment,Integer salary,Integer experience ,Boolean isActive){
        this.empId=empId;
        this.empName=empName;
        this.empDepartment=empDepartment;
        this.salary=salary;
        this.experience=experience;
        this.isActive=isActive;
        
    }
    
    public virtual String getEmployeeRole() {
   		 return 'Employee';
	}
    
    
    public void displayEmployeeInformation(){
        System.debug(this.empId);
        System.debug( this.empName); 
        System.debug(this.empDepartment );
        System.debug( this.experience);
        System.debug( this.isActive);
        System.debug(this.salary);
    }
    
    
    public Integer calculateEmployeeAnnualSalary(){
        Integer annualSalary=salary*12;
        System.debug(annualSalary);
        return annualSalary;
    }
    
    public void employeeLevel(){
        if(experience <2 ){
            System.debug('Junior');
        }else if (experience >=2 && experience <=5 ){
            System.debug('Mid-level');
        }else{
            System.debug('Senior');
        }
    }
    
    public Integer getSalary(){
        return salary;
    }
    
    public void setSalary(Integer salary){
        if(salary<0 || salary==0){
            System.debug('salary should be positive value');
        }else{
            this.salary=salary;
            System.debug(salary);
        }
    }
    
}