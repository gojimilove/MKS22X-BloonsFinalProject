class Enemy extends Thing {
  Tile[] path;
  int value, health, index;
  float speed, xDir, yDir;

  Enemy(int x, int y, Tile[] p) {
    super(x, y);
    size = 30;
    speed = 5;
    xDir = 1;
    yDir = 1;
    path = p;
    index = 0;
  }

  void display() {
    fill(255, 0, 0);
    ellipse(path[index].getX(), path[index].getY()+25, size, size);
  }

  void move() {
    if (index < 52) {
      //print("current pos: "+x+", "+y+"    next tile: "+path[index+1].getX()+", "+path[index+1].getY());
      if (path[index++].getX()+25 > x) {
        x+=.0000000000001;
      } else {
        y+=.0000000000001;
      }
    }
  }
}