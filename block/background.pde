int cnt=0;
void draw_back(){
  background(192);
  for(int i=cnt-25;i<height;i+=100){
    fill(180);
    rect(0,i,width,50);
  }
  cnt+=30;
  cnt=cnt%100;
}
