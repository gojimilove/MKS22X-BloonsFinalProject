PVector towerPos = new PVector(100, 100);
PVector enemyPos = new PVector(300, 300);

float towerAttackRadius = 300; 

ArrayList<Bullet> bullets = new ArrayList<Bullet>(); 

void setup() {
  size(400, 400);
  rectMode(CENTER);
  strokeWeight(3);
}
void draw() {
  background(255);

  //check if an enemy is within range using dist()
  //if the distance is smaller than the radius, attack!
  if(towerPos.dist(enemyPos) < towerAttackRadius){

    //hacky frame based counter: please use a millis() based timer instead
    //shoot every 30 frames
    if(frameCount % 30 == 0){
      shoot();
    }

  }

  //update bullets
  for(Bullet b : bullets) {
    b.update();
  }

  //draw tower
  noFill();
  stroke(0, 0, 192);
  //visualise tower attack radius
  //(towerAttackRadius * 2 -> radius * 2 = diameter (width/height))
  ellipse(towerPos.x, towerPos.y, towerAttackRadius * 2, towerAttackRadius * 2);
  //visualise tower
  rect(towerPos.x, towerPos.y, 30, 30);
  //draw enemy
  stroke(192, 0, 0);
  rect(enemyPos.x, enemyPos.y, 10, 10);
  //instructions
  fill(0);
  text("click and drag to move enemy",10,15);
}

void mouseDragged() {
  enemyPos.set(mouseX, mouseY);
}

void shoot(){
  //make a new Bullet pointing from the tower to the enemy
  Bullet b = new Bullet(towerPos.x,towerPos.y,enemyPos.x,enemyPos.y);
  //add it to the list of bullets (for updates)
  bullets.add(b);

  println(b);
}

class Bullet {
  //where does the bullet shoot from (and it's current position)
  PVector position = new PVector();
  //where does the bullet shooting towards
  PVector target = new PVector();
  //how fast does the bullet move on screen
  float speed = 1.2;
  //how large goes the bullet appear on screen
  float size = 10;

  //bullet velocity
  PVector velocity;

  Bullet(float startX,float startY, float endX, float endY) {
    position.set(startX,startY);
    target.set(endX,endY);

    //compute the difference vector (start to end) = direction
    velocity = PVector.sub(target,position);

    //normalize the vector = same direction but magnitude of 1 -> makes it easy to scale 
    //velocity.normalize();

    //scale by the speed to move on screen)
    //normalize + multiple = resize the vector -> same direction, different length
    //velocity.mult(speed);

    //or do both normalize and multiple using setMag()
    velocity.setMag(speed);  
  }
  void update() {
    //update position based on velocity (simply add velocity to current position)
    position.add(velocity);

    //render
    //compute rotation angle from velocity (implementation is 2D only btw)
    float angle = velocity.heading();
    pushMatrix();
    translate(position.x,position.y);
    rotate(angle);
    stroke(0);
    line(0,0,size,0);
    popMatrix();
  }

  String toString(){
    return position+"->"+target;
  }
}
