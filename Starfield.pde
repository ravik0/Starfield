NormalParticle[] bill;
void setup() {
  size(400,400);
  bill = new NormalParticle [50];
  for (int i = 0; i < bill.length; i++) {
    bill[i] = new NormalParticle();
  }
}
void draw() {
  background(50);
  for (int i = 0; i < bill.length; i++) {
    bill[i].show();
    bill[i].move();
  }
}
class NormalParticle {
  double myX, myY, speedX, speedY, angle;
  color particleColor = color((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256));
  NormalParticle() {
    myX = 200;
    myY = 200;
    angle = Math.random()*(2*Math.PI);
    speedX = Math.random()*5;
    speedY = Math.random()*5;
  }
  void move() {
    myX+=Math.cos(angle)*speedX;
    myY+=Math.sin(angle)*speedY;
  }
  void show() {
    fill(particleColor);
    ellipse((int)myX,(int)myY,5,5);
  }
}
interface Particle {

}
class OddballParticle {

}
class JumboParticle {

}