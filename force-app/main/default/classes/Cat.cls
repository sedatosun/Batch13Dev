public  class Cat {
    public string name;
    public string color;
    //constractor name is same as class name
    //it does'nt return anything.
        //we use constractor if we want to execute
        //some apex code as soon as new instance is created.
    public Cat(){
        system.debug('cat consstractor called.');
    }
    //we can have multiple constractors.
    //provide number of params, or datatype pf params are different.
    public Cat(String n, String clr){
        name = n;
        color = clr;
        sleeping();
    }

    public void sleeping(){
        system.debug(name + ' is sleeping, dnd.');
    }
}