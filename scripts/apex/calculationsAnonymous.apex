NewCar nc = new NewCar();
nc.carType = 'SUV';
nc.carName = 'RAV4';
nc.startCar('SUV', 'RAV4');

nc.Accelerate(80);
String cs0 = nc.checkSpeed(80);
system.debug('The speed mode is ' + cs0);

nc.brake(55);
string cs6 = nc.checkSpeed(25);
system.debug('The speed mode is ' + cs6);

nc.accelerate(10);
string cs7 = nc.checkSpeed(35);
system.debug('The speed mode is ' + cs7);

nc.brake(40);
string cs8 = nc.checkSpeed(-5);
system.debug('The speed mode is ' + cs8);

nc.stopCar();