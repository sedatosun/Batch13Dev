list<account> listAcc = new list<account>();
        account acc1 = new account();
        acc1.Name = 'trg acc1';
        listAcc.add(acc1);

        account acc2 = new account();
        acc2.Name = 'trg acc2';
        listAcc.add(acc2);

        account acc3 = new account();
        acc3.Name = 'trg acc3';
        listAcc.add(acc3);

        insert listAcc;

        for (Integer i = 0; i <15; i++) {
            //create instance of sobject
            account acc = new account(); //similar to clicking new button
            //set field names
            acc.Name = 'softinnovas' + i;

            //insert dml to create records
            insert acc;
        }