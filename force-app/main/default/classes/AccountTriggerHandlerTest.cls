@isTest
public class AccountTriggerHandlerTest {
    @isTest
    private static void testupdateDescription() {
        Account acc = new account();
        acc.Name = 'SI test';
        acc.Industry = 'Energy';
        acc.Active__c = 'Yes';

        Account acc2 = new account();
        acc2.Name = 'AI test';
        acc2.Industry = 'Energy';
        acc2.Active__c = 'Yes';

        Account acc3 = new account();
        acc3.Name = 'BI test';
        acc3.Industry = 'Banking';

        list<account> listAcc = new list<account>{acc, acc2, acc3};
        insert listAcc;

        //assertion only for YES 
        list<account> updateAcc = [select id, description, active__c from account where Active__c = 'Yes'];
        assert.isTrue(updateAcc[0].description.contains('Enjoy'));

        //assertion only for BOTH 
        list<account> updateAcc2 = [select id, description, Active__c from account];
        for (account ac : updateAcc2) {
            if (ac.Active__c == 'Yes') {
                assert.isTrue(ac.description.contains('Enjoy'));
            } else {
                assert.isTrue(ac.description == null);
            }
        }
        
    }

    @isTest
    private static void testupdateDescription2() {
        Account acc = new account();
        acc.Name = 'SI test';
        acc.Industry = 'Energy';

        Account acc2 = new account();
        acc2.Name = 'AI test';
        acc2.Industry = 'Energy';

        Account acc3 = new account();
        acc3.Name = 'BI test';
        acc3.Industry = 'Banking';

        list<account> listAcc = new list<account>{acc, acc2, acc3};
        insert listAcc;

        //update account recorda
        for (account eachAcc : listAcc) {
            eachAcc.Active__c = 'Yes';
        }
        update listAcc;

        //assertion only for YES 
        list<account> updateAcc = [select id, description, active__c from account where Active__c = 'Yes'];
        assert.isTrue(updateAcc[0].description.contains('Enjoy'));        
    }
    @isTest
    private static void testUpdateVIP1() {
        //create account
        Account acc = new account();
        acc.Name = 'SI test';
        acc.Industry = 'EnergAy';
        acc.Active__c = 'Yes';

        Account acc2 = new account();
        acc2.Name = 'AI test';
        acc2.Industry = 'Energy';
        acc2.Active__c = 'Yes';

        Account acc3 = new account();
        acc3.Name = 'BI test';
        acc3.Industry = 'Banking';

        list<account> listAcc = new list<account>{acc, acc2, acc3};
        insert listAcc;
        //create related contact records
        List<Contact> listContact = new list<contact>();
        for (Integer i = 0; i < 300; i++) {
            contact c = new contact();
            c.LastName = 'anything ' + i;

            if (i < 100) {
                c.accountid = listAcc[0].id;
            } else if(i < 200){
                c.accountid = listAcc[1].id;
            } else {
                c.AccountId = listAcc[2].id;
            }
            listContact.add(c);
        }
        insert listContact;

        Test.startTest();
        //update account's vip field
        for (account eachAc : listAcc) {
            eachAc.vip__c = true;
        }
        update listAcc;
        //trigger will be called 
                //which will update vip field of all contacts
        Test.stopTest();
                //we will assert it.

        //what do we have to assert?
        //verify that all contact's VIP field is NOW true/checked.
        list<contact> allContacts = [select id, accountId, vip__c from contact];
        for (contact cc : allContacts) {
            assert.areEqual(true, cc.vip__c);
        }
    }
    @isTest
    private static void testFutureMethod() {
        account acc = new account();
        acc.Name = 'Test Future';
        insert acc;

        contact con = new contact();
        con.LastName = 'Future';
        con.AccountId = acc.Id;
        insert con;

        set<id> setAccId = new set<id>();
        setAccId.add(acc.Id);

        Test.startTest();
        AccountTriggerHandler.futureMethod(setAccId);
        Test.stopTest();

        account ac = [select Number_of_Contacts__c from Account where id =: acc.Id];
        system.assertEquals(Integer.valueOf(ac.Number_of_Contacts__c), 1);
    }
}