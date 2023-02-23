trigger AssetTrigger on Asset (before insert, before update) {
    AssetHandler.Assethandlerupdate(trigger.new, trigger.old,trigger.newmap,trigger.oldmap);
}
//SOLUTION
/*
trigger AssetTrigger on Asset (before insert, before update) {
    if(Trigger.isBefore && Trigger.isInsert){
        AssetHandler.assetHandlerUpdate(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    }
    if(Trigger.isBefore && Trigger.isUpdate){
        AssetHandler.assetHandlerUpdate(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    }
}
*/