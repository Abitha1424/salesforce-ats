import { LightningElement } from 'lwc';

export default class StudentParent extends LightningElement {

    receivedMessage = '';

    handleMessage(event) {
        this.receivedMessage = event.detail;
    }
}