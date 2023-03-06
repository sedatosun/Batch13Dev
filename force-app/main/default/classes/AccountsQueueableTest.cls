@isTest
public class AccountsQueueableTest {
    private testmethod static void testQueueable1() {
        list<account> listAccount = new list<account>();
        for (Integer i = 0; i < 100; i++) {
            account a = new account();
            a.Name = 'queueable test ' + i;
            a.Active__c = 'Yes';
            a.Description = 'TEST. ';
            listAccount.add(a);
        }
        insert listAccount;
        //1 ends here
        //2 enqueue job in between startTest and stopTest
        Test.startTest();
        list<account> allAccounts = [select id, name from account];
        system.enqueueJob(new AccountsQueueable(listAccount));
        Test.stopTest();
        //2 ends

        //3 assertion
        integer countAcc = [select count() from account where name like '%--SI'];
        assert.areEqual(100, countAcc);
    }
}