PVector posSun, posMars, vel, acc;
float radius,diam;
float G = 0.04;
float M = 500000;

void setup() {
  background(0);
  size (1000,700);
  
  radius = 15;
  diam = 2*radius;
  
  posSun = new PVector(width/2,height/2);
  posMars = new PVector (posSun.x-200,height/2);
  vel = new PVector(3,5);
}

void draw() {
  fill(255,255,0);
  circle(posSun.x,posSun.y, 200);
  
  fill(255, 0 ,0 );
  circle(posMars.x,posMars.y, 40);
  
  fill (255,0,0);
  
  posMars.add(vel);
  
  PVector r = new PVector (posMars.x - posSun.x, posMars.y-posSun.y);
  PVector rHat = r.normalize(null); //making a unit vector in the direction of r
  float accMag = -G*M/pow(r.mag(),2); //Newton's gravitational formula
  acc = PVector.mult(rHat, accMag);
  
  vel.add(acc);
  
}
