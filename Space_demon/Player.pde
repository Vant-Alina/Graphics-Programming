 class Player{
   boolean dead = false;
    PVector pos, vel;
    float x, y, speed=2;
   
   Player(){
       x=170;
      y=350;
      pos = new PVector (x, y);
   }
   
   
   void show(){//ship of the demon
      noStroke();
    fill(#B7AFAC, 220);//main body
    triangle(pos.x-6, pos.y-2,  pos.x+6, pos.y-2,pos.x,    pos.y+20);
    triangle(pos.x-2, pos.y+10, pos.x, pos.y+17, pos.x-18, pos.y+23);
    triangle(pos.x+2, pos.y+10, pos.x, pos.y+17, pos.x+18, pos.y+23);
    fill(#C9BCB7, 230);//bottom shooter
    ellipse(pos.x, pos.y+17, 7, 7); 
    fill(#AA9B95);//head
    ellipse(pos.x, pos.y-10, 25, 25);
     fill(#CCAAA9);
    ellipse(pos.x, pos.y-10, 19, 19);
    fill(#F4D4D1,210);
    ellipse(pos.x, pos.y-10, 13, 13);
    
    float fl=sin(radians(frameCount)*5);
    triangle(pos.x-3, pos.y+18, pos.x-22, pos.y+37+fl, pos.x-20, pos.y+28+fl);
    triangle(pos.x+3, pos.y+18, pos.x+22, pos.y+37+fl, pos.x+20, pos.y+28+fl);
    
    fill(random(110, 210), random(40, 80), random(40, 80));
    triangle(pos.x-5, pos.y-24, pos.x-8, pos.y-31, pos.x-12, pos.y-18);
    triangle(pos.x+5, pos.y-24, pos.x+8, pos.y-31, pos.x+12, pos.y-18);

    
    for(int i = 0; i<40;i++){//fuel drops
      float s =random(0.5, 3);
      fill(random(110, 210), random(40, 110), random(40, 110));
      ellipse(pos.x, pos.y+s+20+ tan(radians(frameCount)*10), s, s); 
    }
    
 
   
 
   }
   
   
   
   void move(){
     pos.limit(400);
    // if (keyPressed) {
        if(pos.x>=0){       

      if (key == 'a') {
   pos.x-=speed;
  }
   if (key == 'd') {
     pos.x+=speed;
  }
      }else {pos.x=0;}

   if(pos.y>=0){       
 if (key == 'w') {
   pos.y-=speed;
  }
 
  if (key == 's') {
       pos.y+=speed;
  }
  //  } else {pos.y=400;}
   }else {pos.y=0;}
 //  }
 }
   
   
   
   boolean is_dead(Enemy[] enm){
     for(int i = 0; i < enemies.length; i++) {
     float tmp =pos.dist(enm[i].pos);
     println(tmp);
     if(tmp-40<=0){dead= true; break;}
     
     }
     return dead;
   }
}
