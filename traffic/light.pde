class Light{
 String col, dir;
 int x,y;
 Light(int x, int y, String dir){
     this.x = x;
     this.y = y;
     this.col = "red";
     this.dir = dir;
     
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
   if(dir.equals("v")){
    fill(0);
    rect(this.x, this.y-20, 25, 5);
    triangle(this.x+25, this.y-25, this.x+25, this.y-10, this.x+32, this.y-18);
   }
   else{
     fill(0);
     rect(this.x+10, this.y-40, 5, 25);
     triangle(this.x+5, this.y-40, this.x+12, this.y-47, this.x+20, this.y-40);
   }
 }
 
 void toggleLight(String col){
   if(col.equals("red") || col.equals("yellow") || col.equals("green")){
    this.col=col;
   }
 }

 
 String getState(){
   return this.col; 
 }
}