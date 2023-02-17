trigger ContactTrigger on Contact (before update, before insert, after update, after insert) {
    if (trigger.isBefore && trigger.isUpdate) {
        //call calidation method here.
        ContactTriggerHandler.contactValidation1(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    }
    
    
    // system.debug('---- trigger start ----');
    // if (trigger.isBefore && trigger.isUpdate) {
    //     system.debug('before update trigger called.');
    // }
    // if (trigger.isAfter && trigger.isUpdate) {
    //     system.debug('after update trigger called.');
    // }
    // system.debug('----- trigger end ----');
}