public class EmployeeManagementSystem {
	Integer empId;
    String empName;
    String empDepartment;
    Integer salary;
    Integer experience ;
    Boolean isActive;
    
    public EmployeeManagementSystem(Integer empId,String empName,String empDepartment,Integer salary,Integer experience ,Boolean isActive){
        this.empId=empId;
        this.empName=empName;
        this.empDepartment=empDepartment;
        this.salary=salary;
        this.experience=experience;
        this.isActive=isActive;
    }
    
    
    List<EmployeeManagementSystem> names=new List<EmployeeManagementSystem>();
    
    public void empDetails(){
        names.add(new EmployeeManagementSystem(001,'abitha','developer',25000,1,True));
    }
    
    
    
    
}