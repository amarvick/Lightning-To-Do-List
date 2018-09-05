public with sharing class OpsHR_UserSettingsController 
{
    private ApexPages.StandardController controller                     {get; set;}
    public string userSupportLocation {get; set;}
    public List<RecordType> recordTypes = new List<RecordType>();

    public SelectOption[] selectedQs { get; set; }
    public SelectOption[] unselectedQs { get; set; }


    public OpsHR_UserSettingsController(ApexPages.StandardController controller) { }
    
    // Gets all of the Record Type names for the dropdown. Only gets those that are accessible to the profile
    public List<SelectOption> allPubGroups {
        get {
            List<SelectOption> pubGroups = new List<SelectOption>();

            List<Group> regularGroups = [SELECT Id, Name FROM Group WHERE Type = 'Regular'];

            // for(RecordTypeInfo info: Case.SObjectType.getDescribe().getRecordTypeInfos()) {
            for (Group rg : regularGroups) {
                if (rg.Name.length() == 4) {
                    pubGroups.add(new SelectOption(rg.Name, rg.Name));
                }
            }
        return pubGroups;
        }
        set;
    }

    public PageReference saveType() {
        String retURL = ApexPages.currentPage().getParameters().get('id');
        
        // Case theCase = [SELECT Id FROM Case WHERE Id=:retURL];
        
        // theCase.RecordTypeId = [SELECT Id FROM RecordType WHERE Id =:caseRecordType].Id;
        // update theCase;
        
        PageReference pageRef = new PageReference('/apex/Settings?id=' + retURL).setRedirect(true);
        return pageRef;
    }

    public List<SelectOption> unselectedQueues {
        get {
            List<SelectOption> allQueues = new List<SelectOption>();
            List<OpsHR_Setup__mdt> allMDT = [SELECT Label FROM OpsHR_Setup__mdt];

            String retURL = ApexPages.currentPage().getParameters().get('id');
          
            User theUser = [SELECT Id, Support_Location__c FROM User WHERE Id =: UserInfo.getUserId()];

            // Obtain all Groups the current user is a member of
            List<GroupMember> groupMembers = [SELECT GroupId, Id, UserOrGroupId FROM GroupMember WHERE UserOrGroupId =: theUser.Id];
            List<Id> groupIds = new List<Id>();
            
            for (GroupMember g : groupMembers) {
                groupIds.add(g.GroupId);
            }

            // Filter these groups to Queues
            List<Group> nonGroups = [SELECT Id, Name FROM Group WHERE Type = 'Regular' AND Id !=: groupIds];
            System.debug('nonGroups: ' + nonGroups);

            for (Group ng : nonGroups) {
                allQueues.add(new SelectOption(ng.Name, ng.Name));
            }

            return allQueues;
        }
        set;
    }

    public List<SelectOption> selectedQueues {
        get {
            List<SelectOption> allQueues = new List<SelectOption>();
            List<OpsHR_Setup__mdt> allMDT = [SELECT Label FROM OpsHR_Setup__mdt];

            // String retURL = ApexPages.currentPage().getParameters().get('id');
         
            User theUser = [SELECT Id FROM User WHERE Id =: UserInfo.getUserId()];

            // Obtain all Groups the current user is a memebr of
            List<GroupMember> groupMembers = [SELECT GroupId, Id, UserOrGroupId FROM GroupMember WHERE UserOrGroupId =: theUser.Id];
            List<Id> groupIds = new List<Id>();
            
            for (GroupMember g : groupMembers) {
                groupIds.add(g.GroupId);
            }

            // Filter these groups to Queues
            List<Group> actualGroups = [SELECT Id, Name FROM Group WHERE Type = 'Regular' AND Id =: groupIds];

            for (Group ng : actualGroups) {
                allQueues.add(new SelectOption(ng.Name, ng.Name));
            }

            return allQueues;
        }
        set;
    }

    public PageReference grantQueueAccess() {
        String retURL = ApexPages.currentPage().getParameters().get('id');
        
        User theUser = [SELECT Id, Support_Location__c FROM User WHERE Id =: UserInfo.getUserId()];

        // All Groups for reference
        List<Group> eachPG = [SELECT Id, Name FROM Group WHERE Type = 'Regular'];
        System.debug('eachPG: ' + eachPG);

        // What Groups the user wants to switch in/out of
        String selectedSLs = Apexpages.currentPage().getParameters().get('selectedSLs');

        String[] selectedSLArray = selectedSLs.split(',');

        List<Group> groupGranted = [SELECT Id, Name FROM Group WHERE Type = 'Regular' AND Name =: selectedSLArray];
        System.debug('groupGranted: ' + groupGranted);

        // What Groups the user is already in
        List<GroupMember> currentGroupsMember = [SELECT GroupId, Id, UserOrGroupId FROM GroupMember WHERE UserOrGroupId =: theUser.Id];

        List<Id> cgmId = new List<Id>();
        for (GroupMember n : currentGroupsMember) {
            cgmId.add(n.GroupId);
        }

        List<Group> currentGroups = [SELECT Id, Name FROM Group WHERE Type = 'Regular' AND Id =: cgmId];
        System.debug('currentGroups: ' + currentGroups);

        // Adding/Deleting the group members
        for (Group g : eachPG) {
            if (!currentGroups.contains(g) && groupGranted.contains(g)) {
                GroupMember newMember = new GroupMember(GroupId = g.Id, UserOrGroupId = theUser.Id);
                System.debug('newMember: ' + newMember);
                insert newMember;
            }

            else if (currentGroups.contains(g) && !groupGranted.contains(g)) {
                GroupMember theMember = [SELECT Id, UserOrGroupId FROM GroupMember WHERE GroupId =: g.Id AND UserOrGroupId =: theUser.Id];
                System.debug('theMember: ' + theMember);
                delete theMember;
            }
        }

        PageReference pageRef = new PageReference('/apex/Settings?id=' + retURL).setRedirect(true);
        return pageRef;
    }
}