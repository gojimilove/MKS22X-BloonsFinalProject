class Enemy extends Thing {
  Tile[] path;
  int value, health, index;
  float speed, xDir, yDir;
  boolean isAlive;
  color col;
  int number;
  

  Enemy(int x, int y, Tile[] p, float s,color c,int n) {
    super(x, y);
    path = p;
    size = 30;
    speed = s;
    xDir = 1;
    yDir = 1;
    index = 0;
    isAlive = true;
    col = c;
    number = n;
  }

  void display() {
    fill(col);
    ellipse(x, y, size, size);
    fill(255);
    //text(("help: "+help+"\ncurrent pos: "+x+", "+y+"\nnext tile: "+path[index+1].getX()+", "+path[index+1].getY()),x-5,y-5);
  }
  int getNumber(){
    return number;
  }
  
  
  int help = 0;
  void move() {
    if (index < 52) {
      if (path[index+1].getX()+25 > x) {
        x+=speed; //move right
        help+=speed;
      } else if (path[index+1].getY()+25 > y) {
        y+=speed; //move down
        help+=speed;
      } else if (path[index+1].getX()+25 < x) {
        x-=speed; //move left
        help+=speed;
      } else if (path[index+1].getY()+25 <= y){
        y-=speed; //move up
        help+=speed;
      }
      if (help >= 50) { //each tile is size 50, so needs to take 50 steps before checking next tile
        index+=1;
        help = 0;
      }
    }
    else {
      lives--;
      isAlive = false; //reached the end
    }
  }
}
