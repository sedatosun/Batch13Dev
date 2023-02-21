public class SPTriggerHandler {
    public static void createDefaultTicket(list<Salesforce_Project__c> spTriggerNew) {
        list<Salesforce_Ticket__c> newTickets = new List<Salesforce_Ticket__c>();
        for (Salesforce_Project__c eachSP : spTriggerNew) {
            //create new ticket here
            Salesforce_Ticket__c st = new Salesforce_Ticket__c();
            st.Subject__c = 'Default ST';
            st.Salesforce_Project__c = eachSP.Id;
            st.Requested_by_date__c = date.today();
            newTickets.add(st);
        }
        if (!newtickets.isEmpty()) {
            insert newTickets;
        }
    }

    public static void validateProjectCompletion(list<Salesforce_Project__c> spTriggerNew,
    list<Salesforce_Project__c> spTriggerOld, map<id, Salesforce_Project__c> spTriggerNewMap, map<id, Salesforce_Project__c> spTriggerOldMap) {

        set<id> spCompletedIds = new set<id>();
        //get all SP ids for which Status is changed to completed
        for (Salesforce_Project__c eachSP : spTriggerNew) {
            if (eachSP.Status__c != spTriggerOldMap.get(eachSP.Id).Status__c && eachSP.Status__c == 'Completed') {
                spCompletedIds.add(eachSP.Id);
            }
        }
        system.debug('sp completed ids are ' + spCompletedIds);
        if (!spCompletedIds.isEmpty()) {
            //get 'not completed' tickets for completed projects.
            //if we find any not completed ticket for completed project, then THROW ERROR.
        List<Salesforce_Ticket__c> listST = [select id, status__c, salesforce_project__c from Salesforce_Ticket__c 
                                            WHERE Salesforce_Project__c in :spCompletedIds and status__c != 'Completed'];
        for (Salesforce_Ticket__c eachST : listST) {
            //get project from Trigger.newMap context variable to throw error
            Salesforce_Project__c newSP = spTriggerNewMap.get(eachST.Salesforce_Project__c);
            newSP.status__c.addError('Cannot complete project because all its tickets are not completed');
            }
        }
    }
}