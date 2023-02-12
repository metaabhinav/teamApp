public interface ITeamMemberSelector extends fflib_ISObjectSelector{
    List<TeamMember__c> getAllRecordsByTeam(String teamName);
}
