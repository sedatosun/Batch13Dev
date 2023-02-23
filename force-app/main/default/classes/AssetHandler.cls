public class AssetHandler {
    public static void Assethandlerupdate (list<asset> assetTriggerNew, List<asset> assetTriggerOld, Map<id, asset> assetTriggerNewMap, Map<id, asset> assetTriggerOldMap ) {
        for (asset eachAsset : assetTriggerNew) {
            Boolean updateDesc = false;
            if (trigger.isInsert && eachAsset.Status == 'Shipped') {
                eachAsset.Description ='Asset is Shipped';
                updateDesc = true;
            }
            if (trigger.isInsert && eachAsset.Status == 'Installed') {
                eachAsset.Description ='Asset is Installed';
                updateDesc = true;
            }
            if (trigger.isUpdate) {
                string newStatus = eachAsset.Status;

                asset oldAsset = assetTriggerOldMap.get(eachAsset.Id);

                if (newStatus != oldAsset.Status && newStatus == 'Shipped') {
                    eachAsset.Description ='Asset is Shipped';
                    updateDesc = true;
                } if (newStatus != oldAsset.Status && newStatus == 'Installed') {
                    eachAsset.Description ='Asset is Installed';
                    updateDesc = true;
                } else {
                    updateDesc = false;
                }
            }
        }
    }
}
//SOLUTION
/* 
public class AssetHandler {
    public static void assetHandlerUpdate(List<Asset> assetTriggerNew, List<Asset> assetTriggerOld, Map<id, Asset> assetTriggerNewMap, Map<id, Asset> assetTriggerOldMap) {
        if(assetTriggerNewMap != null){
            //For update as for update Trigger.newMap is available
            Set<id> assetIdSet = assetTriggerNewMap.keySet();
            for(Id assetId : assetIdSet){
                if(assetTriggerNewMap.get(assetId).Status != assetTriggerOldMap.get(assetId).Status && assetTriggerNewMap.get(assetId).Status == 'Shipped'){
                    assetTriggerNewMap.get(assetId).Description = 'Asset is shipped';
                }
                if(assetTriggerNewMap.get(assetId).Status != assetTriggerOldMap.get(assetId).Status && assetTriggerNewMap.get(assetId).Status == 'Installed'){
                    assetTriggerNewMap.get(assetId).Description = 'Asset is Installed';
                }
            }
        } else {
            //For insert
            for(Asset eachAsset : assetTriggerNew){
                if (eachAsset.Status == 'Shipped') {
                    eachAsset.Description = 'Asset is shipped';
                }else if(eachAsset.Status == 'Installed'){
                    eachAsset.Description = 'Asset is Installed';
                }
            }
        }
    }
}
*/