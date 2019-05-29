PVector towerPos;
PVector enemyPos;
ArrayList<Dart> darts = new ArrayList<Dart>();
class Tower extends Thing {
  int value, damage, level;
  float speed, range;
  PImage img;

  Tower(int x, int y) {
    super(x, y);
    towerPos = new PVector(x,y);
  }
  void display() {
    fill(0);
    rect(x, y, 50, 50);
  }

  void display(Tile[][] board) {
    int id = -1;
    for (int i = 0; i < board.length; i++) {
      for (int j = 0; j < board[0].length; j++) {
        if (x >= board[i][j].getX() && x < board[i][j].getX()+50 && y >= board[i][j].getY() && y < board[i][j].getY()+50) {
          x = board[i][j].getX();
          y = board[i][j].getY();
          id = board[i][j].getID();
        }
      }
    }
    if (id == -1) {
      fill(0);
      rect(x, y, 50, 50);
      fill(255);
      text("X: "+x+"\nY: "+y, x, y+10);
    }
  }
  //abstract void shoot();
  //abstract void sell();
  //abstract void upgrade();
}

class DartTower extends Tower {
  DartTower(int x, int y) {
    super(x, y);
    img = loadImage("Dart_Monkey.png");
    range = 300;
  }
  
  void display() {
    super.display();
  }
  
  void display(Tile[][] board) {
    int id = -1;
    for (int i = 0; i < board.length; i++) {
      for (int j = 0; j < board[0].length; j++) {
        if (x >= board[i][j].getX() && x < board[i][j].getX()+50 && y >= board[i][j].getY() && y < board[i][j].getY()+50) {
          x = board[i][j].getX();
          y = board[i][j].getY();
          id = board[i][j].getID();
        }
      }
    }
    if (id == -1) {
      fill(0);
      image(img, x, y, 50, 50);
      fill(255);
      text("X: "+x+"\nY: "+y, x, y+10);
    }
  }
}

class Dart {
  PVector Pos = new PVector();
  PVector target = new PVector();
  int speed = 2;
  int size = 10;
  PVector velocity;
  
  Dart(int x1, int y1, int x2, int y2){
    Pos.set(x1,y1);
    target.set(x2,y2);
    
    velocity = PVector.sub(target,Pos);
    velocity.setMag(speed);
  }
}