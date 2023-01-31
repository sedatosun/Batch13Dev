List<integer> listInteger = new List<integer>();
listInteger.add(10);//0
listInteger.add(15);//1
listInteger.add(21);//2
listInteger.add(15);//3
listInteger.add(15);//4
integer sumofList = ListDemo.add(listInteger);
system.debug('sum of list is ' + sumofList);

ListDemo.iterateListInteger();
ListDemo.allCats();
string c2 = ListDemo.candidatesList(2);
system.debug('c2 ==> ' + c2);
string c5 = ListDemo.candidatesList(5);
system.debug('c5 ==> ' + c5);

ListDemo.candidatesList();
ListDemo.randomInteger();