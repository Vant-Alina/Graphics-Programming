//Since many functions are not allowed I decided to create a separate file
//with full code
//Mainly, the difference is only in backgrounds (there're interactive stars and 
//a pattern of rectangles)

import com.hamoid.*;
VideoExport videoExport;


Star[] stars = new Star[400];
Player player = new Player();
Enemy[] enemies = new Enemy[9];
Fire bullets = new Fire (player);
Aiming aim = new Aiming();//aim to fire, then press lmb to shoot

float speed_st;
float is_killed;
  float angle;

void setup(){
  size(400, 400);
  //stars initialization
     videoExport = new VideoExport(this, "myVideo.mp4");
  videoExport.setFrameRate(30);  
  videoExport.startMovie();
   for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
  
  
  float x = 55, y = 40;//enemy generation
   for (int i = 0; i < enemies.length-1; i++) {
    enemies[i] = new Enemy(x, y);
    x+=100;
    if (i==3){
   x =60;
    y+= 100;
    }  
   
  }
 enemies[enemies.length-1] = new Enemy();//boss

}






void draw(){
    videoExport.saveFrame();
  background(#101421);
  if(millis() < 5000){//SCEEN #1 
    start_scr();
  }
   else{
     if(millis() < 60000){
         main_scr();
       ///code of game
      
       if(!player.is_dead(enemies)){//player
       player.show();
       player.move();

       for (int i = 0; i < enemies.length; i++) {//here our enemies
           enemies[i].display(player);
            enemies[i].set_kill(-is_killed);

       }
       
        aim.draws();//BuLLETS
       if(mousePressed){
       bullets.move(aim, player);
         is_killed=bullets.disp(aim, enemies);

    }
       
       
       }else{
         end_screen();
       }


             
     }
     else{
        end_screen();//SCREEN #3
     }
      
    }
   
 }








void start_scr(){
    speed_st = map(mouseX/5, 1, width, 2.5, 30);
   translate(width/2+90, height/2+40);
   for (int i = 0; i < stars.length; i++) {
    stars[i].move();
    stars[i].on_screen();
      

   }
   text_scr();
}



void end_screen(){
  background(#3F4346);
    for(int i = 0; i < 100;i++){//NOISE
      fill(map(i, 0, 500, 100, 220));
       for(int j = 0; j < 60;j++){
         rectMode(CENTER);
         noStroke();
      rect(random(3, 399), random(3, 399), random(3, 10), random(1, 2));
  
    }
  }
}


void text_scr(){

  fill(random(140, 240));//TEXT
 PFont myFont = createFont("OCR A Extended", 50);// SCREEN #1
  textFont(myFont);
  textAlign(CENTER, CENTER);
  text("SPACE DEMON", -80, -160);  
  textSize(13);
 textAlign(RIGHT, RIGHT);
  text("You're a summoned d e m o n"+
  "\n"+ "to a space battle."+
  "\n"+ "Only one minute to"+
  "\n"+ "fulfill your duty to"+
  "\n"+ "your invoker.", 90, -80);
  
 fill(random(110, 210), random(40, 70), random(40, 70));
 PFont myFont1 = createFont("Lucida Fax Demibold Italic", random(47,50));
 textFont(myFont1);
  text("K I L L", -60, 55);
}



void main_scr(){//the code was modified (thedotisblack)
pushMatrix();
  translate (width/2, height/2);
  rectMode(CENTER);
  stroke(40, 40, 90, 160);
  noFill();
  strokeWeight(3);
  for(int i=0; i < 10; i++){
rotate(radians(angle));
scale(0.7);
rect(0,0, 400, 400);
}
popMatrix();
angle++;
}

 
