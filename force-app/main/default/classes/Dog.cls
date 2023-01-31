public  class Dog {
    public string name;
    public string color;
    public integer age;
    public static integer count = 0;

    public Dog(){
        system.debug('---New Dog---');
        count++;
        age = 1;
        checkAge();
        showDogCount();
    }
    public Dog(string name1, string color1, integer age1){
        name = name1;
        color = color1;
        age = 1;
        count++;
        age = age1;
        checkAge();
        showDogCount();
    }

    public void checkAge(){
        if (age > 0 && age <= 1) {
            system.debug('Puppy Dog');
        } else if (age > 1 && age <= 3) {
            system.debug('Young Dog');
        } else if (age > 3 && age <= 5) {
            system.debug('Adult Dog');
        } else if (age > 5) {
            system.debug('Old Dog');
        }
    }

    public static void showDogCount(){
        system.debug('Total number of dogs created: ' + count);
    }
}