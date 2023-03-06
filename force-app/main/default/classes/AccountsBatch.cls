public class AccountsBatch implements Database.Batchable<SObject>, Database.stateful{
    integer recordCount = 0;
    //AccountsBatch must implement the method: System.Iterable<SObject> Database.Batchable<SObject>.start(Database.BatchableContext) (1:14)
    //AccountsBatch must implement the method: void Database.Batchable<SObject>.execute(Database.BatchableContext, List<SObject>) (1:14)
    //AccountsBatch must implement the method: void Database.Batchable<SObject>.finish(Database.BatchableContext) (1:14)

    //start method --> SOQL QUERY -> ACCOUNT -> 50k (min -> 1 max -> 10k)
    public Database.QueryLocator start (Database.BatchableContext bc){
        system.debug('inside start method');
        Database.QueryLocator acc = Database.getQueryLocator([select id, name, active__c, Description from account]);
        return acc;
    }
    //execute method (list<account>)
    public void execute(Database.BatchableContext bc, list<account> scope ){
        system.debug('inside execute method');
        system.debug('check recordCount FIRST: ' + recordCount);
        //update account records
        list<account> updateAccount = new list<account>();
        for (account eachAcc : scope) {
            if (eachAcc.Active__c != 'No') {
                eachAcc.Description += '... Updated via batch';
                updateAccount.add(eachAcc);
            }
        }
        if (!updateAccount.isEmpty()) {
            update scope;
            recordCount += updateAccount.size();
            system.debug('check recordCount SECOND: ' + recordCount);
        }
    }
    //finish method
    public void finish(Database.BatchableContext bc){
        system.debug('Finished with all records');
        system.debug('check recordCount FINAL: ' + recordCount);
    }
}