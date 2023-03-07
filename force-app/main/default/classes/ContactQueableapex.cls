public class ContactQueableapex implements Queueable{
    public list<account> allAccounts;
    //constructor
    public ContactQueableapex (list<account> acc) {
        allAccounts = acc;
    }

    public void execute(QueueableContext qc) {
        list<contact> conList = new list<contact> ();
        for (account ac : allAccounts) {
            contact c = new contact();
            c.LastName = ac.Name + ' --> Queueable';
            c.AccountId = ac.Id;
            conList.add(c);            
        }
        insert conList;
    }
}