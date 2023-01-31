public class DatetimeMethodsDemo {
    public void calculateaAgeInMonths(){
        Date birthDate = date.newInstance(1998, 08, 25);
        date todayDate = date.today();

        integer ageInMonths = birthDate.monthsBetween(todayDate);
        system.debug('Seda age in months => ' + ageInMonths);

        Integer ageInDays = birthDate.daysBetween(todayDate);
        system.debug('Seda age in days => ' + ageInDays);
    }

    public void birthDateTimeInMS(){
        Datetime birthDT = Datetime.newInstanceGmt(1998, 08, 25, 8, 30, 0);
        long millisecBirthDT = birthDT.getTime();
        system.debug('birth datetime in millisecond is ' + millisecBirthDT);
    }

    public void printSubscriptionEndDate(){
        date subStartDate = date.today();
        //get endDate if subscription is done for 1000 days
        date subEndDate = subStartDate.addDays(1000);
        system.debug('subs end date is ' + subEndDate);
        
        Integer endYear = subEndDate.year();
        Integer endMonth = subEndDate.month();
        system.debug('end year is ' + endYear);
        system.debug('end month is ' + endMonth);

    }

    public void printOfferEndDateTime(){
        Datetime offerStart = Datetime.now();

        Datetime offerEnd = offerStart.addHours(51);
        system.debug('offer end datetime is ' + offerEnd);

        date offerEndDATE = offerEnd.date();
        system.debug('date of offer end ' + offerEndDATE);
    }
}