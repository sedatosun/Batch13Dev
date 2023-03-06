public class ContactsBatch implements Database.Batchable<SObject>, Database.stateful {
    integer recordCount = 0;

    //start method
    public Database.QueryLocator start(Database.BatchableContext bc){
        system.debug('inside start method');
        Database.QueryLocator con = Database.getQueryLocator([select id, lastName, description from Contact]);
        return con;
    }

    //execute method
    public void execute(Database.BatchableContext bc, list<contact> scopeCon) {
        system.debug('inside execute method');
        system.debug('check recordCount FIRST: ' + recordCount);

        //update contact record
        list<contact> updateCon = new list<contact>();
        for (contact eachCon : scopeCon) {
            eachCon.Description = 'Updated by Batch';
            updateCon.add(eachCon);
        }
        if (!updateCon.isEmpty()) {
            update scopeCon;
            recordCount += updateCon.size();
            system.debug('check recordCount SECOND: ' + recordCount);
        }
    }

    //finish method
    public void finish(Database.BatchableContext bc) {
        system.debug('batch over');
        system.debug('check recordCount FINAL: ' + recordCount);
    }
}