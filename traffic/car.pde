class Car{
  int x, y, v;
  int start_x, start_y, start_v;
  int w, h; 
  color c;
  int pos; //the changing position var 
  String dir;
  
  Car (int x, int y, int w , int h, int v, color c, String dir){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.v = v;
    this.c = c;
    this.start_x = x;
    this.start_y = y;
    this.start_v = v;
    this.dir = dir;
    
    
  }
  
  int getPos(){
    if (this.dir.equals("h")){
       return x; 
     }else{
       return y;
     } 
  }
  
  int getX(){
    return this.x; 
  }
  
  int getY(){
    return this.y; 
  }
  
  int getV(){
    return this.v;
  }
  
  int get_start_v(){
    return this.start_v;
  }
  
  String getDir(){
    return this.dir; 
  }
  
  void drawCar(){
    smooth();
    fill(this.c);
    rect(this.x, this.y, this.w, this.h, 7);
  }
  
  void drive(){
    
    if (this.dir.equals("h")){ 
      this.x = this.x + this.v;
    }else {
      this.y = this.y + this.v;  
    }
    
    if (this.x > width || this.x < 0){
      this.x = start_x; 
    }
    if (this.y > height || this.y < 0){
      this.y = this.start_y; 
    }
  }
  
  //if given paramters update speed
  void drive(int v){
    this.v = v;
    if (this.dir.equals("h")){ 
      this.x = this.x + this.v;
    }else {
      this.y = this.y + this.v;  
    }
    
    if (this.x > width || this.x < 0){
      this.x = this.start_x; 
    }
    if (this.y > height || this.y < 0){
      this.y = this.start_y; 
    }
  }
}