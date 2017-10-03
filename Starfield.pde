Particle[] bill;
void setup() {
  size(400,400);
  bill = new Particle[100];
  for (int i = 0; i < bill.length; i++) {
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
void mousePressed() {
  for (int i = 0; i < bill.length; i++) {
    bill[i].speedIncrease();
  }
}
void keyPressed() {
  if (keyCode == SHIFT) {
    for (int i = 0; i < bill.length; i++) {
      bill[i].speedDecrease();
    }
  }
  else if (keyCode == ENTER) {
    for (int i = 0; i < bill.length; i++) {
      bill[i].reset();
    }
  }
}
class NormalParticle implements Particle {
  double myX, myY, speed, angle;
  double size = 5;
  color particleColor = color((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256));
  NormalParticle() {
    myX = 200;
    myY = 200;
    angle = Math.random()*(2*Math.PI);
    speed = Math.random()*5;
  }
  public void move() {
    myX+=Math.cos(angle)*speed;
    myY+=Math.sin(angle)*speed;
    if (myX >= 400 || myY >= 400 || myX <= 0 || myY <= 0) {
      speed = -speed;
    }
  }
  public void speedIncrease() {
    if (speed < 0) {
      speed-=1;
    }
    if (speed >= 0) {
      speed+=1;
    }
  }
  public void speedDecrease() {
    if (speed < 0) {
      speed+=1;
    }
    if (speed >= 0) {
      speed-=1;
    }
  }
  public void reset() {
    myX = 200;
    myY = 200;
    angle = Math.random()*(2*Math.PI);
    speed = Math.random()*5;
  }
  public void show() {
    fill(particleColor);
    ellipse((int)myX,(int)myY,(float)size,(float)size);
  }
}
interface Particle {
  public void move();
  public void show();
  public void speedIncrease();
  public void speedDecrease();
  public void reset();
}
class OddballParticle implements Particle{
  double myX, myY, speed, angle;
  color particleColor = color((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256));
  OddballParticle() {
    myX = 300;
    myY = 200;
    angle = Math.random()*(2*Math.PI);
    speed = Math.random()*10+5;
  }
  public void move() {
    myX+=Math.cos(angle)*speed;
    myY+=Math.sin(angle)*speed;
    if (myX >= 400) {
      myX=Math.random()*401;
      angle = Math.random()*(2*Math.PI);
    }
    else if (myX <= 0) {
      myX=Math.random()*401;
      angle = Math.random()*(2*Math.PI);
    }
    else if (myY >= 400) {
      myY=Math.random()*401;
      angle = Math.random()*(2*Math.PI);
    }
    else if (myY <= 0) {
      myY=Math.random()*401;
      angle = Math.random()*(2*Math.PI);
    }
  }
  public void speedIncrease() {
    if (speed < 0) {
      speed-=1;
    }
    if (speed >= 0) {
      speed+=1;
    }
  }
  public void speedDecrease() {
    if (speed < 0) {
      speed+=1;
    }
    if (speed >= 0) {
      speed-=1;
    }
  }
  public void reset() {
    myX = 300;
    myY = 200;
    angle = Math.random()*(2*Math.PI);
    speed = Math.random()*5;
  }
  public void show() {
    fill(particleColor);
    rect((int)myX,(int)myY,10,15);
  }
}
class JumboParticle extends NormalParticle {
  public void show() {
    fill(particleColor);
    ellipse((int)myX,(int)myY,50,50);
    fill(1/particleColor);
    ellipse((int)myX-10,(int)myY-10,5,5);
    ellipse((int)myX+10,(int)myY-10,5,5);
    noFill();
    arc((int)myX-10,(int)myY,20,10,-PI,0);
  }
}