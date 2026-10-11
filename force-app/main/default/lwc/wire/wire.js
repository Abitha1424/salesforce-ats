import { LightningElement,wire } from 'lwc';
import getAcc from '@salesforce/apex/WireAccount.getAccRecord';
export default class Wire extends LightningElement {
    accList=[];
    columnsList=[{label:'Name',fieldName:'Name'},{label:'Industry',fieldName:'Industry'}];
    err;

    @wire(getAcc)
    m1({data,error}){      // m1({result})    using result single parameter 
        if(data){
            this.accList=data;  //this.accList=result.data
            
        }else{
            this.err=error;    //this.err=result.error 
        }
    }
}