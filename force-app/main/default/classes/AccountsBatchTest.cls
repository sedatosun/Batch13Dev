@isTest
public class AccountsBatchTest {
    @isTest
    public static void testBatch1() {
        //1. Data preparation
        list<account> listAcc = new list<account>();
        for (Integer i = 0; i < 900; i++) {
            account a = new account();
            a.Name = 'batch test';
            a.Active__c = 'Yes';
            a.Description = 'TEST';
            listAcc.add(a);
        }
        insert listAcc;
        //END OF data preparation.

        //2. execute in between Test.startTest and Test.stopTest.
        Test.startTest();
        AccountsBatch ab = new AccountsBatch();
        Database.executeBatch(ab, 900);
        test.stopTest();

        //3. assertion.
        list<account> allAccounts = [select description from Account];
        for (account ac : allAccounts) {
            assert.isTrue(ac.Description.containsIgnoreCase('batch'));
        }
    }
}