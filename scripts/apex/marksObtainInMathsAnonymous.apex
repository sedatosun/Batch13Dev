Map<string, integer> marksObtainInMaths = new Map<String,Integer>();

marksObtainInMaths.put('0111CE112', 40);
marksObtainInMaths.put('0111CE102' , 19);
marksObtainInMaths.put('0111CE100' , 33);
marksObtainInMaths.put('0111CE098' , 40);

Set<string> uniqueRollNumberSet   = marksObtainInMaths.keySet();
system.debug('All Student Roll Numbers --> ' + uniqueRollNumberSet);

List<Integer> marksObtainList  = marksObtainInMaths.values();
system.debug('All Marks Obtain --> ' + marksObtainList);

for (string eachKey: uniqueRollNumberSet){
    string rollNumber = 'Roll numbers are ' + eachKEy;

    rollNumber += ' and the mark is ' + marksObtainInMaths.get(eachKey);
    system.debug(rollNumber);
    if(marksObtainInMaths.get(eachKey) < 20) {
        system.debug(eachKey + ' is not qualified for next class');
    }
}