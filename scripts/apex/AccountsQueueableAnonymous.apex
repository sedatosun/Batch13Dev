list<account> listA = [select id, name from account where name like '%--SI' limit 50];
AccountsQueueable aq = new AccountsQueueable(listA);
//we can do enqueueJob only for the classes which IMPLEMENTS queueable.
id qId = system.enqueueJob(aq);

//we can executeBacth only the classes which Implements batchable.
//id batchId = Database.executeBatch(aq, 21);