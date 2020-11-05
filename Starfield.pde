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
  double myX, myY, mySpeed, myAngle;
  int myColor;
  float distance, distanceChange;
  Particle()
  {
    myX = 250.0;
    myY = 250.0;
    mySpeed = Math.random()*10.0;
    myAngle = Math.random()*2.0*Math.PI;
    myColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
  }
  void move() {
    myX = myX + Math.cos(myAngle)*mySpeed;
    myY = myY + Math.sin(myAngle)*mySpeed;
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
    myAngle = 0.0;
    distance = 0.01;
    distanceChange = 0.1;
  }
  void show() {
    fill(255, 255, 255);
    ellipse((float)myX, (float)myY, 5, 5);
  }
  void move() {

    if ( myAngle < 36000) {

      myX = 250 + Math.cos(myAngle)*distance;
      myY = 250 + Math.sin(myAngle)*distance;

      distance += distanceChange;
      myAngle += 0.1;
    }
  }
}
