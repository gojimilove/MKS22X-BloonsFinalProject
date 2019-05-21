class Enemy{
  int value, health, size;
  float x, y, speed, xDir, yDir;
  
  Enemy() {
    x = 200;
    y = 200;
    size = 30;
    speed = 5;
    xDir = 1;
    yDir = 1;
  }
  
  void display() {
    fill(255,0,0);
    ellipse(x,y,size,size);
  }
  
  void move() {
    x += 1;
    y += 1;
  }
}

Enemy tester = new Enemy();
void setup() {
  size(900,600);
}

void draw() {
  background(255);
  tester.display();
  tester.move();
}