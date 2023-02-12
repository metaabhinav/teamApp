public with sharing class teamAppServiceImpl implements ITeamAppService {
    public List<Team__c> getAllTeams(){
        return TeamSelector.newInstance().getAllRecords();
    }

    public List<TeamMember__c>getTeamMemberByTeam(String team){
        return TeamMemberSelector.newInstance().getAllRecordsByTeam(team);
    }
}
