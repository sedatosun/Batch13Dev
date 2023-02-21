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