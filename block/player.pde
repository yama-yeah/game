class Player {
  float x = width / 2;
  float y = height - 32;
  int hitPoint = 100;
  int dx=0;
  int dy=0;
  
  void move() {
    if(face[4]+face[2]/2.0<CAM_WIDTH/3.0){
      dx=4;
    }
    else if(face[4]+face[2]/2.0<CAM_WIDTH/3.0*2.0){
      dx=0;
    }
    else{
      dx=-4;
    }
    x+=dx;
    y+=dy;
    if (x-32 < 0)      x = 32;
    if (x+32 > width)  x = width-32;
    if (y-32 < 0)      y = 32;
    if (y+32 > height) y = height-32;
  }
  
  void draw() {
    
    if(dx<0){
      image(player_mecha[0],x,y);
    }
    else if(dx==0){
      image(player_mecha[1],x,y);
    }
    else{
      image(player_mecha[2],x,y);
    }
    
    if (frameCount % 10 == 0) gun.shoot(x,y,0,false);
  }
}
