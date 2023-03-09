public class SPTriggerHandler {
    public static void createDefaultTicket(list<Salesforce_Project__c> spTriggerNew) {
        try {
            DefaultTicketInfo__c dtInfo =  defaultTicketInfo__c.getOrgDefaults();
        list<Salesforce_Ticket__c> newTickets = new List<Salesforce_Ticket__c>();
        for (Salesforce_Project__c eachSP : spTriggerNew) {
            //create new ticket here
            Salesforce_Ticket__c st = new Salesforce_Ticket__c();
            st.Subject__c = dtInfo.Subject__c;
            st.Salesforce_Project__c = eachSP.Id;
            st.Requested_by_date__c = date.today();
            st.Priority__c = 'High';
            st.Description__c = dtInfo.description__c;
            newTickets.add(st);
        }
        if (!newtickets.isEmpty()) {
            insert newTickets;
        } 
    } catch (Exception ex) {
        //string validationError = system.label.createDefaultTicket;
        For (Salesforce_Project__c eachSp : spTriggerNew) {
                eachSP.addError('Error in creating ticket. Please contact your administrator, not deveeloper');
            }
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

    //1.STATIC
    //2.IT must return VOID
    /*
    @future
    public static void futureOne(){
        system.debug('this system debug is inside FUTURE method');
    }
    */
    
    @future
    public static void updateProjectDescription(set<id> spIds) {
        if (!spIds.isEmpty()) {
            list<Salesforce_Project__c> listSP = [select id, description__c from Salesforce_Project__c where id in :spIds];
        for (Salesforce_Project__c eachSP : listSP) {
            eachSP.description__c = 'updated desc from future method';
        }
        update listSP;
        }
    }

    //METHOD1 (normal method)
    //get set<id> of project for which status is changed to completed.
    //call method2(setId)
    public static void projectStatusChange(list<Salesforce_Project__c> spTriggerNew,
    list<Salesforce_Project__c> spTriggerOld, map<id, Salesforce_Project__c> spTriggerNewMap, map<id, Salesforce_Project__c> spTriggerOldMap) {
        set<id> spIds = new set<id>();
        for (Salesforce_Project__c sp : spTriggerNew) {
            //check if status is changed to completed
            if (sp.status__c == 'Completed' && sp.status__c != spTriggerOldMap.get(sp.Id).status__c) {
                spIds.add(sp.Id);
            }
        }
        if (!spIds.isEmpty()) {
            //call future method
            updateTicketStatus(spIds);
        }
    }

    //Method2 (future method)
    //get all tickets of setId project ids
    //update status to completed.
    @future
    private static void updateTicketStatus(set<id> spIds) {
        //update all tickets
        //get all tickets
        List<Salesforce_Ticket__c> allST = [select id, status__c, salesforce_Project__c from Salesforce_Ticket__c where Salesforce_Project__c in:spIds and status__c != 'Completed'];
        for (Salesforce_Ticket__c st : allST) {
            st.Status__c = 'Completed';
        }
        update allST;
    }
}