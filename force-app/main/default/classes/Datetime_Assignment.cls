public class Datetime_Assignment {
    public void diffofDate(){
        Date varTomorrowDate = Date.newInstance(2022, 01, 13);
        Date varTodaysDate = Date.newInstance(2022, 01, 12);
        Integer numberofdays = varTodaysDate.daysBetween(varTomorrowDate);
        system.debug('There is/are ' + numberofdays + ' day(s) between ' + varTodaysDate + ' and ' +varTomorrowDate );
    }

    public void Timecheck(){
        //Tommorrow date time and 10 days later from tomorrow
        Datetime varTomorrowDatetime = Datetime.newInstance(2022, 01, 13, 2, 0, 0);
        system.debug('Tomorrows date is ' + varTomorrowDatetime);

        Datetime var10DaysDatetime = Datetime.newInstanceGmt(2022, 01, 23, 9, 0, 0);
        system.debug('10 days after tomorrows date is ' + var10DaysDatetime);

        long varDatetimeLong = 12339874361L;
        Datetime dt1 = Datetime.newInstance(varDatetimeLong);
        system.debug('12339874361L milliseconds after from 1 Jan 1970 = ' + dt1);

        //Add 7 days to tomorrow date time
        Datetime newDateTime = varTomorrowDatetime.date().addDays(7);
        Integer days = 7;
        system.debug('When add ' + days + ' days to ' + varTomorrowDatetime + ' new date becomes: ' + newDateTime);
        

        //Add 10 days to 10 days later's date time
        Datetime newDateTime2 = var10DaysDatetime.date().addDays(10);
        Integer days2 = 10;
        system.debug('When add ' + days2 + ' days to ' + var10DaysDatetime + ' new date becomes: ' + newDateTime2);
    }
}