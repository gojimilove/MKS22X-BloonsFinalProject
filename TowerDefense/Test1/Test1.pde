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
}

BufferedReader reader;
String line;

class Map implements Displayable {
  Tile[][] board;
  int[][] path;


  Map() {
    int x = 0;
    int y = 0;
    int g = 0;
    board = new Tile[18][12];
    path = new int[18][12];
    for (int i = 0; i < board.length; i++) {
      for (int j = 0; j < board[i].length; j++) {
        board[i][j] = new Tile(x, y, 50, 'n', color(0, 255, 0), -1);
        y +=50;
      }
      y = 0;
      x += 50;
    }

    try {
      //if (line != null) {
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
          r++;
        }
      //}
    }
    catch (IOException e) {
      e.printStackTrace();
      line = null;
    }
    //try {
    //  //File text = new File("map.txt");
    //  //Scanner s = new Scanner(text);
    //  //int r = 0;
    //  //while (r < 53 && s.hasNextLine()) {
    //  //  String lineS = s.nextLine();
    //  //  String[] parts = lineS.split(",");
    //  //  x = Integer.parseInt(parts[0]) * 50;
    //  //  y = Integer.parseInt(parts[1]) * 50;
    //  //  g = Integer.parseInt(parts[2]);
    //  //  board[x][y] = new Tile(x, y, 50, 'n', color(180), g);
    //  //  r++;
    //  //}
    //  //s.close();
    //}
    //catch (FileNotFoundException e) {
    //  System.out.println("The file was not found!") ;
    //  e.printStackTrace();
    //}
    //catch (Exception e) {
    //  System.out.println("An exception has occured") ;
    //}



    //for (int i = 0; i < board.length; i++) {
    //  for (int j = 0; j < board[i].length; j++) {
    //    color c = color(0,255,0);
    //    char d = 'n';
    //    if (j == 5) {
    //      c = color(180);
    //      d = 'd';
    //    }
    //    board[i][j] = new Tile(x, y, 50, d, c, g);
    //    y+=50;
    //  }
    //  y = 0;
    //  x+=50;
    //}
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
  reader = createReader("map.txt");
  Map test = new Map();
  test.display();
}

void draw() {
}
