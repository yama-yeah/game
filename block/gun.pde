class Gun{
  float x,y;
  int id;
  boolean hostile;
  Gun(){}
  void shoot(float x,float y,int id,boolean hostile){
    //setting bullet status
    this.x=x;
    this.y=y;
    this.hostile=hostile;
    this.id=id;
    selector();//select a kind of gun module
  }
  void cross() {
    println("cross");
    laser(-90);
    laser(90);
    laser(180);
    laser(0); 
  }
  //gun modules
  void laser(int angle){//shoot a straight laser. you can setting angle
    Bullet bullet = new Bullet(x, y, angle, 4, 0,hostile);
    bulletList.add(bullet);
  }
  void slowCurve(int angle) {
    Bullet bullet = new Bullet(x, y, angle, 1, 0.2,hostile);
    bulletList.add(bullet);
  }
  void circle() {
    for (float degree = 0; degree < 360; degree += 10) {
      Bullet bullet = new Bullet(x, y, degree, 2, 0,hostile);
      bulletList.add(bullet);
    }
  }
  void snipe() {
    float dx = player.x - x;
    float dy = player.y - y;
    float degree = degrees(atan2(dy,dx));
    Bullet bullet = new Bullet(x, y, degree, 2, 0,hostile);
    bulletList.add(bullet);
  }
  void selector(){
    if(id==0){
      laser(-90);
    }
    else if(id==1){
      cross();
    }
    else if(id==2){
      snipe();
    }
    else if(id==3){
      circle();
    }
    else if(id==4){
    }
  }
}
