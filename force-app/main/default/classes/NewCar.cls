public class NewCar {
    public integer currentSpeed = 0;
    public string carType;
    public string carName;

    public void startCar(string carType, string carName){
        system.debug('My car type is ' + carType + ' and its name is ' + carName);
    }

    public void accelerate(integer x){
        currentSpeed = currentSpeed + x;
        system.debug('The speed is ' + currentSpeed);

    }

    public void brake(integer y){
        currentSpeed = currentSpeed - y;
        system.debug('The speed is ' + currentSpeed);
    }

    public void stopCar(){
        currentSpeed = 0;
        system.debug('The car is stopped and the speed is ' + currentSpeed);
    }

    public String checkSpeed(integer speed){
        string mode = '';
        if (speed > 0 && speed <= 30) {
            mode = 'City Mode';
        } else if (speed > 31 && speed <= 60) {
            mode = 'Economy Mode';
        } else if  (speed > 60) {
            mode = 'Sports Mode'; 
        } else if (speed < 0) {
            mode = 'Invalid speed';
        }
    return mode;
    }
}