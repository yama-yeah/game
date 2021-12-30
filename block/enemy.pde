int enemy_width[]={32,64};
int enemy_height[]={32,48};
int enemy_score[]={10,50};
int boss_id[]={1,3};
int enemy_hp[]={2,30};
int enemy_flag=0;
int score=0;
//BOSS's score >= 50!!!!!!
//don't forget!!!
//boss spawn requirement 150*"boss's level"-"got boss's score"<=score
class Enemy {
  float dx=0;
  float dy=0;
  float x;
  float y;
  int angle = 0;
  int hitPoint;
  int id;
  float spawnx;
  float spawny;
  boolean spawned=false;
  int time=0;
  Enemy(int id){
    hitPoint=enemy_hp[id];
    this.id=id;
    y=-enemy_height[id];
    spawn();
  }
  boolean move(float destinationx,float destinationy,int time) {
    if(y<destinationy){
      dy=destinationy/time;
      if(destinationx<0){
      }
      else{
        dx=(destinationx-x)/time;
      }
      return false;
    }
    return true;
  }
  void selector(){
    if(id==0){
      //pass
      //gun.shoot(x,y,2,true);
      //boss1();
      if (time % 60 == 0&&time>30) gun.shoot(x,y,2,true);
    }
    else if(id==1){
      //
      boss1();
    }
    if(!spawned){
      println("moving");
      if(enemy_score[id]>=50){
        spawned=move(width/2,(float)BOTTOM_FIELD/2,60);
      }
      else spawned=move(-1,spawny,60);
    }
  }
  void draw() {
    image(enemy_img[id],x,y,enemy_width[id],enemy_height[id]);
  }
  void update(){
    time++;
    selector();
    x+=dx;
    y+=dy;
    draw();
  }
  void boss1(){
    angle = (angle + 1) % 360;
    dx = cos(radians(angle)) * 2;
    dy = sin(radians(angle*2 + 90)) * 3;    
    if (frameCount % 10 == 0) gun.shoot(x,y,2,true);
    //if (frameCount % 10 == 0) gun.shoot(x,y,3,true);
  }
  void homing(){
    if (frameCount % 20 == 0) gun.shoot(x,y,0,true);
    dy=0;
    if(player.x<x){
      dx=-(player.x-x)%2-2;
    }
    else if(player.x>x){
      dx=(player.x-x)%2+2;
    }
    else dx=0;
  }
  void spawn(){
    x=random(0,width-enemy_width[id]);
    spawny=random(SURFACE_FIELD,BOTTOM_FIELD/2);
  }
  boolean needRemove(){
    if(hitPoint<=0){
      score+=enemy_score[id];
      if(enemy_score[id]>=50){
        boss_alive=false;
        enemy_flag++;
      }
      return true;
    }
    if(x < 0 || x > width || y > height) return true;
    else return false;
  }
}
void spawn(){
  if(frameCount%120==0){
    int spawn_number=int(random(1,3));
    
    for(int i=0;i<spawn_number;i++){
      Enemy enemy=new Enemy(int(random(0,enemy_flag)));
      enemyList.add(enemy);
    }
  }
}
