public class DML2_Assgn {
    public static void insert_dml() {
        //creating a new instance of sobject
        account acc = new account();
        acc.Name = 'Seda';
        insert acc;
        system.debug(acc);

        //second new record
        account acc2 = new account();
        acc2.Name = 'Assignment';
        insert acc2;
        system.debug(acc2);
    }

    public static void updating_dml() {
        //inserting a record in Account Obj
        account ac = new account();
        ac.Name = 'Account Created';
        system.debug(ac);
        insert ac;
        system.debug(ac);

        //updating the record just created
        ac.Name = 'Account Updated';
        update ac;
        system.debug(ac);
    }

    public static void createBulkContacts() {
        list<contact> listCon = new list<contact>();
        contact con1 = new contact();
        con1.FirstName = 'Mark';
        con1.LastNAme = 'Ruffalo';
        listCon.add(con1);

        contact con2 = new contact();
        con2.FirstName = 'Mark';
        con2.LastName = 'Ruffalo';
        listCon.add(con2);

        contact con3 = new contact();
        con3.FirstName = 'Chris';
        con3.LastName = 'Hemsworth';
        listCon.add(con3);

        contact con4 = new contact();
        con4.FirstName = 'Scarlett';
        con4.LastName = 'Johansson';
        listCon.add(con4);

        contact con5 = new contact();
        con5.FirstName = 'Scarlett';
        con5.LastName = 'Johansson';
        listCon.add(con5);

        insert listCon;
    }

    public static list<contact> searchForContacts(string conlastname) {
        list<contact> con = [select id, name from contact where lastname = : conlastname];
        return con;
    }
}