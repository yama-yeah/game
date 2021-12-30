String img_name[]={"mecha.png","enemy.png","title.png","helmet.png","logo.png"};
PImage enemy_img[]=new PImage[2];
PImage title_mecha;
PImage player_mecha[]=new PImage[3];
PImage title_logo;
PImage helmet;
void load_all_img(){
  //6
  PImage img=loadImage("pictures/"+img_name[1]);
  img = img.get(32*6, 0, 32, 32);
  enemy_img[0]=img;
  img=loadImage("pictures/"+img_name[1]);
  img = img.get(0, 32, 64, 48);
  enemy_img[1]=img;
  img=loadImage("pictures/"+img_name[0]);
  for(int i=0;i<3;i++){
    player_mecha[i]=img.get((i+1)*32, 0, 32, 32);
  }
  helmet=loadImage("pictures/"+img_name[3]);
  title_mecha=loadImage("pictures/"+img_name[2]);
  title_logo=loadImage("pictures/"+img_name[4]);
}
