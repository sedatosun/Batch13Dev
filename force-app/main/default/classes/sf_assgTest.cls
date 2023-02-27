@isTest
public class sf_assgTest {
    @isTest
    private static void TestInsert() {
        sf_assg.insertsf();
        Salesforce_Project__c s = [select id, Project_Name__c from Salesforce_Project__c where Project_Name__c like '½Phone%' LIMIT 1];
        system.assert(s !=null);
    }
    
    @isTest
    private static void TestUpdate() {
        sf_assg.updatesf();
        list<salesforce_Project__c> s = [select id, Project_Name__c from Salesforce_Project__c where Project_Name__c LIKE 'Phone2'];
        system.assert(s != null);
    }
}