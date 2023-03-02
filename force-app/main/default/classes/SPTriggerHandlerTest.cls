@isTest
public class SPTriggerHandlerTest {
    /* @isTest
    private static void testcreateDefaultTicket() {
        list<Salesforce_Project__c> listSP = new list<Salesforce_Project__c>();
        Salesforce_Project__c sp = new Salesforce_Project__c();
        sp.Project_Name__c = 'Test Project';
        sp.Status__c = 'Working';
        listSP.add(sp);

        insert listSP;

        list<Salesforce_Ticket__c> compltdList = [select id, status__c, salesforce_project__c from Salesforce_Ticket__c where Status__c != 'Completed'];
        assert.isTrue(compltdList[0].status__c.contains('Completed'));
    }
    
    @isTest
    private static void testvalidateProjectCompletion() {
        list<Salesforce_Project__c> listSP = new list<Salesforce_Project__c>();
        Salesforce_Project__c sp = new Salesforce_Project__c();
        sp.Project_Name__c = 'Test Project';
        sp.Status__c = 'In-Progress';
        listSP.add(sp);

        insert listSP;

        list<Salesforce_Ticket__c> listST = new list<Salesforce_Ticket__c>();
        Salesforce_Ticket__c st = new Salesforce_Ticket__c();
        st.Subject__c = 'Default ST Test';
        st.Salesforce_Project__c = listSP[0].id;
        listST.add(st);

        insert listST;
    }
    */
    @isTest
    private static void testFutureMethod() {
        //1. Data preparation
        //create instance
        Salesforce_Project__c sp = new Salesforce_Project__c();
        //set field names
        sp.Project_Name__c = 'Learn TEST batch 13';
        sp.Description__c = 'doing good everybody';

        Salesforce_Project__c sp2 = new Salesforce_Project__c();
        sp2.Project_Name__c = 'Learn future TEST batch 13';
        sp2.Description__c = 'doing good everybody';

        list<Salesforce_Project__c> listSP = new list<Salesforce_Project__c>{sp, sp2};
        insert listSP;

        set<id> spIds = new set<id> {sp.id, sp2.id};

        //2.0
        test.startTest();
        //2.Call Method
        SPTriggerHandler.updateProjectDescription(spIds);
        //2.1
        test.stopTest();

        //3.verification --> Assert
        list<Salesforce_Project__c> allSP = [select id, description__c from Salesforce_Project__c];
        for (Salesforce_Project__c s : allSP) {
            assert.isTrue(s.description__c.contains('future'));
        }

    }
}