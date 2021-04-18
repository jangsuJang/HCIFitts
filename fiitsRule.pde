FittsTask t;

void setup(){
  size(200,200);
  t = new FittsTask();
  t.drawApplication();

  t.setTouchPos(0,0);
  background(125,125,125);
}

void draw(){
  background(125,125,125);
  t.startTask();
}

void mouseWheel(MouseEvent e)
{
  float tScaleFactor = t.getScaleFactor() + e.getAmount() / 100;
  float tTranslateX = t.getTouchPosX() - e.getAmount() * mouseX / 100;
  float tTranslateY = t.getTouchPosY() - e.getAmount() * mouseY / 100;
  t.setScaleFactor(tScaleFactor);
  t.setTranslatePos(tTranslateX,tTranslateY);
  t.setTouchPos(mouseX,mouseY);
}

void keyPressed(){
  if(key=='r'){
    t.resetTask();
  }
}

void mousePressed(MouseEvent e){
  float time;
  float tTranslateX = t.getTouchPosX();
  float tTranslateY = t.getTouchPosY();
  float tScaleFactor = (tTranslateX / 100) + (tTranslateY /100);

  if (mousePressed == true){
    for (float i = 0; i < 10; i = tTranslateX/100){
      tScaleFactor=tScaleFactor + 1;
    }
  }else{
    tScaleFactor = 0;
  }
}

void mouseDragged(MouseEvent e){
  //translateX = mouseX;
  //translateY = mouseY;
  //move drawings..
  
  println(mouseX, " ", mouseY);
}

//void touchStarted() {
  //for (float i = 0; i < 10; i = tTranslateX/100){
      //tScaleFactor + 1;}
//}

//void touchMoved() {
  //translateX = touchX;
  //translateY = touchY; 
///}

//void touchEnded() {
  //tscaleFactor = 0;  
//}
