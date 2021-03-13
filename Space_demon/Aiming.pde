class Aiming{
  float x, y;
  PVector pos;
  
  Aiming (){//aiming X
    x = mouseX;
    y=mouseY;
    pos = new PVector (x, y);
  }
  
  void draws(){
    fill(230);
    rectMode(CENTER);
    rect(pos.x,pos.y, 2, 13);
    rect(pos.x,pos.y, 13, 2);
 pos.x = mouseX;
    pos.y=mouseY;
  }
}
