public class StudentManagementSystem  { 
 	
    Integer subCount=0; 
 
    List<String>student_name=new List<String>(); 
    public void  studentName(){
 
        student_name.add('abitha'); 
        student_name.add('iniya'); 
        student_name.add('inika'); 
        student_name.add('dharani'); 
        student_name.add('latha'); 
        student_name.add('anu'); 
        student_name.add('ruthra'); 
        student_name.add('naveen'); 
        student_name.add('darshika'); 
        student_name.add('niji'); 
        student_name.add('kaviya'); 
    }
 
    public void displayStudent(){
        for(String  name:student_name){ 
            System.debug('Student Name: '+name);
        }

    }


    public Boolean studentExists(String studentName){
        return student_name.contains(studentName);
    }

    public void removeStudent(String studentName){
    Integer index = student_name.indexOf(studentName);

    if(index != -1){
        student_name.remove(index);
    }
}

    public Integer countStudent(){
        Integer nameCount=0; 
        for(String count:student_name){
            nameCount++;
        }
        return nameCount;
    }

    Set<String> subject=new Set<String>();

    public void  addSubjectName(){ 
        subject.add('Apex'); 
        subject.add('Salesforce Admin'); 
        subject.add('LWC'); 
        subject.add('SOQL'); 
        subject.add('LWC'); 
        subject.add('SOQL'); 
        subject.add('Integration'); 
    }
    public void subjects(){
        for(String sub:subject){
            System.debug(sub);
        }
    }
    public Integer count(){
        for(String sub:subject){ 
            subCount++; 
        } 
        System.debug('total subject count'+subCount);
        return subCount; 
    } 
    public Boolean subjectMarkExists(String subjectName){
        return subject.contains(subjectName);
    }

    Map<String,Integer> marks=new Map<String,Integer>(); 
    public void studentMarks(){
            marks.put(student_name[0],85); 
            marks.put(student_name[1],98); 
            marks.put(student_name[2],75); 
            marks.put(student_name[3],46); 
            marks.put(student_name[4],35); 
            marks.put(student_name[5],64); 
            marks.put(student_name[6],58); 
            marks.put(student_name[7],54); 
            marks.put(student_name[8],76); 
            marks.put(student_name[9],64); 
            marks.put(student_name[10],94); 
    }

    public void updateMarks(){
            marks.put('abitha',95);
            marks.put('iniya',96);
            marks.put('inika',75);
    }
    public Integer getMarks(String studentName){
            Integer namee=marks.get(studentName);
            return namee;

    }
    public Boolean studentMarkExists(String studentName){
            return marks.containsKey(studentName);       
    }
    public void disMarks(){
        for(String displayMark:marks.keySet()){
            Integer sMark=marks.get(displayMark);
            System.debug('name : '+displayMark);
            System.debug('marks : ' +sMark);
        }
    }
    Integer total=0;
    public Integer totalMarks(){
        for(Integer sMark:marks.values()){
            total+=sMark;
        }
        System.debug('Total:'+total);
        return total;
    }

    Decimal avg;
    public Decimal avgMarks(){
        avg=total/student_name.size();
        System.debug('average'+avg);
        return avg;
    }

    Integer max=0;
    String highestStudent;
    public String highestScore(){
        for(String name : marks.keySet()) {
            Integer mark = marks.get(name);
            if(mark >max){
                max=mark;
                highestStudent=name;
            }
        }
        System.debug('highest student:'+highestStudent);
        return highestStudent;
    }

    Integer min=999;
    String lowestStudent;
    public String lowestScore(){
        for(String name : marks.keySet()) {
            Integer mark = marks.get(name);
            if(mark <min){
                min=mark;
                lowestStudent=name;
            }
        }
        System.debug('lowest score:'+lowestStudent);
        return lowestStudent;
    }

    public void countMarks(){
    Integer high=0;
    Integer medium=0;
    Integer pass=0;
    Integer low=0;
    
    for(String name : marks.keySet()) {
        Integer mark = marks.get(name);
        if(mark>=90){
            high++;
        }else if(mark>=75 && mark<=89){
            medium++;
        }else if(mark>=50 && mark<=74){
           pass++;
        }else{
            low++;
        }
    }
    System.debug('High: ' + high);
    System.debug('Medium: ' + medium);
    System.debug('Pass: ' + pass);
    System.debug('Low: ' + low);
    }

    public String getGrade(Integer marks){
    
    if(marks>=90 && marks<=100){
        return 'A';
    }else if(marks>=75 && marks<=89){
        return 'B';
    }else if(marks>=50 && marks<=74){
        return 'C';
    }else{
        return 'F';
    }
    }

    public void getDetails(){
        for(String name:marks.keySet()){
            Integer mark=marks.get(name);
            String grade=getGrade(mark);
            System.debug('Student:'+name+'marks:'+mark+'Grade:'+grade);
        
        }
    }
    public void findStudent(String studentName){
        if(marks.containsKey(studentName)){
                Integer mark=marks.get(studentName);
                String grade=getGrade(mark);
                System.debug('Student:'+studentName+'marks:'+mark+'Grade:'+grade);
        }
        else{
            System.debug('Student not found');
        }          
    }
    
    public void generateStudentReport(){

    Integer studentCount = countStudent();
    Integer totalMark = totalMarks();
    Decimal average = avgMarks();
    String highest = highestScore();
    String lowest = lowestScore();

    Integer highestMark = getMarks(highest);
    Integer lowestMark = getMarks(lowest);

    System.debug('========== STUDENT REPORT ==========');
    System.debug('Total Students: ' + studentCount);
    System.debug('Total Marks: ' + totalMark);
    System.debug('Average Marks: ' + average);
    System.debug('Highest Scorer: ' + highest + ' - ' + highestMark);
    System.debug('Lowest Scorer: ' + lowest + ' - ' + lowestMark);
    System.debug('Grade Summary:');

    countMarks();
}

}