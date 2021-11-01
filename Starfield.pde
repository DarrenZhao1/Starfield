class particle {
  double myX, myY, mySize, speed, myAngle;
  int myColor;
  particle() {
    myX = 500.0;
    myY = 500.0;
    myAngle = Math.random()* 2 * Math.PI;
    mySize = 1;
    speed = Math.random()*10;
    myColor = color((int)(Math.random()*255+10), (int)(Math.random()*56+200), (int)(Math.random()*56+200));
  }
  void move() {
    myX += Math.cos(myAngle) * speed;
    myY += Math.sin(myAngle) * speed;
  }

  void show() {
    stroke(myColor);
    fill(myColor);
    ellipse((float)myX, (float)myY, (float)mySize, (float)mySize);
  }

  void reset() {
    myX = mouseX;
    myY = mouseY;
    myAngle = Math.random()* 2 * Math.PI;
    mySize = 1;
    speed = Math.random()*10;
    myColor = color((int)(Math.random()*255+10), (int)(Math.random()*56+200), (int)(Math.random()*56+200));
  }
}

void mousePressed() {
  for (int i = 0; i < boom.length; i++)
    boom[i].reset();
}
particle[] boom = new particle[200];
void setup() {
  size (1000, 1000);
  background(0);
  for (int i = 0; i < boom.length; i++) {
    boom[i] = new particle();
  }
void draw() {
  noStroke();
  frameRate(600);
  //pew.show();
  //pew.move();
  fill(0, 0, 0, 15);
  rect(0, 0, 1000, 1000);
  for (int i = 0; i < boom.length; i++) {
    boom[i].move();
    boom[i].show();
  }
}


