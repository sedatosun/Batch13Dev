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
trigger SalesforceProjectTrigger on Salesforce_Project__c (before update,before insert,after insert,after update) {
    if (trigger.isAfter && trigger.isInsert) {
        //call handler here.
        SPTriggerHandler.createDefaultTicket(trigger.new);
    }
    if (trigger.isBefore && trigger.isUpdate) {
        //call method to validate ticket completion.
        SPTriggerHandler.validateProjectCompletion(trigger.new, trigger.old, trigger.newMap, trigger.oldMap);
    }
}