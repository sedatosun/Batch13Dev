trigger SalesforceProjectTrigger on Salesforce_Project__c (before update,before insert,after insert,after update) {
    //check if salesforceproject's trigger is enabled
    TriggerSwitch__C ts = TriggerSwitch__C.getInstance('salesforce_project__c');
    if (!ts.enabled__c) {
        return;
    }

    if (trigger.isAfter && trigger.isInsert) {
        system.debug('calling future method now...');
        //SPTriggerHandler.futureOne();
        SPTriggerHandler.updateProjectDescription(trigger.newMap.keySet());
        system.debug('JUST call future method...');
        //call handler here.
        //SPTriggerHandler.futureOne();
        //call handler here.
        SPTriggerHandler.createDefaultTicket(trigger.new);
    }
    if (trigger.isBefore && trigger.isUpdate) {
        //call method to validate ticket completion.
        //SPTriggerHandler.validateProjectCompletion(trigger.new, trigger.old, trigger.newMap, trigger.oldMap);
    }
    if (trigger.isAfter & trigger.isUpdate) {
        //call method1
        SPTriggerHandler.projectStatusChange(trigger.new, trigger.old, trigger.newMap, trigger.oldMap);
    }
}
/*
trigger SalesforceProjectTrigger on Salesforce_Project__c (before update,before insert,after insert,after update) {
    List<Salesforce_Project__c> newSfProjectList = Trigger.new;
    if(Trigger.isInsert && Trigger.isBefore){
        for(Salesforce_Project__c sfProject : newSfProjectList){
            sfProject.Project_Name__c = 'New Trigger Project';
        }
    }
    if(Trigger.isUpdate && Trigger.isAfter){
        Map<Id, Salesforce_Project__c> newSfProjectMap = Trigger.newMap;
        Map<Id, Salesforce_Project__c> oldSfProjectMap = Trigger.oldMap;
        Set<id> sfProjectIds = newSfProjectMap.keySet(); //all the IDS.
        for(Id sfProjectId : sfProjectIds){
            System.debug('Project Name before update is : ' + oldSfProjectMap.get(sfProjectId).Project_Name__c);
            System.debug('Project Name after update is : ' + newSfProjectMap.get(sfProjectId).Project_Name__c);
        }
    }
}
*/
//SOLUTION
/*
trigger SalesforceProjectTrigger on Salesforce_Project__c (before 
update,before insert,after insert,after update) {
    List<Salesforce_Project__c> newSfProjectList = Trigger.new;
    if(Trigger.isInsert && Trigger.isBefore){
        for(Salesforce_Project__c sfProject : newSfProjectList){
            sfProject.Project_Name__c = 'New Trigger Project';
        }
    }
    if(Trigger.isUpdate && Trigger.isAfter){
        Map<Id, Salesforce_Project__c> newSfProjectMap = Trigger.newMap;
        Map<Id, Salesforce_Project__c> oldSfProjectMap = Trigger.oldMap;
        Set<id> sfProjectIds = newSfProjectMap.keySet(); //all the IDS.
        for(Id sfProjectId : sfProjectIds){
            System.debug('Project Name before update is : ' + oldSfProjectMap.get(sfProjectId).Project_Name__c);
            System.debug('Project Name after update is : ' + newSfProjectMap.get(sfProjectId).Project_Name__c);
        }
    }
}
*/

/*
trigger SalesforceProjectTrigger on Salesforce_Project__c (before update,before insert,after insert,after update) {
    if (trigger.isAfter && trigger.isInsert) {
        system.debug('calling future method now...');
        //SPTriggerHandler.futureOne();
        SPTriggerHandler.updateProjectDescription(trigger.newMap.keySet());
        system.debug('JUST call future method...');
        //call handler here.
        //SPTriggerHandler.futureOne();
    }
    if (trigger.isBefore && trigger.isUpdate) {
        //call method to validate ticket completion.
        SPTriggerHandler.validateProjectCompletion(trigger.new, trigger.old, trigger.newMap, trigger.oldMap);
    }
}
*/