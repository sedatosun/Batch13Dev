public with sharing class SOQL_Assignment {
    public static void soql_WhereClause(){
        list<contact> lstcontact = [select name from contact where name like 'A%'];
        system.debug('All contact list starts with A ==> ' + lstcontact);
        system.debug('Size of the contact list is ' + lstcontact.size());
    }
    public static void soql_FromMethod(){
        list<contact> lstcontact = [select lastName, phone from contact];
        system.debug('All contact list include last name and phone number ==> ' + lstcontact);
        for (contact eachContacts : lstcontact) {
            string lastnames = eachContacts.lastName;
            string phonenumbers = eachContacts.phone;
            system.debug('Each contact records last names ==> ' + lastnames);
            system.debug('Each contact records phone numbers ==> ' + phonenumbers);
        }
    }
}   