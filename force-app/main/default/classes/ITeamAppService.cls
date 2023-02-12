public interface ITeamAppService {
    
    List<Team__c> getAllTeams();
    List<TeamMember__c> getTeamMemberByTeam(String team);
}
