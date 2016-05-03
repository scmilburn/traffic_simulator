class Light{
 String col;
 int x,y;
 Light(int x, int y){
     this.x = x;
     this.y = y;
     this.col = "red";
 }
 void drawLight(){
   fill(200);
   noStroke();
   rect(this.x, this.y, 30, 90);
   if(this.col.equals("red")){
     fill(250, 0, 0);
   }
   else{
     fill(100);
   }
   ellipse(this.x+15, this.y+15, 20, 20);
   if(this.col.equals("yellow")){
     fill(250, 250, 0);
   }
   else{
     fill(100);
   }
   ellipse(this.x+15, this.y+45, 20, 20);
   if(this.col.equals("green")){
     fill(0, 250, 0);
   }
   else{
     fill(100);
   }
   ellipse(this.x+15, this.y+75, 20, 20);
 }
 
 void toggleLight(){
  if(this.col.equals("red")){
   this.col = "green"; 
  }
  else if(this.col.equals("yellow")){
   this.col = "red"; 
  }
  else{
   this.col = "yellow"; 
  }
 }
 
 String getState(){
   return this.col; 
 }
}