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
        assert.areEqual(1, listSP.size());
    }
    @isTest
    private static void testdmlUpdateDemo_stndObj3(){
        //1. prepare required data
        account acc = new account();
        acc.Name = 'softinnovas';
        insert acc;

        //call method to test
        DMLDemoAgain.dmlUpdateDemo_stndObj3();

        //how can we verify?
        //assertion
        //Fetch the updated record by SOQL
        Account updatedAcc =  [select id, name, phone from account limit 1];
        system.assertEquals('SoftInnovas Inc.', updatedAcc.Name);
        assert.areEqual('SoftInnovas Inc.', updatedAcc.Name );
        assert.areEqual('9556789451', updatedAcc.phone);
    }
    @isTest
    private static void testdmlInsertDemo_stndObj2() {
        //1. prepare required data
        account acc = new account();
        acc.Name = 'softinnovas';
        insert acc;
        
        ////call method to test
        DMLDemoAgain.dmlInsertDemo_stndObj2();

        //how can we verify?
        //assertion
        //Fetch the updated record by SOQL
        contact c =[select id, lastname, accountId from contact where lastname = 'Biden'];
        //assertion
        assert.areEqual(acc.id, c.AccountId);
        system.assert(c != null);
    }
    /*@isTest
    private static void testdmlInsertDemo_cstmObj2() {
        //1. prepare required data
        Salesforce_Project__c sp = new Salesforce_Project__c();
        sp.Project_Name__c = 'test sp';
        insert sp;
        
        //call method to test
        DMLDemoAgain.dmlInsertDemo_cstmObj2();

        //how can we verify?
        //assertion
        //Fetch the updated record by SOQL
        Salesforce_Ticket__c st =[select id, subject__c, Priority__c, Requested_by_date__c from Salesforce_Ticket__c where Subject__c = 'create related record' LIMIT 1];
        //assertion
        system.assert(st != null);
    }*/
    //SOLUTION from Vitap
    @isTest
    private static void testdmlInsertDemo_cstmObj2() {
        //prepare data
        Salesforce_Project__c sp = new Salesforce_Project__c();
        sp.Project_Name__c = 'test sp';
        insert sp;

        //we have 5 sec pf cpu left

        Test.startTesr();
        //governor limit reset HERE. So full 10 sec available.
        DMLDemoAgain.dmlInsertDemo_cstmObj2();
        Test.stopTest();

        //verify if ticket is created or not.
        Salesforce_Ticket__c st =[select id, subject__c, Priority__c, Salesforce_Project__c from Salesforce_Ticket__c where Subject__c = 'create related record' LIMIT 1];
        //assertion
        assert.areEqual(sp.id, st.Salesforce_Project__c);
    }
}