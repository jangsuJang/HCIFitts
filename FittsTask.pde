FloatList inventory;

class FittsTask{
  //Java list (Cotainier)
  Application[] appList = new Application[100];
  //result Data
  FloatList distnaceList = new FloatList();
  FloatList widthList = new FloatList();
  long startTime=0;
  long endTime=0;
  boolean errorTrial = false;
  
  float scaleFactor = 1;
  long lastTouchTime = 0;
  boolean onTouch = false;
  float translateX, translateY;
  float mouseX, mouseY;
  int targetIndex =-1;
  boolean first = true;
  long lastStampTime = 0;


  FittsTask(){    
    //init application
    initApplication();
    setTarget();
    
  }

  float getTouchPosX(){
    return this.translateX;
  }
  float getTouchPosY(){
    return this.translateY;
  }
  void setTranslatePos(float translateX, float translateY){
    this.translateX = translateX;
    this.translateY = translateY;
  }
  void setTouchPos(float mouseX, float mouseY){
    this.mouseX = mouseX;
    this.mouseY = mouseY;
  }
  
  float getScaleFactor(){
    return this.scaleFactor;
  }
  
  float getTargetWidth(){
    return appList[targetIndex].getSize() * scaleFactor;
  }
  
  float getTargetDistance(){
    PVector  targetPosVector = appList[targetIndex].getPosition();
    PVector  fingerPosVector = new PVector(this.mouseX, this.mouseY); 
    println("****");
    println(targetPosVector);
    println(fingerPosVector);
    println("****");

    return  PVector.dist(targetPosVector, fingerPosVector);
  }
  
  void setScaleFactor(float sFactor){
    this.scaleFactor = sFactor;
  }
  //draw Application
  void initApplication(){
    int index = 0;
    for (int i = 0; i < width ; i=i+20){
      for(int j = 0; j < height ; j=j+20){
        Application temp = new Application(i,j);
        appList[index] = temp;
        index++;
      }
    }
  }
  
  void setTarget(){
    targetIndex = int(random(0,99));
    
    println(targetIndex);
    appList[targetIndex].setTarget();
  }
  
  void deleteTarget(){
    appList[targetIndex].deleteTarget();
    targetIndex = -1;
  }
  

  void drawApplication(){
    for(Application a : appList){
      a.update();
    }
  }
  
  void startTask(){
    setStartTime();
    
    pushMatrix();
    translate(translateX, translateY);
    scale(scaleFactor);
    t.drawApplication();
    popMatrix();
  }
  
  void setStartTime(){
     if(first){
      this.startTime = millis();
      this.lastStampTime = startTime;
      
      first = false;
    }
  }
  
  void setRecordData(){
      distnaceList.append(this.getTargetDistance());
      widthList.append(this.getTargetWidth());
  }
  

  
  void taskSuccess(){
  //if mouse click right application ellipased time, chage of width, change of distance and reset task for next trial
  }
  
  void taskFail(){
    resetTask();
  }
  
  
  void resetTask(){
    this.deleteTarget();
    this.setTarget();
    this.scaleFactor=1;
    this.translateX = 0;
    this.translateY = 0;
    first = true;
    
  }

  
};
