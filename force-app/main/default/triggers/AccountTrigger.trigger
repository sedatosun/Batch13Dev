/*trigger AccountTrigger on Account (after insert) {
    */

trigger AccountTrigger on Account (before insert, before update, after insert, after update) {
    system.debug('----trigger start----');
    if (trigger.isBefore) {
        AccountTriggerHandler.updateDescription(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    }
    if (trigger.isAfter && trigger.isUpdate) {
        //call VIP update method.
        AccountTriggerHandler.updateVIPForAllContact(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
        }
    }


    /*
    map<id, account> trgNewMap = trigger.newMap;//key = ID, value = record
    map<id, account> trgOldMap = trigger.oldMap;

    if (trigger.isBefore && trigger.isUpdate) {
        //set<id> accIds = trgNewMap.keySet();
        for (Id eachID : trgNewMap.keySet()) {
            //get NEW account using map.get(key) from trigger.newMap
            account newAcc = trgNewMap.get(eachId);
            //get OLD account using map.get(key) from trigger.newMap

            account oldAcc = trgOldMap.get(eachId);

            //get new account using map.get(key) from trigger.newMap
            string newWebsite = newAcc.Website;
            system.debug('newWebsite is ---> ' + newWebsite);
            // string oldWebsite = oldAcc.Website;
            // system.debug('oldwebsite is ---> ' + oldWebsite);
            //check if website field is changed.
            if (newWebsite != oldWebsite) {
                system.debug('For account ' + newAcc.Name + ', new WEBSITE is ' + newWebsite);
            }
        }
    }
*/
    // if (trigger.isAfter && trigger.isUpdate) {
    //     system.debug('==AFTER UPDATE==');
    //     Set<Id> accIds = trgNewMap.keySet();
    //     Set<Id> accIdsOld = trgOldMap.keySet();

    //     for (Id eachID : accIds) {
    //         system.debug('--for each START--');
    //         system.debug('each Id is ' + eachID);
    //         account newAcc = trgNewMap.get(eachID);
    //         account oldAcc = trgOldMap.get(eachID);
    //         system.debug('new acc name is ' + newAcc.Name + ', its old name was ' + oldAcc.Name);
    //         system.debug('--for each END--');
    //     }

        // list<account> newAccounts = trigger.new;
        // for (account acc : newAccounts) {
        //     account newaAcc = acc;
        //     account oldAcc = trgOldMap.get(acc.Id);
        // }
    //}

    /*
    if (trigger.isBefore && trigger.isInsert) {
        system.debug('==BEFORE INSERT==');
        system.debug('trigger.newMap --> ' + trgNewMap);//null -> ID is null, so Map<id, account> id ALSO NULL.
        system.debug('trigger.oldMap --> ' + trgOldMap);//NULL --> OLD is null.
    }
    if (trigger.isAfter && trigger.isInsert) {
        system.debug('==AFTER INSERT==');
        system.debug('trigger.newMap --> ' + trgNewMap);//yes (not NULL)
        system.debug('trigger.oldMap --> ' + trgOldMap);//null --> no old record so oldmap is null.
    }
    if (trigger.isBefore && trigger.isUpdate) {
        system.debug('==BEFORE UPDATE==');
        system.debug('trigger.newMap --> ' + trgNewMap);//yes
        system.debug('trigger.oldMap --> ' + trgOldMap);//yes
    }
    if (trigger.isAfter && trigger.isUpdate) {
        system.debug('==AFTER UPDATE==');
        system.debug('trigger.newMap --> ' + trgNewMap);//yes
        system.debug('trigger.oldMap --> ' + trgOldMap);//yes
    }
    */
    /*
    if (trigger.isAfter && trigger.isUpdate) {
        for (account oldAcc : trigger.old) {
            system.debug('oldAcc.id is ' + oldAcc.Id + ', new accName is ' + oldAcc.Name);
        }
        for (account newAcc : trigger.new) {
            system.debug('newacc.id is ' + newAcc.Id + ', new accName is ' + newAcc.Name);
        }
    }
    system.debug('=== trigger end ===');
    */
/*
    if (trigger.isBefore && trigger.isInsert) {
        //old is null in insert
        system.debug('trigger.old before insert ---> ' + trigger.old);
    }

    if (trigger.isAfter && trigger.isInsert) {
        //old is null in insert
        system.debug('trigger.old after insert ---> ' + trigger.old);
    }

    if (trigger.isBefore && trigger.isUpdate) {
        system.debug('trigger.old before update ---> ' + trigger.old);
    }

    if (trigger.isAfter && trigger.isUpdate) {
        system.debug('trigger.old after update ---> ' + trigger.old);
    }
    */

/*
    if (trigger.isBefore && trigger.isInsert) {
        system.debug('trigger.new before insert ---> ' + trigger.new);
    }

    if (trigger.isAfter && trigger.isInsert) {
        system.debug('trigger.new after insert ---> ' + trigger.new);
    }

    if (trigger.isBefore && trigger.isUpdate) {
        system.debug('trigger.new before update ---> ' + trigger.new);
    }

    if (trigger.isAfter && trigger.isUpdate) {
        system.debug('trigger.new after update ---> ' + trigger.new);
    }
    */
/*
    //isAfter will be true in 'after insert' and 'after update' trigger
    list<account> newAccounts = trigger.new;
    if (trigger.isAfter && trigger.isInsert) {
        //trigger.new we get latest inserted/updated records
        system.debug('After trigger, new data --> ' + newAccounts);
        system.debug('number of records inserted/updated: ' + newAccounts.size());

        for (account eachAccount : newAccounts) {
            system.debug('*** account id is ' + eachAccount.Id + ' account name is ' + eachAccount.Name);
        }
    }
    system.debug('=== trigger end ===');

    if(Trigger.isBefore){
        system.debug('we are in BEFORE trigger.');
        if(Trigger.isInsert){
            system.debug('before insert trigger called.');
        } 
        if(trigger.isUpdate){
            system.debug('before update trigger called.');
        }
    }
    if(Trigger.isAfter){
        system.debug('we are in AFTER trigger. SBNC');
        if(Trigger.isInsert){
            system.debug('after insert trigger called.');
        } 
        if(trigger.isUpdate){
            system.debug('after update trigger called.');
        }
    }

    
    if (trigger.isBefore && trigger.isInsert) {
        system.debug('before insert  trigger called.');
    }
    if (trigger.isAfter && trigger.isInsert) {
        system.debug('after insert  trigger called.');
    }
    if (trigger.isBefore && trigger.isUpdate) {
        system.debug('before insert  trigger called.');
    }
    if (trigger.isAfter && trigger.isUpdate) {
        system.debug('after insert  trigger called.');
    }
    system.debug('=== trigger end ===');


    system.debug('---------');
    system.debug('.isBefore --> ' + trigger.isBefore);
    system.debug('isAfter --> ' + trigger.isAfter);
    system.debug('-------');

    if (Trigger.isAfter) {
        system.debug('after insert  trigger called.');
    }
    if (Trigger.isBefore) {
        system.debug('before insert  trigger called.');
    }
    system.debug('*** trigger end ***');
    */