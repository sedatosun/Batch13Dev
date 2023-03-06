public class AccountHelper {
    @future
    public static void countContactsOnAccount(Set<Id> accountIds) {
        List<Account> accList = [SELECT Id, Name, (Select Id from 
Contacts) FROM Account where Id in :accountIds];
        for(Account acc : accList){
            acc.Number_of_contacts__c = acc.Contacts.size();
        }
        update accList;
    }
}