
PVector towerPos;
PVector enemyPos;
ArrayList<Dart> darts = new ArrayList<Dart>();
String[] types = new String[]{"Dart_Monkey.png", "Tack_Shooter.png"};
class Tower extends Thing {
  int value, damage, level;
  float speed, range;
  PImage img;

  Tower(int x, int y) {
    super(x, y);
    towerPos = new PVector(x,y);
  }
  void display() {
    textSize(24);
    fill(0);
    text("Towers:", x, y);
    textSize(14);
    image(loadImage("Dart_Monkey.png"), x, y+20, 50, 50);
    text("Dart Monkey", x+55, y+45);
    image(loadImage("Tack_Shooter.png"), x, y+80, 50, 50);
    text("Tack Shooter", x+55, y+105);
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
    if (id == -1 && x < 900 && x >= 0 && y < 600 && y >= 0) {
      fill(0);
      image(img, x, y, 50, 50);
      fill(255);
      textSize(12);
      text("X: "+x+"\nY: "+y, x, y+10);
    }
  }
<<<<<<< HEAD
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
=======
>>>>>>> c21a67bce9649bc2393223cd13744e4de78c8ab0
}