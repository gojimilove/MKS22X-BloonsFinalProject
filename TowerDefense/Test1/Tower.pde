class Tower extends Thing {
  int value, damage, level;
  float speed, range;

  Tower(int x, int y) {
    super(x, y);
  }
  void display() {
    fill(0);
    rect(x, y, 50, 50);
  }

  void display(Tile[][] board) {
    for (int i = 0; i < board.length; i++) {
      for (int j = 0; j < board[0].length; j++) {
        if (x >= board[i][j].getX() && x < board[i][j].getX()+50 && y >= board[i][j].getY() && y < board[i][j].getY()+50) {
          x = board[i][j].getX();
          y = board[i][j].getY();
        }
      }
    }

    fill(0);
    rect(x, y, 50, 50);
    fill(255);
    text("X: "+x+"\nY: "+y, x, y+10);
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
