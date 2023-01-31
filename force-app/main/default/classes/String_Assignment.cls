public class String_Assignment {
    public void stringAssignment(){
        String Localstring = 'Thanks for the session on the string';
        system.debug(Localstring);

        Integer lengthofstring = Localstring.length();
        system.debug('Length of Local String is ' + lengthofstring);

        String uppercaseofstring = Localstring.toUpperCase();
        system.debug('Local String in UPPER CASE: ' + uppercaseofstring);

        Boolean containsSession = Localstring.contains('session');
        system.debug('Is local String contains session?? ' + containsSession);

        Boolean containsSessions = Localstring.contains('sessions');
        system.debug('Is local String contains sessions?? ' + containsSessions);

        Boolean containsSessions2 = Localstring.contains('SESSION');
        system.debug('Is local String contains SESSION?? ' + containsSessions2);
    }
}