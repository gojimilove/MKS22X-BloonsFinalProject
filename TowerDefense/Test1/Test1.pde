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
  boolean hasTower;

  Tile(int x, int y, int s, char d, color c, int i) {
    super(x, y);
    size = s;
    direction = d;
    col = c;
    ID = i;
    hasTower = false;
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

  boolean hasTower() {
    return hasTower;
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

  Tile[][] getBoard() {
    return board;
  }
}
int s = 0;
void spawn() {
  //int s = millis()%100; //counts up to 100 and starts over
  s = s + 3;
  if (s % 60 == 0) { //if divisible by 100, add an enemy to the list
    Enemy e = new Enemy(25, 125, test.getPath(), 2);
    enemies.add(e);
  }
}

int mode = 0;
void spawnT(int xT, int yT) {
  if (mode == 1) {
    DartTower t = new DartTower(xT, yT);
    dartTowers.add(t);
  } else if (mode == 2) {
    TackTower t = new TackTower(xT, yT);
    tackTowers.add(t);
  } else if (mode == 3) {
    IceTower t = new IceTower(xT, yT);
    iceTowers.add(t);
  } else if (mode == 4) {
    SniperTower t = new SniperTower(xT, yT);
    sniperTowers.add(t);
  }
}

void removeT(int xT, int yT) {
  for (int i = 0; i < dartTowers.size(); i++) {
    if (xT >= dartTowers.get(i).x && xT < dartTowers.get(i).x+50 && yT >= dartTowers.get(i).y && yT < dartTowers.get(i).y+50) {
      dartTowers.remove(i);
      dartPositions.remove(i);
    }
  }
  for (int i = 0; i < tackTowers.size(); i++) {
    if (xT >= tackTowers.get(i).x && xT < tackTowers.get(i).x+50 && yT >= tackTowers.get(i).y && yT < tackTowers.get(i).y+50) {
      tackTowers.remove(i);
      tackPositions.remove(i);
    }
  }
  for (int i = 0; i < iceTowers.size(); i++) {
    if (xT >= iceTowers.get(i).x && xT < iceTowers.get(i).x+50 && yT >= iceTowers.get(i).y && yT < iceTowers.get(i).y+50) {
      iceTowers.remove(i);
      icePositions.remove(i);
    }
  }
  //positions.remove(0);
}

void mouseClicked() {
  if (lives > 0) {
    if (mouseX >= 920 && mouseX < 970 && mouseY >= 70 && mouseY < 120) {
      mode = 1;
    } else if (mouseX >= 920 && mouseX < 970 && mouseY >= 130 && mouseY < 180) {
      mode = 2;
    } else if (mouseX >= 920 && mouseX < 970 && mouseY >= 190 && mouseY < 240) {
      mode = 3;
    } else if (mouseX >= 920 && mouseX < 970 && mouseY >= 250 && mouseY < 300) {
      mode = 4;
    } else if (mouseX >= 920 && mouseX < 970 && mouseY >= 250 && mouseY < 300) {
      mode = 5;
    }
    if (mouseButton == LEFT) spawnT(mouseX, mouseY);
    else if (mouseButton == RIGHT) removeT(mouseX, mouseY);
    if(mouseButton == LEFT && mode == 5) go();
  }
}
void go(){
  round = round + 1;
}

void shoot(float x1, float y1, float x2, float y2, int type) {
  Dart d = new Dart(x1, y1, x2, y2, 0, type);
  darts.add(d);

  //println(d);
}


Map test;
ArrayList<Enemy> enemies;
ArrayList<DartTower> dartTowers;
ArrayList<TackTower> tackTowers;
ArrayList<IceTower> iceTowers;
ArrayList<SniperTower> sniperTowers;
ArrayList<PVector> dartPositions;
ArrayList<PVector> tackPositions;
ArrayList<PVector> icePositions;
PVector towerPos;
PVector enemyPos;
ArrayList<Dart> darts;
Iterator<Dart> D;
int sec=0;
int lives = 5;
int round = 1;
boolean done = false;
//boolean alive = true;
Tower tow;
//Enemy e;

void setup() {
  size(1100, 600);
  reader = createReader("map.txt");
  test = new Map();
  enemies = new ArrayList<Enemy>();
  tow = new Tower(920, 50);
  towerPos = new PVector(920, 50);
  enemyPos = new PVector(0, 125);
  dartTowers = new ArrayList<DartTower>();
  tackTowers = new ArrayList<TackTower>();
  iceTowers = new ArrayList<IceTower>();
  sniperTowers = new ArrayList<SniperTower>();
  darts = new ArrayList<Dart>();
  dartPositions = new ArrayList<PVector>();
  icePositions = new ArrayList<PVector>();
  tackPositions = new ArrayList<PVector>();
  Iterator<Dart> D = darts.iterator();
}

void draw() {
  background(255);
  test.display();
  //if (lives == 0) alive = false;
  if (lives == 0) {
    textSize(50);
    fill(255, 0, 0);
    text("GAME OVER", 300, 300);
  }
  fill(255);
  stroke(255, 0, 0);
  if (mode == 1) rect(920, 70, 50, 50);
  if (mode == 2) rect(920, 130, 50, 50);
  if (mode == 3) rect(920, 190, 50, 50);
  if (mode == 4) rect(920, 250, 50, 50);
  stroke(0);
  tow.display();
  image(loadImage("Go.png"), 950, 450,100,100);
  //if(!done){
  //for (int i = 0; i < dartTowers.size(); i++) {
  //  PVector tp = new PVector( dartTowers.get(i).x, dartTowers.get(i).y);
  //  positions.add(tp);
  //}
  //done  =  true;
  //}
  for (DartTower t : dartTowers) {
    t.display(test.getBoard());
    PVector tp = new PVector( t.x+25, t.y+25);
    dartPositions.add(tp);
  }
  for (TackTower t : tackTowers) {
    t.display(test.getBoard());
    PVector tp = new PVector(t.x+25, t.y+25);
    tackPositions.add(tp);
    //if (frameCount % 60 == 0) t.shoot();
  }
  for (IceTower t : iceTowers) {
    t.display(test.getBoard());
    PVector tp = new PVector(t.x+25, t.y+25);
    icePositions.add(tp);
    
  }
  for (SniperTower t : sniperTowers) {
    t.display(test.getBoard());
  }

  fill(0, 0, 0);
  textSize(12);
  text(("Round: "+round), 10, 20);
  text(("Lives: "+lives), 10, 50);
  if (round  == 1 && !done ) {
    if (lives > 0 && enemies.size() < 5) { //limit to # of enemies on board at once
      spawn();
    }
  }
  if (enemies.size() == 5 && round == 1) {
    done = true;
  }


  for (int i = 0; i < enemies.size(); i++) { //if enemy reaches end, remove it
    if (enemies.get(i).isAlive == false) enemies.remove(i);
  } 
  //enemyPos = new PVector(enemies.get(0).x, enemies.get(0).y);    }
  int j = 0;
  for (Enemy e : enemies) {
    e.display();
    enemyPos = new PVector(e.x, e.y);
    for (PVector p : dartPositions) {
      if (p.dist(enemyPos) < 200) {
        if (frameCount % 60 == 0) {
          shoot(p.x, p.y, enemyPos.x, enemyPos.y, 0);
          //println(":" + dartPositions.size());
        }
      }
    }
    for (PVector p : tackPositions) {
      if (p.dist(enemyPos) < 100) {
        if (frameCount % 60 == 0) {
          shoot(p.x, p.y, p.x, p.y+50, 1);
          shoot(p.x, p.y, p.x+25, p.y+25, 1);
          shoot(p.x, p.y, p.x+50, p.y, 1);
          shoot(p.x, p.y, p.x+25, p.y-25, 1);
          shoot(p.x, p.y, p.x, p.y-50, 1);
          shoot(p.x, p.y, p.x-25, p.y-25, 1);
          shoot(p.x, p.y, p.x-50, p.y, 1);
          shoot(p.x, p.y, p.x-25, p.y+25, 1);
        }
      }
    }
    for (PVector p : icePositions) {
      if (p.dist(enemyPos) < 100) {
        if (frameCount % 60 == 0) {
          e.col = color(0, 0, 255);
          if (frameCount % 120 == 0) e.col = color(255, 0, 0);
          //if (one_second_has_passed) e.col = color(255, 0, 0);
        }
      }
    }
    for (int i = 0; i < darts.size(); i++) {
      if (darts.get(i).Pos.dist(enemyPos) < 10) {
        darts.remove(i);
        enemies.get(j).isAlive = false;
      }
    }
        
    if (e.col == color(255, 0, 0)) e.move();
    j++;
  }
  Iterator<Dart> D = darts.iterator();
  for (int i = 0; i < darts.size(); i++) {
    if (darts.get(i).Pos.x < 0 || darts.get(i).Pos.x > 900 || darts.get(i).Pos.y > 600 || darts.get(i).Pos.y < 0 ) {
      darts.remove(i);
      println("darts:" + darts.size());
    }
  }

  for (Dart d : darts) {
    d.update();
  }
  while (D.hasNext()) {
    Dart dd = D.next();
    if (dd.towerType == 0 && dd.distTraveled > 200) {
      D.remove();
    } else if (dd.towerType == 1 && dd.distTraveled > 100) {
      D.remove();
    }
  }

  //int en = 0;
  //for (int i = 0; i < darts.size(); i++) {
  //  if (darts.get(i).Pos.dist(enemyPos) < 5 && en < enemies.size()) {
  //    //println(enemies.size());
  //    enemies.get(en).isAlive = false;
  //    darts.remove(i);
  //    en = en + 1;
  //  }
  //}
}
