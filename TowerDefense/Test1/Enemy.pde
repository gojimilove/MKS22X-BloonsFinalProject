class Enemy extends Thing {
  Tile[] path;
  int value, health;
  float speed, xDir, yDir;
  
  Enemy(int x, int y, Tile[] p) {
    super(x,y);
    size = 30;
    speed = 5;
    xDir = 1;
    yDir = 1;
    path = p;
  }
  
  void display() {
    fill(255,0,0);
    ellipse(path[0].getX(), path[0].getY()+25,size,size);
  }
  
  void move() {
    x += 1;
    //y += 1;
  }
}