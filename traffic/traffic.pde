Light l = new Light(260,200, "v");
Light l2 = new Light(510,550, "h");

int car_width = 50;
int car_height = 70;
int right_lane = 430;
int left_lane = 325;

//intersection boundaries
int inter_st = 300;
int inter_end = 500;
int time = second();

Car car = new Car(0, right_lane, car_height, car_width, 2, random_color(255), "h"); //left  //(init_x, init_y, car_width, car_len, vx, vy, color)
Car top = new Car(left_lane, 0, car_width, car_height, 2, random_color(255), "v"); //top
Car bot = new Car(right_lane, 770 - car_height, car_width, car_height, -2, random_color(255), "v"); //bottom
Car right = new Car(780 - car_width, left_lane, car_height, car_width, -2, random_color(255), "h"); //right

color random_color(int v){
  return color(random(v), random(v), random(v));      
}

void drawRoad(){
 fill(120);
 noStroke();
 
 //road
 rect(0, 300, width, 200);
 rect(300, 0, 200, height);
 
 fill(240,240,0); //yellow line
 rect(0,395,300,10); //left 
 rect(395,0,10,300); //top 
 rect(395,500,10,300); //bottom
 rect(500,395,300,10); //right
 
 fill(240);
 rect(300, 295, 200, 5);
 rect(300, 500, 200, 5);
 rect(295, 300, 5, 200);
 rect(500, 300, 5, 200);
}

void setup(){
  size(800,800);
  background(0,250,150);
}

void draw(){
  drawRoad();
  l.drawLight();
  l2.drawLight();
  lightSync();
  
  car.drawCar();
  bot.drawCar();
  top.drawCar();
  right.drawCar();
  
  // car behaviour depending on light state
  whatdo(car, l, inter_st, 1); //horizontal
  whatdo(right, l, inter_end, -1); //vertical
  whatdo(top, l2, inter_st, 1); //h
  whatdo(bot, l2, inter_end, -1); //v
  print(car.getPos());
  print('\n');
  
}

// insersection marks beginning of intersection, direction is pos/neg depending on movement
void whatdo(Car c, Light l, int intersection_start, int direction){
  switch (l.getState()){
    case "green": 
      c.drive(c.get_start_v());
      break;
    case "yellow":
      yellow_light(c, intersection_start, direction);
      break;
    case "red":
      red_light(c, intersection_start, direction);      
      break;
  }
}
  
void yellow_light(Car c, int intersection_start, int direction){
  if (direction < 0){ //going backwards
        if (c.getDir().equals("h")){ //side to side
          if (c.getX() > intersection_start){
            if (c.getV() != 0 &&  c.getV()/2 != 0){
              c.drive(c.getV()/2); 
            }else {
            c.drive(c.get_start_v()); 
          }    
        } else{
          c.drive(c.get_start_v());  
        }
      } else { //up down driving car going backwards
        if (c.getY() > intersection_start){
          if (c.getV() != 0 &&  c.getV()/2 != 0){
            c.drive(c.getV()/2); 
          }else {
            c.drive(c.get_start_v()); 
          }    
        } else{
          c.drive(c.get_start_v());  
        }    
      }
    } else{//going forward
      if (c.getDir().equals("h")){ //side to side
        if (c.getX() < intersection_start){
          if (c.getV() != 0 &&  c.getV()/2 != 0){
            c.drive(c.getV()/2); 
          }else {
            c.drive(c.get_start_v()); 
          }    
        } else{
          c.drive(c.get_start_v());  
        }
      } else { //up down driving car going forward
        if (c.getY() < intersection_start){
          if (c.getV() != 0 &&  c.getV()/2 != 0){
            c.drive(c.getV()/2); 
          }else {
            c.drive(c.get_start_v()); 
          }    
        } else{
          c.drive(c.get_start_v());  
        }    
      }
      
    }
}

void red_light(Car c, int intersection_start, int direction){
  if (direction < 0){
    if (c.getPos() < intersection_start - car_height || c.getPos() + 100 > intersection_start + 100){
      c.drive(c.get_start_v());
    }else{
      print("stopping");
      c.drive(0);
    }
  }else {
    if (c.getPos() > intersection_start || c.getPos() < intersection_start-car_height){
      c.drive(c.get_start_v());
    }else{
      c.drive(0);
    }
  }  
}

void lightSync(){
   int time = second();
   if(time == 0){
     l2.toggleLight("red");
   }
   else if(time == 2){
    l.toggleLight("green"); 
   }
   else if(time == 25){
     l.toggleLight("yellow");
   }
   else if(time == 30){
    l.toggleLight("red");
   }
   else if(time == 32){
    l2.toggleLight("green"); 
   }
   else if(time == 59){
    l2.toggleLight("yellow"); 
   }
   
}