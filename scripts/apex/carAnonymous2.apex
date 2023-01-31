car bm = new car();
bm.carcolor = 'black';
bm.switchOn();
system.debug('bm ---> ' + bm);
system.debug('bm car color is  ---> ' + bm.carcolor);

car lm = new car();
lm.carcolor = 'red';
lm.switchOn();
//systen.debug('lm max speed is ' + lm.maxSpeed);

car vw = new car();
vw.carcolor = 'white';
vw.carName = 'Polo';
vw.switchOn();
vw.drive();
vw.driveAtMacSpeed();