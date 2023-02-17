trigger LeadTrigger on Lead (before insert, before update) {
    system.debug('=== trigger starts ===');

    list<lead> listLead = trigger.new;
    if (trigger.isInsert) {
        for (lead eachLeadInsert : listLead) {
            system.debug('New created Lead --> ' + listLead);
        }
    }
    if (trigger.isUpdate) {
        for (lead eachLeadUpdate : listLead) {
            system.debug('Lead record ID is --> ' + eachLeadUpdate.Id + ', Lead Name is --> ' + eachLeadUpdate.Name + ', Lead Description is --> ' + eachLeadUpdate.Description );
        }
    }
    system.debug('=== trigger end ===');
}