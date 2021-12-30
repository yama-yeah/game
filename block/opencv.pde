import gab.opencv.*;
import processing.video.*;
import java.awt.Rectangle;
Capture cam;
OpenCV opencv;
Rectangle[] faces;
float face[]=new float[6];
int CAM_WIDTH=320;
int CAM_HEIGHT=240;
int  cam_num=0;
void startsearch(){
  String[] cameras = Capture.list();
  while(true){
    if(cameras.length>0){
      break;
    }
    cameras = Capture.list();
  }
  for(int i=0; i<cameras.length; i++){
    println("[" + i + "] " + cameras[i]);
    cam_num=i;
  }
  //print(cam_num);
  cam = new Capture(this,CAM_WIDTH,CAM_HEIGHT,cameras[cam_num]);
  cam.start();
}
void face_point(){
    cam.read();
    try{
      opencv = new OpenCV(this, cam);
    }
    catch(IllegalArgumentException e){
    }
    catch(NullPointerException e){
    }
    try{
      opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);
      faces = opencv.detect();
    }
    catch(NullPointerException e){
      sceneflag=1;
    }
    int n=0;
    if(faces.length>0){
      float mx=faces[0].width;
      for(int i=1;i<faces.length;i++){
        if(mx<faces[i].width){
          mx=faces[i].width;
          n=i;
        }
      }
      face[0]=faces[n].x*width/CAM_WIDTH;
      face[1]=faces[n].y*height/CAM_HEIGHT;
      println("found");
      face[2]=faces[n].width;
      face[3]=faces[n].height;
      face[4]=faces[n].x;
      face[5]=faces[n].y;
      
    }
    
}
void show_me(){
  image(cam, width-CAM_WIDTH/2, height-CAM_HEIGHT/2,CAM_WIDTH/2,CAM_HEIGHT/2);
  image(helmet,face[4]/2+width-CAM_WIDTH/2,face[5]/2+height-CAM_HEIGHT/2,face[2]/2,face[3]/2);
}
boolean thread_done=true;
class ThreadGetFacepoint implements Runnable {
    public void run() {
      face_point();
      thread_done=true;
    }
}
