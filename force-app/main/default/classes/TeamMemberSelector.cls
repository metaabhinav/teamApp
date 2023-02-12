public with sharing class TeamMemberSelector extends fflib_SObjectSelector implements ITeamMemberSelector{
    public static ITeamMemberSelector newInstance(){
        return (ITeamMemberSelector) Application.Selector.newInstance(TeamMember__c.SObjectType);
    }
    public List<Schema.SObjectField> getSObjectFieldList() {
        return new List<Schema.SObjectField> {
            TeamMember__c.Id,
            TeamMember__c.Name,
            TeamMember__c.Team__c,
            TeamMember__c.Skills__c
        };
    }
    public Schema.SObjectType getsObjectType() {
        return TeamMember__c.sObjectType;
    }
    public List<TeamMember__c> getAllRecordsByTeam(String team){
        String queryString = 'SELECT Id, Name, Skills__c, Team__r.Name FROM TeamMember__c';
        if(team == 'all'){
            return (List<TeamMember__c>) Database.query(queryString);
        }else{
            queryString += 'WHERE Team__r.Name = '+ team;
            return (List<TeamMember__c>) Database.query(queryString);
        }
    }
}
