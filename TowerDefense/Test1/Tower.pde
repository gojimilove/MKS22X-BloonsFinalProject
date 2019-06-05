String[] types = new String[]{"Dart_Monkey.png", "Tack_Shooter.png"};
class Tower extends Thing {
  int value, damage, level;
  float speed, range;
  PImage img;

  Tower(int x, int y) {
    super(x, y);
    towerPos = new PVector(x, y);
  }
  void display() {
    textSize(24);
    fill(0);
    text("Towers:", x, y);
    textSize(14);
    image(loadImage("Dart_Monkey.png"), x, y+20, 50, 50);
    text("Dart Monkey", x+55, y+40);
    text("$100", x+55, y+60);
    image(loadImage("Tack_Shooter.png"), x, y+80, 50, 50);
    text("Tack Shooter", x+55, y+100);
    text("$200", x+55, y+120);
    image(loadImage("Ice_Tower.png"), x, y+140, 50, 50);
    text("Ice Tower", x+55, y+160);
    text("$300", x+55, y+180);
    //image(loadImage("Sniper_Monkey.png"), x, y+200);
    //text("Sniper Monkey", x+55, y+225);
    
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
    value = 100;
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
      //fill(255);
      //textSize(12);
      //text("X: "+x+"\nY: "+y, x, y+10);
      fill(255, 100);
      ellipse(x+25, y+25, range, range);
    }
  }
}

class TackTower extends Tower {
  ArrayList<Dart> bullets;
  TackTower(int x, int y) {
    super(x, y);
    img = loadImage("Tack_Shooter.png");
    range = 200;
    value = 200;
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
      //fill(255);
      //textSize(12);
      //text("X: "+x+"\nY: "+y, x, y+10);
      fill(255, 100);
      ellipse(x+25, y+25, range, range);
    }
  }

}

class IceTower extends Tower {
  IceTower(int x, int y) {
    super(x, y);
    img = loadImage("Ice_Tower.png");
    range = 200;
    value = 300;
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
      //fill(255);
      //textSize(12);
      //text("X: "+x+"\nY: "+y, x, y+10);
      fill(255, 100);
      ellipse(x+25, y+25, range, range);
    }
  }
}

class SniperTower extends Tower {
  SniperTower(int x, int y) {
    super(x, y);
    img = loadImage("Sniper_Monkey.png");
    range = 0;
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
      //fill(255);
      //textSize(12);
      //text("X: "+x+"\nY: "+y, x, y+10);
    }
  }
}


class Dart {
  PVector Pos = new PVector();
  PVector target = new PVector();
  PVector start = new PVector();
  float speed = 10;
  int size = 10;
  PVector velocity;
  int distTraveled;
  int towerType;

  Dart(float x1, float y1, float x2, float y2,int dist, int type) {
    start.set(x1, y1);
    Pos.set(x1, y1);
    target.set(x2, y2);

    velocity = PVector.sub(target, Pos);
    velocity.setMag(speed);
    distTraveled = dist;
    
    towerType = type;
  }
  void update() {
    Pos.add(velocity);
    float angle = velocity.heading();
    pushMatrix();
    translate(Pos.x, Pos.y);
    rotate(angle);
    stroke(0);
    strokeWeight(2);
    line(0, 0, size, 0);
    strokeWeight(1);
    popMatrix();
    distTraveled = distTraveled + 10;
  }
}
