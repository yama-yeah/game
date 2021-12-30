import ddf.minim.*;
AudioPlayer SEplayer;
Minim BGMfile;
AudioPlayer BGMplayer;
Minim SEfile;
String BGMname[]={"title.mp3","play.mp3"};
String SEname[] = {"coin01.mp3","hit.mp3"};
void SE(int id){
  SEplayer = SEfile.loadFile("sounds/SE/"+SEname[id]);
  println("play");
  try{
    SEplayer.play();
  }
  catch(NullPointerException e){
  }
}
void BGM(int id){
  BGMplayer=BGMfile.loadFile("sounds/BGM/"+BGMname[id]);
  BGMplayer.loop();
}
