import java.*;
import java.util.*;
import java.io.*;



interface Displayable {
  void display();
}

//interface Detectable {
//  boolean isTouching(Thing other);
//}

abstract class Thing implements Displayable {
  int x, y;
  float size;

  Thing(int x, int y) {
    this.x = x;
    this.y = y;
  }

  abstract void display();
}

class Tile extends Thing {
  char direction; //n is no direction, w a s d are up left down right 
  color col;
  int ID;

  Tile(int x, int y, int s, char d, color c, int i) {
    super(x, y);
    size = s;
    direction = d;
    col = c;
    ID = i;
  }

  void display() {
    fill(col);
    rect(x, y, size, size);
  }

  int getID() {
    return ID;
  }

  int getX() {
    return x;
  }

  int getY() {
    return y;
  }
}

BufferedReader reader;
String line;

class Map implements Displayable {
  Tile[][] board;
  Tile[] path;


  Map() {
    int x = 0;
    int y = 0;
    int g = 0;
    board = new Tile[18][12];
    path = new Tile[53];
    for (int i = 0; i < board.length; i++) {
      for (int j = 0; j < board[i].length; j++) {
        board[i][j] = new Tile(x, y, 50, 'n', color(0, 255, 0), -1);
        y +=50;
      }
      y = 0;
      x += 50;
    }
    //hard coding the board (path)
    //board[0][2] = new Tile(0, 100, 50, 'n', color(180, 180, 180), 1);
    //board[1][2] = new Tile(50, 100, 50, 'n', color(180, 180, 180), 2);
    //board[2][2] = new Tile(100, 100, 50, 'n', color(180, 180, 180), 3);
    //board[3][2] = new Tile(150, 100, 50, 'n', color(180, 180, 180), 4);
    //board[3][3] = new Tile(150, 150, 50, 'n', color(180, 180, 180), 5);
    //board[3][4] = new Tile(150, 200, 50, 'n', color(180, 180, 180), 6);
    //board[3][5] = new Tile(150, 250, 50, 'n', color(180, 180, 180), 7);
    //board[4][5] = new Tile(200, 250, 50, 'n', color(180, 180, 180), 8);
    //board[5][5] = new Tile(250, 250, 50, 'n', color(180, 180, 180), 9);
    //board[6][5] = new Tile(300, 250, 50, 'n', color(180, 180, 180), 10);
    //board[7][5] = new Tile(350, 250, 50, 'n', color(180, 180, 180), 11);
    //board[8][5] = new Tile(400, 250, 50, 'n', color(180, 180, 180), 12);
    //board[8][4] = new Tile(400, 200, 50, 'n', color(180, 180, 180), 13);
    //board[8][3] = new Tile(400, 150, 50, 'n', color(180, 180, 180), 14);
    //board[8][2] = new Tile(400, 100, 50, 'n', color(180, 180, 180), 15);
    //board[8][1] = new Tile(400, 50, 50, 'n', color(180, 180, 180), 16);
    //board[9][1] = new Tile(450, 50, 50, 'n', color(180, 180, 180), 17);
    //board[10][1] = new Tile(500, 50, 50, 'n', color(180, 180, 180), 18);
    //board[11][1] = new Tile(550, 50, 50, 'n', color(180, 180, 180), 19);
    //board[12][1] = new Tile(600, 50, 50, 'n', color(180, 180, 180), 20);
    //board[13][1] = new Tile(650, 50, 50, 'n', color(180, 180, 180), 21);
    //board[13][2] = new Tile(650, 100, 50, 'n', color(180, 180, 180), 22);
    //board[13][3] = new Tile(650, 150, 50, 'n', color(180, 180, 180), 23);
    //board[13][4] = new Tile(650, 200, 50, 'n', color(180, 180, 180), 24);
    //board[13][5] = new Tile(650, 250, 50, 'n', color(180, 180, 180), 25);
    //board[13][6] = new Tile(650, 300, 50, 'n', color(180, 180, 180), 26);
    //board[13][7] = new Tile(650, 350, 50, 'n', color(180, 180, 180), 27);
    //board[13][8] = new Tile(650, 400, 50, 'n', color(180, 180, 180), 28);
    //board[14][8] = new Tile(700, 400, 50, 'n', color(180, 180, 180), 29);
    //board[15][8] = new Tile(750, 400, 50, 'n', color(180, 180, 180), 30);
    //board[16][8] = new Tile(800, 400, 50, 'n', color(180, 180, 180), 31);
    //board[16][9] = new Tile(800, 450, 50, 'n', color(180, 180, 180), 32);
    //board[16][10] = new Tile(800, 500, 50, 'n', color(180, 180, 180), 33);
    //board[15][10] = new Tile(750, 500, 50, 'n', color(180, 180, 180), 34);
    //board[14][10] = new Tile(700, 500, 50, 'n', color(180, 180, 180), 35);
    //board[13][10] = new Tile(650, 500, 50, 'n', color(180, 180, 180), 36);
    //board[12][10] = new Tile(600, 500, 50, 'n', color(180, 180, 180), 37);
    //board[11][10] = new Tile(550, 500, 50, 'n', color(180, 180, 180), 38);
    //board[10][10] = new Tile(500, 500, 50, 'n', color(180, 180, 180), 39);
    //board[9][10] = new Tile(450, 500, 50, 'n', color(180, 180, 180), 40);
    //board[8][10] = new Tile(400, 500, 50, 'n', color(180, 180, 180), 41);
    //board[7][10] = new Tile(350, 500, 50, 'n', color(180, 180, 180), 42);
    //board[6][10] = new Tile(300, 500, 50, 'n', color(180, 180, 180), 43);
    //board[6][9] = new Tile(300, 450, 50, 'n', color(180, 180, 180), 44);
    //board[6][8] = new Tile(300, 400, 50, 'n', color(180, 180, 180), 45);
    //board[5][8] = new Tile(250, 400, 50, 'n', color(180, 180, 180), 46);
    //board[4][8] = new Tile(200, 400, 50, 'n', color(180, 180, 180), 47);
    //board[3][8] = new Tile(150, 400, 50, 'n', color(180, 180, 180), 48);
    //board[2][8] = new Tile(100, 400, 50, 'n', color(180, 180, 180), 49);
    //board[1][8] = new Tile(50, 400, 50, 'n', color(180, 180, 180), 50);
    //board[1][9] = new Tile(50, 450, 50, 'n', color(180, 180, 180), 51);
    //board[1][10] = new Tile(50, 500, 50, 'n', color(180, 180, 180), 52);
    //board[0][10] = new Tile(0, 500, 50, 'n', color(180, 180, 180), 53);

    try {
      int r = 0;
      while (r < 53) {
        line = reader.readLine();
        String[] parts = split(line, ",");
        x = Integer.parseInt(parts[1]);
        y = Integer.parseInt(parts[0]);
        g = Integer.parseInt(parts[2]);
        //x = 17;
        //y = 11;
        //g = 1;
        board[x][y] = new Tile(x*50, y*50, 50, 'n', color(180), g);
        path[r] = new Tile(x*50, y*50, 50, 'n', color(180), g);
        r++;
      }
    }
    catch (IOException e) {
      e.printStackTrace();
      line = null;
    }
  }

  void display() {
    for (int i = 0; i < board.length; i++) {
      for (int j = 0; j < board[i].length; j++) {
        board[i][j].display();
      }
    }
  }

  Tile getTile(int r, int c) {
    return board[r][c];
  }

  Tile[] getPath() {
    return path;
  }
}
int s = 0;
void spawn() {
  //int s = millis()%100; //counts up to 100 and starts over
  s = s + 3;
  if (s == 60) { //if divisible by 100, add an enemy to the list
    Enemy e = new Enemy(25, 125, test.getPath(), 2);
    enemies.add(e);
<<<<<<< HEAD
  } 
}

void mouseClicked() {
  Tower t = new Tower(mouseX, mouseY);
  towers.add(t);;
=======
    s = 0;
  }
  
>>>>>>> 454d6f6d0ec2e26cd1b602beb5118395c0a95e15
}

Map test;
ArrayList<Enemy> enemies;
ArrayList<Tower> towers;
//Tower t;
//Enemy e;

void setup() {
  size(1100, 600);
  reader = createReader("map.txt");
  test = new Map();
  enemies = new ArrayList<Enemy>();
  //t = new Tower(1000, 100);
  towers = new ArrayList<Tower>();
}
float x, y;
void draw() {
  background(255);
  test.display();
  fill(255);
  //t.display();
  for (Tower t : towers) {
    t.display();
  }
  //fill(0);
  //rect(x, y, 50, 50);
  fill(0, 0, 0);
  text(("Time: "+(millis()%100)), 10, 20);
  text(("Enemies: "+enemies.size()), 10, 50);
  if (enemies.size() < 20) { //limit to # of enemies on board at once
    spawn();
  }
  for (int i = 0; i < enemies.size(); i++) { //if enemy reaches end, remove it
    if (enemies.get(i).isAlive == false) enemies.remove(i);
  }
  for (Enemy e : enemies) {
    e.display();
    e.move();
  }
}