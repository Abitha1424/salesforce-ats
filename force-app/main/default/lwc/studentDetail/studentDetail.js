import { LightningElement ,api } from 'lwc';

export default class StudentDetail extends LightningElement {
    @api studentName;
    @api studentAge;
    @api studentGrade;
    @api studentAddress;

    
}