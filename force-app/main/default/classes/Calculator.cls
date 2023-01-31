public class Calculator {
    //by default it is Private.

    public void welcomeMessage(){
        system.debug('welcome to apex calc, updated');
    }

    public void printNewMessage (string msg){
        system.debug(msg);
    }

    void privatePrintMessage(string msg){
        system.debug('inside private method NOW');
        system.debug(msg);
        system.debug('done with private');
    }

    public string printAndReturnMessage(String m){
        system.debug('calling private ryan');
        privatePrintMessage(m);
        system.debug('called private ryan');
        string returnStr = '';
        returnStr = m + '...ok cool';
        return returnStr;
    }

    public integer add(integer a, integer b){
        integer sum = a + b;
        return sum;
    }

    public integer add(integer x, integer y, integer z){
        integer sum = x+y+z;
        return sum;
    }

    public boolean leapYearCheck(date dt){
        //using date we get year component
        integer year = dt.year();
        //using year, we can check leap year using isLeapYear method
        boolean lp = date.isLeapYear(year);
        return lp;
    }
}