class Bullet {
  float x;
  float y;
  float angle;
  float speed;
  float angleSpeed;
  boolean hit = false;
  boolean hostile;
  int id; 
  Bullet (float x, float y, float angle, float speed, float angleSpeed,boolean hostile) {
    this.x = x; 
    this.y = y;
    this.angle = angle;
    this.speed = speed;
    this.angleSpeed = angleSpeed;
    this.hostile=hostile;
  }
  
  void move() {
    angle = (angle + angleSpeed) % 360;
    x += cos(radians(angle)) * speed;
    y += sin(radians(angle)) * speed;
  }
  
  void draw() {
    ellipse(x, y, 10, 10);
  }
  
  boolean needRemove() {
    return overrun(x,y) || hit;
  }
}
/*
class Laser extends Bullet {
  float w;
  float h;
  Laser (float x, float y, float angle, float w, float h) {
    super
    this.w = w;
    this.h = h;
  }
  void draw() {
    rect(x-w/2, y-h/2, w, h);
  }
}
*/
