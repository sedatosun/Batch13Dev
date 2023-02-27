@isTest
public class DMLDemoAgainTest {
    @isTest
    private static void testInsertStdObj() {
        DMLDemoAgain.dmlInsertDemo_stndObj();//if this method works correctly,
        //then we would GET one record in SOQL
        //
        account acc = [select id, name from account where name = 'softinnovas' limit 1];
        system.assert(acc != null);
        system.assertEquals('softinnovas', acc.Name);
    }
    @isTest
    private static void testInsertCstmObj() {
        //call method
        DMLDemoAgain.dmlInsertDemo_cstmObj();

        //SOQL and Assert
        list<Salesforce_Project__c> listSP = [select id, name, project_name__c from Salesforce_Project__c where Project_Name__c = 'LEarn dml batch 13'];

        system.assertEquals(1, listSP.size());
    }
}