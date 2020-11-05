Particle[] dots = new Particle[500];
void setup()
{
  background(0);
  size(500, 500);
  for (int i = 0; i < dots.length; i++) {
    dots[i] = new Particle();
    dots[0] = new OddballParticle();
  }
}
void draw()
{
  for (int i = 0; i < dots.length; i++) {
    dots[i].move();
    dots[i].show();
  }
}
class Particle
{
  double myX, myY, speed, angle;
  int myColor;
  float distance, distanceChange;
  Particle()
  {
    myX = 250.0;
    myY = 250.0;
    speed = Math.random()*10.0;
    angle = Math.random()*2.0*Math.PI;
    myColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
  }
  void move() {
    myX = myX + Math.cos(angle)*speed;
    myY = myY + Math.sin(angle)*speed;
  }
  void show() {
    noStroke();
    fill(myColor);
    ellipse((float)myX, (float)myY, 2, 2);
  }
}

class OddballParticle extends Particle
{
  OddballParticle() {
    myX = 250.0;
    myY = 250.0;
    angle = 0.0;
    distance = 0.01;
    distanceChange = 0.1;
  }
  void show() {
    fill(255, 255, 255);
    ellipse((float)myX, (float)myY, 5, 5);
  }
  void move() {

    if ( angle < 36000) {

      myX = width/2 + Math.cos(angle)*distance;
      myY = height/2 + Math.sin(angle)*distance;

      distance =  distance + distanceChange;
      angle += 0.1;
    }
  }
}
