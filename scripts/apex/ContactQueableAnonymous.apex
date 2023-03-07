List<account> listAcc = [select id, name, Active__c, Number_of_contacts__c
from account where Active__c  = 'Yes' order by createddate desc];
ContactQueableapex con = new ContactQueableapex(listAcc);
id conId = system.enqueueJob(con);