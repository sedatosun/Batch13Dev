public  class DmlDemo {
    public static void dmlInsertDemo_stndObj() {
        //create instance of sobject
        account acc = new account(); //similar to clicking new button
        //set field names
        acc.Name = 'softinnovas';

        //insert dml to create records
        insert acc;
        system.debug(acc);
    }

    public static void dmlInsertDemo_cstmObj() {
        //create instance
        Salesforce_Project__c sp = new Salesforce_Project__c();
        //set field names
        sp.Project_Name__c = 'Learn dml batch 13';
        sp.Description__c = 'doing good everynody';

        //save it by 'insert dml'
        insert sp;
    }

    public static void dmlUpdateDemo_stndObj1() {
        Account ac = new Account();
        ac.Name = 'Salesforce';
        system.debug('acc before inserting : ' + ac);
        insert ac;
        system.debug('acc insert called : ' + ac);

        //update any record. WE MUST HAVE ID.
        ac.Name = 'Salesforce Inc.';
        //update dml
        update ac;
        system.debug(('after updating : ' + ac));
    }

    public static void dmlUpdateDemo_stndObj3() {
        //1. get record from org
        account acc = [select id, name from account where name = 'softinnovas' limit 1];

        //update name
        acc.Name = 'SoftInnovas Inc.';
        acc.Phone = '87956626';

        update acc;
    }

    //crearting related contact record of a particular account 
    public static void dmlInsertDemo_stndObj2() {
        //fetch account record
        account ac = [select id, name from account where name like 'SoftInnovas%' limit 1];
        //create contact instance
        contact c = new contact();
        c.lastName = 'Biden';
        //related field id
        c.AccountId = ac.Id;
        //create conatct record
        insert c;
    }

    public static void dmlInsertDemo_cstmObj2() {
        //soql query to get project
        Salesforce_Project__c sp = [select id, name from Salesforce_Project__c ORDER BY CreatedDate desc limit 1];

        //create ticket
        Salesforce_Ticket__c newST = new Salesforce_Ticket__c();
        newST.Subject__c = 'create related record';
        newST.Priority__c = 'High';
        newST.Requested_by_date__c = date.today();
        newST.Status__c = 'New';
        //relationship field
        newST.Salesforce_Project__c = sp.Id;
        insert newST;
    }

    public static void dmlMultipleRecordInsert_right1() {
        list<account> listAcc = new list<account>();
        account acc1 = new account();
        acc1.Name = 'bulk acc1';
        listAcc.add(acc1);

        account acc2 = new account();
        acc2.Name = 'bulk acc2';
        listAcc.add(acc2);

        account acc3 = new account();
        acc3.Name = 'bulk acc3';
        listAcc.add(acc3);

        insert listAcc;
    }

    public static void dmlMultipleRecordInsert_right2() {
        list<account> listAcc = new list<account>();
        for (Integer i = 0; i < 160; i++) {
            account acc = new account();
            acc.Name = 'SoftInnovas v' + i;
            acc.Phone= '98543232' + i;
            acc.AccountNumber = 'ACS' + i;
            acc.Active__c = 'Yes';
            listAcc.add(acc);
            
        }
        //execute insert DML obly if listAcc is NOT EMPTY
            //isEmpty() --> true when no record.
            //isEmpty() --> false when records are present in list.
        if (!listacc.isEmpty()) {
            insert listAcc;
        }
    }

    public static void dmlMultipleRecordUpdate_right1() {
        list<account> listAccount = [select id, name from account order by createddate desc limit 20];

        //append b.0 in accounts
        for (account acc : listAccount) {
            acc.Name = acc.Name + 'B.0';
        }
        update listAccount;
    }

    //update
        //append Yy --> if active is Yes
        //append Nn --> if active is null
    public static void dmlMultipleRecordUpdate_right2() {
        list<account> listAccount = [select id, name, Active__c from account];

        list<account> updateAccount = new list<account>();
        for (account eachAcc : listAccount) {
            if (eachAcc.Active__c == 'Yes') {
                eachAcc.Name += ' Yy';
                updateAccount.add(eachAcc);
            } else if (eachAcc.Active__c == null) {
                eachAcc.Name = ' Nn';
                updateAccount.add(eachAcc);
            }
        }
        if (!updateAccount.isEmpty()) {
            update updateAccount;
        }
    }
}