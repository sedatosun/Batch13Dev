/*
One more concept to learn here -
When working with SOQL queries, maps can be populated from the results 
returned by the SOQL query.
The map key must be declared with an ID or String data type, and the 
map value must be declared as an sObject data type.
*/
//Here I am updating Number_of_contacts__c of All accounts present in 
my org.
// Populate map from SOQL query
Map<Id, Account> accountMap = new Map<Id, Account>([SELECT Id, Name 
FROM Account]);
Set<Id> accountIds = accountMap.keySet();
AccountHelper.countContactsOnAccount(accountIds);
/*
*
Same thing can be achieved from below code as well
List<Account> accList = [SELECT Id, Name FROM Account];
Set<Id> accountIds = new Set<Id>();
for(Account acc : accList){
    accountIds.add(acc.Id);
}
AccountHelper.countContactsOnAccount(accountIds);
*
*