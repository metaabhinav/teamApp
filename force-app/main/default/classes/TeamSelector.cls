public with sharing class TeamSelector extends fflib_SObjectSelector implements ITeamSelector {
    
    public static ITeamSelector newInstance(){
        return (ITeamSelector)Application.Selector.newInstance(Team__c.SObjectType);
    }
    public List<Schema.SObjectField> getSObjectFieldList(){
        return new List<Schema.SObjectField>{
            Team__c.Id,
            Team__c.Name
        };
    }
    public Schema.SObjectType getsObjectType(){
        return Team__c.sObjectType;
    }
    public List<Team__c> getAllRecords(){
        String qry = 'Select Id,Name from Team__c';
        return (List<Team__c>)Database.query(qry);
    }
}
