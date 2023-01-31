public class ListDemo {
    public static string candidatesList(integer i){
        //List
            //datatype
        list<string> listCandidates = new list<string>();
        //we can add ONLY string to the above list.
            //note:we CANNOT addinteger, boolean, date or any other datatype.
        listCandidates.add('Marc');
        listCandidates.add('Elon');
        listCandidates.add('Bill');
        listCandidates.add('Marc');
        system.debug('candidates list is ' + listCandidates);

        string candidate = '';
        if (i>= 0 && i < listCandidates.size()) {
            candidate = listCandidates[i];
        } else {
            candidate = 'No such candidate found. Try again.';
        }
        return candidate;
    }
    public static void randomInteger(){
        List<integer> listInteger = new List<integer>();
        listInteger.add(10);//0
        listInteger.add(15);//1
        listInteger.add(21);//2
        listInteger.add(15);//3
        listInteger.add(15);//4
        system.debug('list of random integer is '  +listInteger);

        //get the value at index 3
        integer index3value = listInteger.get(3);
        //OR
        integer index3value2 = listInteger[3];

        system.debug('value at index 3 ' + index3value);
        system.debug('value at index 3, again ' + index3value2);
    }
    public static void allCats(){

        cat c2 = new cat('fluffykins', 'white');
        cat c1 = new cat('tekir', 'black');

        List<cat> cats = new List<cat>();
        //how to add elements of cat class?
            //we can add instance pf cat class in lis<cat>
        cats.add(c1);
        cats.add(c2);
        system.debug('all cats ' + cats);
        if (!cats.isEmpty()) {
            system.debug(cats[0]);
        }
    }
    public static void iterateListInteger(){
        List<integer> listInteger = new List<integer>();
        listInteger.add(10);
        listInteger.add(15);
        listInteger.add(21);
        listInteger.add(15);
        listInteger.add(15);

        for(integer eachInteger : listInteger)
        system.debug(eachInteger);
    }
    public static integer add(List<integer> listInt){
        //a temporary variable to store sum of each integer in the list 
        integer sum = 0;

        for (integer eachInt : listInt) {
            sum += eachInt;
        }
        return sum;
    }
}