public class AccountsQueueable implements Queueable {
    list<account> allAccounts = new list<account>();
    //constructor
    public AccountsQueueable(list<account> accs) {
        allAccounts = accs;
    }
    public void execute(QueueableContext qc) {
        //update all account's name
        
        /*for (account ac : allAccounts) {
            string newName = ac.Name.removeEnd('--SI');
            ac.Name += newName;
        }
        update allAccounts;
        */
        for (account ac : allAccounts) {
            ac.Name += '--SI';
        }
        update allAccounts;
    }
}