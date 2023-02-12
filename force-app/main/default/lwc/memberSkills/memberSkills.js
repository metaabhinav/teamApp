import { LightningElement, wire } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import {publish,MessageContext} from 'lightning/messageService';
import ADD_MEMBER_MESSAGE_CHANNEL from '@salesforce/messageChannel/New_Team_Member_Added__c';

import Team_Object from '@salesforce/schema/TeamMember__c';
import NAME_FIELD from '@salesforce/schema/TeamMember__c.Name';
import Skill_Field from '@salesforce/schema/TeamMember__c.Skills__c';
import Team_Field from '@salesforce/schema/TeamMember__c.Team__c'

const fields=[NAME_FIELD, Skill_Field, Team_Field];
export default class MemberSkills extends LightningElement {
    teamMemberobjectApiName = Team_Object;
    fields = fields;

    @wire(MessageContext)
    messageContext;

    handleSuccess(event) {
        const toastEvent = new ShowToastEvent({
            title: "Team Member Created",
            message: "Record ID: " + event.detail.id,
            variant: "success"
        });
        this.dispatchEvent(toastEvent);
        const editForm = this.template.querySelector('lightning-record-form');
        editForm.recordId = null;
        publish(this.messageContext,ADD_MEMBER_MESSAGE_CHANNEL);
    }
   
}