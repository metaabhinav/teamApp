global with sharing class TeamAppService {

    private static ITeamAppService service(){
        return(ITeamAppService)Application.Service.newInstance(ITeamAppService.class);
    }
    global static List<Team__c> getAllTeams(){
        return service().getAllTeams();
    }
    global static List<TeamMember__c> getTeamMemberByTeam(String team){
        return service().getTeamMemberByTeam(team);
    }
}
