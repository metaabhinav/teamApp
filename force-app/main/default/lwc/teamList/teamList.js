import { LightningElement, wire } from 'lwc';
import {refreshApex} from '@salesforce/apex';
import getAllTeams from '@salesforce/apex/TeamsController.getAllTeams';
import getTeamMemberByTeam from '@salesforce/apex/TeamsController.getTeamMemberByTeam';
import { subscribe,MessageContext } from 'lightning/messageService';
import ADD_MEMBER_MESSAGE_CHANNEL from '@salesforce/messageChannel/New_Team_Member_Added__c';

const columns =[
    {label:'Name',fieldName:'Name'},
    {label:'Skills',fieldName:'Skills__c'},
    {label:'Team',fieldName:'Team__r.Name'}
]
export default class TeamList extends LightningElement {
    columns=columns;
    teamFilterValue='all';
    receivedTeams = [];
    teamMembers =[];
    error;
    subscription = null;

    @wire(MessageContext)
    messageContext;

    @wire(getAllTeams)
    wireCallBackForGetAllTeams({ data, error }) {
        if (data) {
            this.receivedTeams = data;
        } else if (error) {
            this.errors = error;
        }
    }

    @wire(getTeamMemberByTeam, { team: '$teamFilterValue' })
    wireCallBackForGetTeamMembers(value){
        this.wiredData = value;
        const {data, error} = value;
        if(data){
            this.teamMembers = data.map((member)=>{
                return {...member, "Team__r.Name" : member.Team__r.Name}
            });
        }else if(error){
            this.errors = error;
        }
    }

    subscribeToMessageChannel() {
        this.subscription = subscribe(
            this.messageContext,
            ADD_MEMBER_MESSAGE_CHANNEL,
            () => this.refreshDataDueToNewAccount()
        );
    }

    connectedCallback() {
        this.subscribeToMessageChannel();
    }

    handleTeamChange(event) {
        // console.log("yo");
        this.teamFilterValue = event.detail.value;
        // console.log(this.teamFilterValue);
    }

    refreshDataDueToNewAccount(){
        refreshApex(this.wiredData);
    }

    get teamOptions() {
        let options = [{ label: 'All', value: 'all' }];
        for (const team of this.receivedTeams) {
            options.push({ label: team.Name, value: team.Name });
        }
        return options;
    }
}