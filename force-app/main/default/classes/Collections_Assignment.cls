public class Collections_Assignment {
    public static void listMethods(){
        list<string> LstDays = new list<string>{'Monday', 'Tuesday', 'Wednesay', 'Thursday', 'Friday', 'Saturday', 'Sunday'};
        system.debug('Days of the week ==> ' + LstDays);
        system.debug('How many days are listed? ' + LstDays.size());

        LstDays.add('Monday Syndrome');
        system.debug('Added day at the end of the list ==> ' + LstDays);
        system.debug('How many days are listed, now? ' + LstDays.size());

        LstDays.clear();
        system.debug('Clear all days ' + LstDays);
        system.debug('How many days are listed, now? ' + LstDays.size());

        LstDays.add('Monday');
        LstDays.add('Tuesday');
        LstDays.add('Wednesday');
        LstDays.add('Thursday');
        LstDays.add('Friday');
        LstDays.add('Saturday');
        LstDays.add('Sunday');
        system.debug('Days of the week ==> ' + LstDays);

        for (string alldays : LstDays) {
            system.debug('Make all week days UPPERCASE ==> ' + alldays.toUpperCase());
        }

        for (string alldays2 : LstDays) {
            system.debug('Make all week days lowercase ==> ' + alldays2.toLowerCase());
        }

        system.debug('Does the list contain Friday? ' + LstDays.contains('Friday'));
        if (LstDays.contains('Friday')) {
            system.debug('T.G.I.F!');
        } else {
            system.debug('Lets finish the week after Thursday');
        }


    }
    public static void setMethods(){
        set<string> setDays = new set<string>();
        setDays.add('Monday');
        setDays.add('Tuesday');
        setDays.add('Wednesday');
        setDays.add('Thursday');
        setDays.add('Friday');
        setDays.add('Saturday');
        setDays.add('Sunday');
        system.debug('Days of the week ==> ' + setDays);

        setDays.add('Monday Syndrome');
        system.debug('Added day at the end of the list ==> ' + setDays);
        system.debug('How many days are listed, now? ' + setDays.size());

        setDays.remove('Monday Syndrome');
        system.debug('Remove non-day string ==> ' +setDays);

        for (string alldays : setDays) {
            system.debug('Make all week days UPPERCASE ==> ' + alldays.toUpperCase());
        }

        for (string alldays2 : setDays) {
            system.debug('Make all week days lowercase ==> ' + alldays2.toLowerCase());
        }

        system.debug('Does the list contain Friday? ' + setDays.contains('Friday'));
        if (setDays.contains('Friday')) {
            system.debug('T.G.I.F!');
        } else {
            system.debug('Lets finish the week after Thursday');
        }

    }
}