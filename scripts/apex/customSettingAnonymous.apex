map<string , country_code__c> mapCountryCode = country_code__c.getAll();
system.debug(mapCountryCode);

//print 'Country Name is United States it code is USA'

for (String eachName : mapCountryCode.keySet()) {
    country_code__c c = mapCountryCode.get(eachName);
    system.debug('Country name is ' + eachName + ' its code is ' + c.code__c);
}

Country_code__c c1 = Country_code__c.getInstance('India');
system.debug('c1 code is ' + c1.code__c);
