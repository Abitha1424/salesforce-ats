import { LightningElement } from 'lwc';
export default class Add extends LightningElement {
    m1;
    m2;
    m4;
    input1(e){
        this.m1=Number(e.target.value);
    }
    
    input2(e){
        this.m2=Number(e.target.value);
    }
    m3(e){
        //alert('ertyui');
       this.m4=this.m1+this.m2; 
    }
}