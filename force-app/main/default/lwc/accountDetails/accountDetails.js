import { LightningElement, api } from 'lwc';

export default class AccountDetails extends LightningElement {
    @api account;

    connectedCallback() {
        console.log('Account details:', this.account);
    }
}