public class SetDemo {
    public static void citySet(){
        set<string> cities = new set<string>();
        cities.add('Tokyo');
        cities.add('Nairobi');
        cities.add('Tokyo');
        cities.add('Lisbon');
        cities.add('Berlin');
        cities.add('Tokyo');
        cities.add('Nairobi');
        cities.add('BERLIN');

        system.debug('set of cities ' + cities);
    }
    public static void randomIntegerSet(){
        set<integer> integerSet = new set<integer>();
        integerSet.add(10);
        integerSet.add(15);
        integerSet.add(21);
        integerSet.add(15);
        integerSet.add(15);

        system.debug('set of integers ' + integerSet);
    }
    //create a method, which accepts a list<integer> and it returns set<integer>
    //if our list has duplicate elements it will be removed.
    public static set<integer> setFromList(List<integer> listInt){
        //create mew empty set.
        Set<integer> returnSet = new set<integer>();
        //add all the elements of a list using .addAll(list_or_set) method.
        returnSet.addAll(listInt);
        //return the newly created set.
        return returnSet;
    }

    //we are creating a method.
        //which accepts set<string>.
        //return
            //set<string> by converting each element of the gşven set to UPPERCASE.
    public static set<string> uppercaseSet(set<string> setStr) {
        //create a temp set in which we will add uppercase elements
        set<string> upperSet = new set<string>();
        system.debug('setStr ==> ' + setStr);
        
        //for each loop on setStr(passed in parameter)
        for (string eachStr : setStr){
            system.debug('each str is ' + eachStr);
            string tempStr = eachStr.toUpperCase();
            upperSet.add(tempStr);
        }
        return upperSet;

    }
}