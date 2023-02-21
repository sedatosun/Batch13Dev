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
}