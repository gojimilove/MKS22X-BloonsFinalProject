class Tower extends Thing{
  int value, damage, level;
  float speed, range;

  Tower(int x, int y) {
    super(x,y);
  }
  void display() {
    fill(0);
    rect(x, y, 50, 50);
  }
  //abstract void shoot();
  //abstract void sell();
  //abstract void upgrade();
}

//class DartTower extends Tower {
//  DartTower(int x, int y) {
//    super(x, y);
//  }
//  void display() {}
//}
