import { LightningElement } from 'lwc';

export default class StudentChild extends LightningElement {

    sendMessage() {
        const event = new CustomEvent('message', {
            detail: 'Hello Parent!'
        });

        this.dispatchEvent(event);
    }
}