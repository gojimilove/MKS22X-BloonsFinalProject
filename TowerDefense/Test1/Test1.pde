interface Displayable {
  void display();
}

//interface Detectable {
//  boolean isTouching(Thing other);
//}

abstract class Thing implements Displayable{
  float x, y;
  float size;
  
  Thing(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  abstract void display();
}

class Tile extends Thing{
  char direction; //n is no direction, w a s d are up left down right 
  color col;
  
  Tile(float x, float y, int s, char d, color c) {
    super(x,y);
    size = s;
    direction = d;
    col = c;
  }
  
  void display() {
    fill(col);
    rect(x,y,size,size);
  }
  
}

class Map implements Displayable{
  Tile[][] board;
  
  Map() {
    float x = 0;
    float y = 0;
    board = new Tile[18][12];
    for (int i = 0; i < board.length; i++) {
      for (int j = 0; j < board[i].length; j++) {
        color c = color(0,255,0);
        char d = 'n';
        if (j == 5) {
          c = color(180);
          d = 'd';
        }
        board[i][j] = new Tile(x, y, 50, d, c);
        y+=50;
      }
      y = 0;
      x+=50;
    }
  }
  
  void display() {
    for (int i = 0; i < board.length; i++) {
      for (int j = 0; j < board[i].length; j++) {
        board[i][j].display();
      }
    }
  }
  
}


void setup() {
  size(900, 600);
  background(255);
  
}

void draw() {
  Map test = new Map();
  test.display();
}