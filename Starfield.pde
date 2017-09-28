Particle[] bill;
void setup() {
  size(400,400);
  bill = new Particle[50];
  for (int i = 2; i < bill.length; i++) {
    bill[0] = new OddballParticle();
    bill[1] = new JumboParticle();
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
class NormalParticle implements Particle {
  double myX, myY, speedX, speedY, angle;
  color particleColor = color((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256));
  NormalParticle() {
    myX = 200;
    myY = 200;
    angle = Math.random()*(2*Math.PI);
    speedX = Math.random()*5;
    speedY = Math.random()*5;
  }
  public void move() {
    myX+=Math.cos(angle)*speedX;
    myY+=Math.sin(angle)*speedY;
  }
  public void show() {
    fill(particleColor);
    ellipse((int)myX,(int)myY,5,5);
  }
}
interface Particle {
  public void move();
  public void show();
}
class OddballParticle implements Particle{
  double myX, myY, speedX, speedY, angle;
  color particleColor = color((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256));
  OddballParticle() {
    myX = 300;
    myY = 200;
    angle = Math.random()*(2*Math.PI);
    speedX = Math.random()*5;
    speedY = Math.random()*5;
  }
  public void move() {
      myX+=Math.cos(angle)*speedX;
      myY+=Math.sin(angle)*speedY;
    if (myX >= 400) {
      myX=Math.random()*401;
      angle = Math.random()*(2*Math.PI);
      speedX = Math.random()*5;
      speedY = Math.random()*5;
    }
    else if (myX <= 0) {
      myX=Math.random()*401;
      angle = Math.random()*(2*Math.PI);
      speedX = Math.random()*5;
      speedY = Math.random()*5;
    }
    else if (myY >= 400) {
      myY=Math.random()*401;
      angle = Math.random()*(2*Math.PI);
      speedX = Math.random()*5;
      speedY = Math.random()*5;
    }
    else if (myY <= 0) {
      myY=Math.random()*401;
      angle = Math.random()*(2*Math.PI);
      speedX = Math.random()*5;
      speedY = Math.random()*5;
    }
  }
  public void show() {
    fill(particleColor);
    rect((int)myX,(int)myY,10,15);
  }
}
class JumboParticle extends OddballParticle {
  public void show() {
    fill(particleColor);
    ellipse((int)myX,(int)myY,50,50);
  }
}