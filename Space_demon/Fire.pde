class Fire{
  float sp;
  PVector pos, accelr, vel; 
  boolean is_disposed = false;
  
  Fire(Player pl){
  sp = 4.7;
    pos = new PVector (pl.pos.x, pl.pos.y-30);
    vel = new PVector (0, 0);// 1 1
    vel.mult(sp);
  }
  
  void move(Aiming am, Player pl){
    
    if(!is_disposed){
   fill(222);
   ellipse(pos.x, pos.y, 2 , 4);
     accelr=PVector.sub(am.pos.add(sin(PI/7), 2),pos);
     vel.add(accelr);
     vel.limit(15);
     pos.add(vel);
    }
    else{
       pos = new PVector (pl.pos.x, pl.pos.y-30);
    vel = new PVector (0, 0);// 1 1
    vel.mult(sp);
    is_disposed = false;
    }
  }
  
  
  
  
  float disp(Aiming aim, Enemy[] enms){//function that "kills" everything that might be killed by bullets
    if(pos.dist(aim.pos) <10){//dissappear once get to the aim
          is_disposed = true;

    }
    float tmp =0;
    for (int i = 0; i < enms.length; i++) {
      if(pos.dist(enms[i].pos) <10){
          is_disposed = true;
             tmp += random (-10, 20);
    }
    }
     return tmp;
  }
}
