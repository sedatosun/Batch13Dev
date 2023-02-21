trigger AssetTrigger on Asset (before insert, before update) {
    AssetHandler.Assethandlerupdate(trigger.new, trigger.old,trigger.newmap,trigger.oldmap);
}