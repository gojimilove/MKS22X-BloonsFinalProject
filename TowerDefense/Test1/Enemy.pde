class Enemy extends Thing {
  int value, health;
  float speed, xDir, yDir;
  
  Enemy(int x, int y) {
    super(x,y);
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