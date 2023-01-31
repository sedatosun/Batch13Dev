public class conAccSoqlAssignment {
    public static void childToParent() {
        List<contact>listContact = [select id, name, account.id, account.name from contact];
        system.debug(listContact);
        for (contact eachContact : listContact) {
            system.debug('Account id ==>' + eachContact.Account.Id + ', Account name ==> ' + eachContact.Account.Name);
            }
    }
    public static void parentToChild() {
        List<account>listAccount = [select id, name, (select id, name from contacts) from account];
        system.debug(listAccount);
        for (account eachAccount : listAccount) {
            for (contact contact : eachAccount.contacts) {
                string contactId = contact.id;
                string contactName = contact.Name;
                system.debug('Contact Name ==> ' + contactName + ', contact ID ==> ' + contactId);
                }
            }
        }
}