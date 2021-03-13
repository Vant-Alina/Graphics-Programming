class Enemy{
  PVector pos, accelr, speed; 
  float x, y; 
   color Col;
   boolean is_boss=false;
   float is_killed;//controlls opacity of enemies
  
  Enemy(float _x, float _y){//usual
    x=_x;
    y=_y;
    is_killed = 255;
    pos = new PVector(x, y);
    Col = color(random(40, 70), random(90, 130), random(140,  190));
   
}
 void set_kill(float k)
 {
   is_killed += k;
 }


Enemy(){//boss
is_killed = 255;
   Col= color(random(110, 210), random(40, 70), random(40, 70));
    x = random(20, 380);
    y = random(20, 280);
    pos = new PVector(x, y);
    speed = new PVector(0,0);
    is_boss=true;
     
}



  void display(Player pl){
    strokeWeight(2.2);
    stroke(Col, is_killed);
    rectMode(CENTER);
    noFill();
     rect(pos.x, pos.y, 13, 10);
     rect(pos.x, pos.y-10, 8, 5);
     rect(pos.x-13, pos.y, 5, 8);
     rect(pos.x+13, pos.y, 5, 8);
     
  if(is_boss){   

      pos.limit(pl.pos.y-20);//This's a funny thing. You're a demon so you scare away your "enemies"

     accelr=PVector.sub(pl.pos.add(sin(PI/7), sin(PI/2)),pos);//this part of code was adopted from the book of Daniel Shiffman
     accelr.setMag(sin(PI/2)*2);
     speed.add(accelr);
     speed.limit(3);
     pos.add(speed);
  }

  }
  
  
}
