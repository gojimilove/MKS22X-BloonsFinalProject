class Enemy extends Thing {
  Tile[] path;
  int value, health, index;
  float speed, xDir, yDir;

  Enemy(int x, int y, Tile[] p) {
    super(x,y);
     path = p;
    x = path[0].getX();
    y = path[0].getY();
    size = 30;
    speed = 5;
    xDir = 1;
    yDir = 1;
    index = 0;
  }

  void display() {
    fill(255, 0, 0);
    ellipse(x, y, size, size);
  }

  void move() {
    if (index < 52) {
      if (x >= path[index+1].getX() || y >= path[index+1].getY()) index++;
      //print("current pos: "+x+", "+y+"    next tile: "+path[index+1].getX()+", "+path[index+1].getY());
      if (path[index++].getX()+25 > x) {
        x+=.0000000000001;
      } else {
        y+=.0000000000001;
      }
    }
  }
}