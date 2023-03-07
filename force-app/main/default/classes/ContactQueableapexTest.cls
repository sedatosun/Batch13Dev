@isTest
public class ContactQueableapexTest {
    @isTest
    public static void testQueueable1() {
        list<account> accList = new list<account>();
        account a = new account();
        a.Name = 'Queueable';
        a.Active__c = 'Yes';
        accList.add(a);

        insert accList;

        test.startTest();
        ContactQueableapex cq = new ContactQueableapex(accList);
        system.enqueueJob(new ContactQueableapex(accList));
        test.stopTest();

        list<contact> conList = [SELECT id, lastname from contact where LastName like '%Queueable%'];
        assert.areEqual(1, conList.size());
        }
    }