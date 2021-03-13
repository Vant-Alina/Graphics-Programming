class Star {// map is like proporational and ranged defined function, difference are second and third values
  float x, y, z, _z;


  Star() {
    x = random(-width/2, height/2);
    y = random(-width/2, height/2);
    z = random(width/2);
    _z = z;//DO I NEED THIS
  }

  void move() {
    z -= speed_st;
    if (z < 1) {//MAKE 1 BIGGER
      z = width/2;//mb do rand
      x = random(-width/2, height/2);
      y = random(-width/2, height/2);
      _z = z;
    }
  }
  
  
  
   void on_screen() {
    fill(random(100, 225));
    noStroke();   
    //  _x and _y move faster at each frame
    float _x = map(x / z, 0, 1, 0, width/2);
    float _y = map(y / z, 0, 1, 0, height/2);
    // to create sence of motion make stars increase in size
    float b = map(z, 1, width/2, random(1, 7), 0);
    ellipse(_x, _y, b, b);

    float x_ = map(x / _z, 0, 1, 1, width/2);//draw motion line
    float y_ = map(y / _z, 0, 1, 1, height/2);
    _z = z;
    stroke(random(100, 205));
    quad(x_, y_,_x, _y+1, _x+1, _y+2, x_, y_);

  }
}
