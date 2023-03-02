public class AccountsBatch implements Database.Batchable<SObject> {
    //AccountsBatch must implement the method: System.Iterable<SObject> Database.Batchable<SObject>.start(Database.BatchableContext) (1:14)
    //AccountsBatch must implement the method: void Database.Batchable<SObject>.execute(Database.BatchableContext, List<SObject>) (1:14)
    //AccountsBatch must implement the method: void Database.Batchable<SObject>.finish(Database.BatchableContext) (1:14)

    //start method --> SOQL QUERY -> ACCOUNT -> 50k (min -> 1 max -> 10k)
    public Database.QueryLocator start (Database.BatchableContext bc){
        system.debug('inside start method');
        Database.QueryLocator acc = Database.getQueryLocator([select id, name, active__c, Description from account]);
        return acc;
    }
    
    public void execute(Database.BatchableContext bc, list<account> scope ){
        system.debug('inside execute method');
        //update account records
        for (account eachAcc : scope) {
            eachAcc.Description += '... Updated via batch';
        }
        update scope;
    }

    public void finish(Database.BatchableContext bc){
        system.debug('Finished with all records');
    }
    //execute method (list<account>)

    //finish method
}