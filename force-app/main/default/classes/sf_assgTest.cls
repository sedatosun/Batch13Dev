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
//SOLUTION
/*
@isTest
public class sf_assgTest {
    @isTest
    public static void insertsfTest() {
        sf_assg.insertsf();
        //soql will fetch records from TEST world (not from org)
        List<Salesforce_Project__c> listSFProject = [select id, 
Project_Name__c from Salesforce_Project__c where Project_Name__c = 
'Phone23'];
        system.assertEquals(10, listSFProject.size());
        system.assertEquals('Phone23', 
listSFProject[0].Project_Name__c);
    }
    @isTest
    public static void updatesfTest() {
        sf_assg.insertsf();
        sf_assg.updatesf();
        //soql will fetch records from TEST world (not from org)
        List<Salesforce_Project__c> listSFProject = [select id, 
Project_Name__c from Salesforce_Project__c where Project_Name__c = 
'Phone2'];
        system.assertEquals(1, listSFProject.size());
        system.assertEquals('Phone2', 
listSFProject[0].Project_Name__c);
    }
}
*/