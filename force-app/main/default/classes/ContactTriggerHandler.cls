public class ContactTriggerHandler {
    public static void contactValidation1(List<contact> conTriggerNew, 
                                        list<contact> conTriggerOld,
                                        map<id, contact> conTriggerNewMap,
                                        map<id, contact> conTriggerOldMap) {
        //validate if contact's lead source WAS Partner Referral
        for (contact eachContact : conTriggerNew) {
            if (conTriggerOldMap.get(eachContact.Id).LeadSource == 'Partner Referral') {
                eachContact.addError('Partner Referral contacts cannot be changed.');
            }
        }
    }
}