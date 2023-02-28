public class SoqlParentChildAssignment {
    public static void printContactAccounts() {
        List<Contact> lstcontact = [SELECT Id, Name, Account.Id, Account.Name FROM Contact];
        for (Contact eachContact : lstcontact){
            System.debug('Contact name = ' + eachContact.Name + ', its acc Id is ' + eachContact.Account.Id + ', its acc name is ' + eachContact.Account.Name);
        }
    }
    public static void printAccountContacts() {
        List<Account> lstaccount = [SELECT Id, Name, (SELECT Id, Name FROM Contacts) FROM Account];
        for (Account eachAcc : lstaccount) {
            system.debug('Acc Name => ' + eachAcc.Name);
            for (Contact eachContact : eachAcc.Contacts) {
                system.debug('-- Contact Id => ' + eachContact.Name + ', Contact Name => ' + eachContact.Name);
            }
        }
    }
}