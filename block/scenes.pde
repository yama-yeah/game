int sceneflag=0;
class Scenes {
  
  Scenes() {
    imageMode(CENTER);
    BGM(0);
  }
  void selector() {
    if (sceneflag==0){
      title();
    }
    else if(sceneflag==1){
      play();
    }
    else{
      over();
    }
  }
  void title() {
    println(sceneflag);
    background(0);
    image(title_mecha, width/2, height/2,400,300);
    image(title_logo, width/2, height/2,300,150);
    if (button(width/2,height*4/5,100,50,"start")) {
      sceneflag=1;
      imageMode(CORNER);
      BGMfile.stop();
      BGM(1);
    }
    
    //sceneflag++;
    //delay(50000);
  }
  void play() {
    sceneflag=1;
    draw_back();
    //delay(1000);
    
    if(thread_done){
      ThreadGetFacepoint th= new ThreadGetFacepoint();
      Thread get_facepoint = new Thread(th);  
      get_facepoint.start();//get face points
      thread_done=false;
    }
    
    show_me();
    fill(255, 0, 0);
    obj_update();
    fill(0, 0, 255);
    fill(167, 87, 168);
    
    fill(0, 255, 0);
    player.move();
    player.draw();
  
    fill(255, 255, 0);
    text("Player:" + nf(player.hitPoint, 3) , 20, 20);
    text("Score:" + nf(score, 3)  , 20, 40); 
    if(score>boss_id[enemy_flag]*150){
      //boss spawn
      if(!boss_alive){
        Enemy enemy=new Enemy(boss_id[enemy_flag]);
        enemyList.add(enemy);
        boss_alive=true;
      }
    }
    if(!boss_alive){
      println("a");
      spawn();
    }
    if (player.hitPoint < 1||enemy_flag==1)
      sceneflag++; // game over
  }
  void over() {
    background(155);
    textAlign(CENTER);
    textSize(50);
    text("Your score:"+score,width/2,height/2);
  }
}
