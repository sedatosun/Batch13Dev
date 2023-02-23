public class AccountHandler_assg {
    public static void createContact(List<Account> accList) {
        list<contact> newContact = new  list<contact>();
            for (account eachAcc : accList) {
                //creating new contact
                Contact con = new Contact();
                con.accountId = eachAcc.Id;
                con.firstName = eachAcc.Name;
                con.Lastname = 'Hermes';
                newContact.add(con);
        }
        insert newContact;
    }
}