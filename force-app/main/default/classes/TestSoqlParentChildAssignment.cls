@isTest
public class TestSoqlParentChildAssignment {
    @TestSetup
    static void makeData(){
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
    }  

    @isTest
    private static void testprintContactAccounts() {
    List<account> listAcc = [select id, name, industry from account];

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
    SoqlParentChildAssignment.printContactAccounts();
    Test.stopTest();
    }
    @isTest
    private static void testprintAccountContacts() {
        List<account> listAcc = [select id, name, industry from account];
        for (account eachacc : listAcc) {
            eachAcc.type = 'Customer - direct';
        }
        update listAcc;

        List<Contact> listContact = new List<Contact>();
        for (Integer i = 0; i < 300; i++) {
            Contact con = new Contact();
            con.LastName = 'test opp'+i;
            
            if (i < 100) {
                con.AccountId = listAcc[0].id;
            } else if (i < 200){
                con.AccountId = listAcc[1].id;
            } else {
                con.AccountId = listAcc[2].id;
            }
            listContact.add(con);
        }
        insert listContact;

        Test.startTest();
        SoqlParentChildAssignment.printAccountContacts();
        Test.stopTest();
    }
}