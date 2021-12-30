ArrayList<Bullet> bulletList;
ArrayList<Enemy> enemyList;
//ArrayList<Laser> laserList;
int BOTTOM_FIELD;
int SURFACE_FIELD=0;
int MAXIMAM_ENEMY_NUMBER=5;
Player player;
Enemy enemy;
Gun gun;
Scenes scenes;
boolean boss_alive=false;
void mouseClicked() {
  //setup();
}

void setup() {
  size(500, 500);
  frameRate(60);
  noStroke();
  BOTTOM_FIELD=height;
  bulletList = new ArrayList<Bullet>();
  enemyList = new ArrayList<Enemy>();
  BGMfile= new Minim(this);
  SEfile= new Minim(this);
  player = new Player();
  gun=new Gun();
  startsearch();//start opencv
  load_all_img();
  scenes=new Scenes();
}
void draw() {
  scenes.selector();
  /*
  if(thread_done){
    ThreadGetFacepoint th= new ThreadGetFacepoint();
    Thread get_facepoint = new Thread(th);  
    get_facepoint.start();//get face points
    thread_done=false;
  }
  
  draw_back();
  //show_me();
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
  if (player.hitPoint == 0)
    noLoop(); // game over
 */
}
