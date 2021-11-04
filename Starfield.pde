class particle {
  double myX, myY, mySize, speed, myAngle;
  int myColor;
  particle() {
    myX = 500.0;
    myY = 500.0;
    myAngle = Math.random()* 2 * Math.PI;
    mySize = 1;
    speed = Math.random()*10;
    myColor = color((int)(Math.random()*255+40), (int)(Math.random()*46+200), (int)(Math.random()*96+200));
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
    myColor = color((int)(Math.random()*myX+30), (int)(Math.random()*myY+60), (int)(Math.random()*myX+100));
  }
}

void mousePressed() {
  for (int i = 0; i < boom.length; i++)
    boom[i].reset();
  pew.reset();
}
particle[] boom = new particle[200];
void setup() {
  size (1000, 1000);
  background(0);
  for (int i = 0; i < boom.length; i++) {
    boom[i] = new particle();
  }
}
firework pew = new firework();
void draw() {
  noStroke();
  frameRate(144);
  pew.show();
  pew.move();
  fill(0, 0, 0, 15);
  rect(0, 0, 1000, 1000);
  for (int i = 0; i < boom.length; i++) {
    boom[i].move();
    boom[i].show();
  }
}

class firework extends particle {
  firework() {
     myX = 500;
     myY = 500;
  }
  void move() {
    myX += (int)(Math.random()*9)-4;;
   myY += (int)(Math.random()*9)-4;
  }
  
  void show() {
    noFill();
    
    stroke(255);
    ellipse((float)myX, (float)myY, 20, 20);
    line((float)myX, (float)myY + 10, (float)myX, (float)myY + 40);
    line((float)myX - 10, (float)myY + 20, (float)myX + 10, (float)myY + 20);
    line((float)myX - 10, (float)myY + 50, (float)myX, (float)myY + 40);
    line((float)myX + 10, (float)myY + 50, (float)myX, (float)myY + 40);
  }
  void reset(){
    myX = mouseX;
    myY = mouseY;
  }
}
