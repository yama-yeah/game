boolean collision(float x1, float y1, float w1, float h1,
                  float x2, float y2, float w2, float h2) {
  if (x1 + w1/2 < x2 - w2/2) return false;
  if (x2 + w2/2 < x1 - w1/2) return false;
  if (y1 + h1/2 < y2 - h2/2) return false;
  if (y2 + h2/2 < y1 - h1/2) return false;
  return true;
}
boolean overrun(float x,float y){
  return x < 0 || x > width || y < 0 || SURFACE_FIELD > BOTTOM_FIELD;
}
boolean button(int x,int y,int w,int h,String s){
  textAlign(CENTER);
  rectMode(CENTER);
  
  fill(255);
  rect(x,y,w,h);
  fill(0);
  text(s,x,y,3);
  rectMode(CORNER);
  textAlign(CORNER);
  if(mousePressed){
    if(collision(x,y,w,h,mouseX,mouseY,1,1)){
      SE(0);
      return true;
    }
  }
  return false;
}
void obj_update(){
  for (int i = bulletList.size()-1; i >= 0; i--) {
    Bullet bullet = bulletList.get(i);
    bullet.move();
    bullet.draw();
    if (collision(player.x, player.y, 5, 5, bullet.x, bullet.y, 5, 5)&&bullet.hostile) {
      bullet.hit = true;
      player.hitPoint--;
    }
    for(int j=enemyList.size()-1;j>=0;j--){
      Enemy enemy=enemyList.get(j);
      if(collision(enemy.x, enemy.y, enemy_width[enemy.id], enemy_height[enemy.id], bullet.x, bullet.y,5,5)&&!bullet.hostile){
        bullet.hit = true;
        SE(1);
        enemy.hitPoint--;
      }
    }
    if (bullet.needRemove()) bulletList.remove(i);
  }
  for(int j=enemyList.size()-1;j>=0;j--){
    Enemy enemy=enemyList.get(j);
    if (enemy.needRemove()){ enemyList.remove(j);}
    else enemy.update();
  }
}
