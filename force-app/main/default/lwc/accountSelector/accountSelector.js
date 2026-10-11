import { LightningElement, wire } from 'lwc';
import getAccounts from '@salesforce/apex/AccountLwc.getAccounts';

export default class AccountSelector extends LightningElement {

    accounts = [];
    selectedAccountId = '';
    selectedAccount;

    @wire(getAccounts)
    wiredAccounts({ data, error }) {

        if (data) {
            this.accounts = data;
        } else if (error) {
            console.error(error);
        }
    }

    get accountOptions() {

        return this.accounts.map(account => {
            return {
                label: account.Name,
                value: account.Id
            };
        });
    }

    handleChange(event) {

        this.selectedAccountId = event.detail.value;

        this.selectedAccount = this.accounts.find(
            account => account.Id === this.selectedAccountId
        );
    }
}