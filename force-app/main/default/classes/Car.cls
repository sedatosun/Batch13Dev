public class Car {
    
    //class variable
    //public means --> accessible outside of the class
    public string carcolor = '';
    public string carName;

    //private variable --> accessible ONLY inside of the class
    private integer maxSpeed = 140;

    public void switchOn(){
        system.debug('starting the car nowww.');
        }

    public void drive(){
        system.debug('driving ' + carName);
    }

    public void driveAtMacSpeed (){
        string description = 'driving ' + carName
+ ' of color ' + carcolor + ' at ' + maxSpeed + ' km/hr';
system.debug(description);
    }
}