public with sharing class TeamsController {
    
    @AuraEnabled(cacheable=true)
    public static List<Team__c> getAllTeams(){
        return TeamAppService.getAllTeams();
    }
    @AuraEnabled(cacheable=true)
    public static List<TeamMember__c> getTeamMemberByTeam(String team){
       return TeamAppService.getTeamMemberByTeam(team);
    }
}
