class Application{

  boolean target = false;
  int x;
  int y;
  int size = 10;
  
  Application(int x, int y){
    this.x = x;
    this.y = y;
  }
  
  void setTarget(){
    this.target = true;
  }
  
  int getSize(){
    return this.size;
  }
  
  PVector getPosition(){
    return new PVector(this.x,this.y);

  }
  
  void deleteTarget(){
    this.target=false;
  }
  
  void update(){
    if(target){
      fill(255,0,0);
    }
    ellipse(x,y,size,size);
    fill(255,255,255);
  }

  

};
