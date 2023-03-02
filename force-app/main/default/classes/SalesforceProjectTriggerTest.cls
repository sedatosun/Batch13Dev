@IsTest
public class SalesforceProjectTriggerTest {
    @TestSetup
    static void makeData(){
        Salesforce_Project__c sfProject1 = new Salesforce_Project__c(Project_Name__c = 'Test Project', Status__c = 'New');
        //test insert
        insert sfProject1;
        Salesforce_Ticket__c sfTicket1 = new Salesforce_Ticket__c(Subject__c = 'Test Ticket', Salesforce_Project__c = sfProject1.Id, Status__c = 'Completed');
        insert sfTicket1;
    }
    @IsTest
    public static void testMethod1(){
        Exception expectedException;
        Salesforce_Project__c sfProject1 = [Select Id, Status__c, Project_Name__c from Salesforce_Project__c limit 1];
        //test update
        Test.startTest();
        try{
            sfProject1.Project_Name__c = 'Updated Test Project';
            sfProject1.Status__c = 'Completed';
            update sfProject1;
        }
        catch(Exception d){
            expectedException = d;
        }
        Test.stopTest();
        System.assertNotEquals(null, expectedException, 'All tickets are not completed');
    }
}