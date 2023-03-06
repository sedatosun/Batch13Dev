@isTest
public class ContactsBatchTest {
    @isTest
    public static void testConBatch() {
        //Data preparation
        list<contact> conList = new list<contact>();
        for (Integer i = 0; i < 900; i++) {
            contact c= new contact();
            c.LastName = 'Batch Test';
            c.Description = 'Batch test description';
            conList.add(c);
        }
        insert conList;

        //Execute in between Test.startTest and Test.stopTest
        Test.startTest();
        ContactsBatch cb = new ContactsBatch();
        Database.executeBatch(cb, 900);
        test.stopTest();

        //Assertion
        list<contact> allContacts = [select description from Contact];
        for (contact c : allContacts) {
            assert.isTrue(c.Description.containsIgnoreCase('batch'));
        }
    }
}