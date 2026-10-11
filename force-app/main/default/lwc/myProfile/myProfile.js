import { LightningElement } from 'lwc';
import profileImage from '@salesforce/resourceUrl/profileImage';
export default class myProfile extends LightningElement {
    profileImage=profileImage;

    // -----------------------------
    // Student Information
    // -----------------------------

    name = 'Abitha';

    course = 'B.Tech Artificial Intelligence & Data Science';

    year = '4th Year';


    // -----------------------------
    // Skills
    // -----------------------------

    skills = [
        'Java',
        'Apex','Admin',
        'SOQL','SOSL','Triggers',
        'Salesforce',
        'Machine Learning'
    ];


    // -----------------------------
    // Show / Hide Additional Info
    // -----------------------------

    showMore = false;


    // -----------------------------
    // Button Label
    // -----------------------------

    get buttonLabel() {
        return this.showMore ? 'Show Less' : 'Show More';
    }


    // -----------------------------
    // Combobox Options
    // -----------------------------

    options = [
        {
            label: 'Career Opportunity',
            value: 'career'
        },
        {
            label: 'Project Discussion',
            value: 'project'
        },
        {
            label: 'General Message',
            value: 'general'
        }
    ];


    // -----------------------------
    // Button Event
    // -----------------------------

    handleToggle() {

        this.showMore = !this.showMore;

    }


    // -----------------------------
    // DOM Reference Example
    // -----------------------------

    handleFocus() {

        const input = this.refs.nameInput;

        input.focus();

    }
}