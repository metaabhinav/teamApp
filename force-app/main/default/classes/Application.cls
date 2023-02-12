public with sharing class Application {
    public static final fflib_Application.ServiceFactory Service =new fflib_Application.ServiceFactory(
        new Map<Type, Type>{ITeamAppService.class => TeamAppServiceImpl.class}
    );
    public static final fflib_Application.SelectorFactory Selector = new fflib_Application.SelectorFactory(
        new Map<SObjectType,Type>{
            Team__c.SObjectType=>TeamSelector.class,
            TeamMember__c.SObjectType=>TeamMemberSelector.class
        }
    );
}
