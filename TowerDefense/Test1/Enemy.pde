class Enemy extends Thing {
  int value, health;
  float xspeed, yspeed;
  
  Enemy(float x, float y) {
    super(x,y);
    size = 30;
    xspeed = 5;
    yspeed = 5;
  }
}