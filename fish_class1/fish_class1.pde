//import http.requests.*;

//import processing.serial.*;
int Something = 0;
//Serial myPort; //create object from Serial class


class Fish {
  float xpos;
  float ypos;
  float xspeed;
  color c;

  Fish(color tempC, float tempXpos, float tempYpos, float tempXspeed) {
    //traits of a fish: color, location, speed
    c = tempC;
    xspeed=tempXspeed;
    xpos=tempXpos;
    ypos=tempYpos;
  }

  void display() {
    fill(c);
    noStroke();
    ellipse(xpos, ypos, 40, 20);  //body
    triangle(xpos-5, ypos+5, xpos+5, ypos+5, xpos+10, ypos+25); //bottom fin
    triangle(xpos-5, ypos-5, xpos+5, ypos-5, xpos+10, ypos-25); //top fin
    triangle(xpos+18, ypos, xpos+28, ypos, xpos+35, ypos+35);  //bottom tail
    triangle(xpos+18, ypos, xpos+28, ypos, xpos+35, ypos-35);  //top tail
    fill (0);
    ellipse(xpos-13, ypos-4, 3, 3); 
    stroke(1);
    strokeWeight(1);
    noFill();
    arc(xpos-15, ypos, 10, 10, 0, PI/2); //x, y, width, height, start, stop (angle in radians)
    noStroke();
  }

  void swim() {
    float Something1 = Something/10 + xspeed;
    xpos=xpos-Something1;
    if (xpos <1) {
      xpos=width;
    }
  }
}


class PufferFish {
  float xpos;
  float ypos;
  float xspeed;


  PufferFish(float tempXpos, float tempYpos, float tempXspeed) {
    xspeed=tempXspeed;
    xpos=tempXpos;
    ypos=tempYpos;
  }

  void display() {
    fill(250);
    noStroke();
    ellipse(xpos, ypos, 40, 40);  //body
    triangle(xpos+18, ypos, xpos+28, ypos, xpos+30, ypos+10);  //right fin
    triangle(xpos+18, ypos, xpos+28, ypos, xpos+30, ypos-10);  //right fin
    triangle(xpos-18, ypos, xpos-28, ypos, xpos-30, ypos+10);  //left fin
    triangle(xpos-18, ypos, xpos-28, ypos, xpos-30, ypos-10);  //left fin
    fill (0);
    ellipse(xpos-7, ypos-4, 3, 3); 
    ellipse(xpos+7, ypos-4, 3, 3);
    stroke(1);
    strokeWeight(1);
    noFill();
    arc(xpos, ypos+5, 13, 10, 0, PI); //x, y, width, height, start, stop (angle in radians)
    noStroke();
  }

  void display2() {
    fill(250);
    noStroke();
    ellipse(xpos, ypos, 80, 80);  //body
    triangle(xpos+38, ypos, xpos+48, ypos, xpos+50, ypos+10);  //right fin
    triangle(xpos+38, ypos, xpos+48, ypos, xpos+50, ypos-10);  //right fin
    triangle(xpos-38, ypos, xpos-48, ypos, xpos-50, ypos+10);  //left fin
    triangle(xpos-38, ypos, xpos-48, ypos, xpos-50, ypos-10);  //left fin
    fill (0);
    ellipse(xpos-7, ypos-4, 3, 3); 
    ellipse(xpos+7, ypos-4, 3, 3);
    stroke(1);
    strokeWeight(1);
    noFill();
    arc(xpos, ypos+5, 13, 10, 0, PI); //x, y, width, height, start, stop (angle in radians)
    noStroke();
  }

  void swim() {
    xpos=xpos-xspeed;
    if (xpos <1) {
      xpos=width;
    }
  }
}

class Kelp {
  color c;
  float xpos;
  float ypos;
  float swaySpeed;
  float tall;
  float strokeThickness;
  float fixedxpos;
  float swayWidth;
  float bottom;

  //traits of kelp: color, x postition, height, thickness, sway speed, sway width
  Kelp (color tempC, float tempfixedxpos, float tempXpos, float tempbottom, float temptall, float tempstrokeThickness, 
    float tempswaySpeed, float tempswayWidth ) { 
    c = tempC;
    swaySpeed=tempswaySpeed;
    xpos=tempXpos;
    //ypos=tempYpos;
    tall=temptall;
    strokeThickness=tempstrokeThickness;
    fixedxpos = tempfixedxpos;
    swayWidth = tempswayWidth;
    bottom = tempbottom;
  }

  void display () {
    noFill();
    stroke(c);
    beginShape();
    strokeWeight(strokeThickness);
    vertex(fixedxpos, bottom); // first point
    float ypos=bottom-tall;
    bezierVertex(xpos-swayWidth, ypos+tall/3, xpos+swayWidth, ypos+tall/2, xpos, ypos); //first control, second control, next point on curve
    endShape();
    noStroke();
  }

  void swayLeft() {
    xpos = xpos - swaySpeed;
  }

  void swayRight() {
    xpos = xpos + swaySpeed;
  }


  int state = 0;
  void sway() {
    if (state ==0) {
      swayRight();
      if (xpos > fixedxpos+swayWidth) {
        state = 1;
      }
    }
    if (state ==1) {
      swayLeft();
      if (xpos < fixedxpos-swayWidth) {
        state = 0;
      }
    }
  }
}

class Jellyfish {
  float xpos;  //starting x
  float ypos;  //starting y
  float xspeed; //increment for movement in x direction
  float size;  
  float xpos2;
  float swayspeed;


  Jellyfish (float tempxpos, float tempypos, float tempxspeed, float tempswayspeed, float tempsize) { 
    xpos=tempxpos;
    ypos=tempypos;
    xspeed = tempxspeed;
    size = tempsize;
    xpos2 = tempxpos;
    swayspeed = tempswayspeed;
  }

  void display () {
    fill(250, 0, 250); 
    noStroke();
    ellipse(xpos2, ypos, size, size-size/2);
    stroke(250, 0, 250);
    beginShape();
    strokeWeight(size/20);
    noFill();
    vertex(xpos2, ypos); // first point
    bezierVertex(xpos-size, ypos+size/3, xpos+size, ypos+size/2+size, xpos2, ypos+size+size); //first control, second control, next point on curve
    endShape();
    beginShape();
    strokeWeight(size/20);
    noFill();
    vertex(xpos2+size/2 - size/16, ypos); // first point
    bezierVertex(xpos-size, ypos+size/1.5, xpos+size, ypos+size/2, xpos2+size/2, ypos+size+size); //first control, second control, next point on curve
    endShape();
    beginShape();
    strokeWeight(size/20);
    noFill();
    vertex(xpos2+size/2 - size/4, ypos); // first point
    bezierVertex(xpos-size, ypos+size/4, xpos+size, ypos+size/2.5, xpos2+size/2 -size/4, ypos+size+size/4); //first control, second control, next point on curve
    endShape();
    beginShape();
    strokeWeight(size/20);
    noFill();
    vertex(xpos2+size/2 - size/20, ypos); // first point
    bezierVertex(xpos+size, ypos+size/2-size/4, xpos-size, ypos+size/4+size/2, xpos2, ypos+size+size/2); //first control, second control, next point on curve
    endShape(); 
    noStroke();
  }

  void swayLeft() {
    xpos = xpos - 2*swayspeed;
    jellyfish1.display();
    jellyfish2.display();
    jellyfish3.display();
  }

  void swayRight() {
    xpos = xpos + 2*swayspeed;
    jellyfish1.display();
    jellyfish2.display();
    jellyfish3.display();
  }


  int state = 0;
  float edge1;
  float edge2;
  void sway() {
    edge1 = xpos2+size/2;
    edge2 = xpos2-size/2;
    ypos = ypos - swayspeed;
    xpos2 = xpos2 + xspeed;
    if (ypos < 1) {
      ypos=height;
    }
    if (xpos2 > width) {
      xpos2 = width/4;
      xpos=xpos2;
    }
    if (state ==0) {
      swayRight();
      if (xpos > edge1) {
        state = 1;
      }
    }
    if (state ==1) {
      swayLeft();
      if (xpos < edge2) {
        state = 0;
      }
    }
  }
}

class SquareSpotFish {
  float xpos;
  float ypos;
  float speed;

  SquareSpotFish(float tempxpos, float tempypos, float tempspeed) {
    xpos = tempxpos;
    speed = tempspeed;
    ypos = tempypos;
  }

  void display() {
    fill(255, 150, 0);
    noStroke();
    ellipse(xpos, ypos, 40, 20);  
    triangle(xpos+18, ypos, xpos+28, ypos, xpos+35, ypos+20);
    triangle(xpos+18, ypos, xpos+28, ypos, xpos+35, ypos-20);
    fill (0);
    ellipse(xpos-13, ypos-4, 3, 3); 
    stroke(1);
    strokeWeight(1);
    noFill();
    arc(xpos-15, ypos, 10, 10, 0, PI/2); //x, y, width, height, start, stop (angle in radians)
    noStroke();
    fill(250, 0, 250);
    rect(xpos-2, ypos-5, 10, 10);
  }

  void swim() {
    xpos=xpos-speed;
    if (xpos <1) {
      xpos=width;
    }
  }
}

class Crab {
  float xpos;
  float ypos;
  float size;
  float speed;

  Crab (float tempxpos, float tempypos, float tempsize, float tempspeed) {
    xpos = tempxpos;
    ypos = tempypos;
    size = tempsize;
    speed = tempspeed;
  }

  void display() {
    fill(200, 0, 0);
    stroke(200, 0, 0);
    strokeWeight(2);
    line(xpos-size/3, ypos, xpos-size/3, ypos+size/2);
    line(xpos+size/3, ypos, xpos+size/3, ypos+size/2);
    noStroke();
    ellipse(xpos, ypos, size, size/2);
    pushMatrix();
    translate(xpos-size/4, ypos+size/2);
    rotate(radians(45));
    ellipse(0, 0, size/2, size/4);
    fill(150, 120, 100);
    triangle(0, 0, 0, size/10, size/2, 0);
    popMatrix();
    pushMatrix();
    translate(xpos+size/4, ypos+size/2);
    rotate(radians(135));
    fill(200, 0, 0);
    ellipse(0, 0, size/2, size/4);
    fill(150, 120, 100);
    triangle(0, 0, 0, size/10, size/2, 0);
    popMatrix();
    fill(0, 0, 0);
    ellipse(xpos+5, ypos, 3, 3);
    ellipse(xpos-5, ypos, 3, 3);
  }

  void scuttleLeft() {
    xpos = xpos+speed;
  }

  void scuttleRight() {
    xpos = xpos-speed;
  }

  int state =0;
  void scuttle() {
    if (state ==0) {
      scuttleLeft();
      if (xpos > width) {
        state = 1;
      }
    } else {
      scuttleRight();
      if (xpos <0) {
        state=0;
      }
    }
  }
}

class Anenome {
  float xpos;
  float ypos;
  float size;
  Kelp kelpA;
  Kelp kelpB;
  Kelp kelpC;
  Kelp kelpD;
  Kelp kelpE;
  Kelp kelpF;
  Kelp kelpG; 

  //traits of kelp: color, x postition, xpos, ypos, height, thickness, sway speed, sway width

  Anenome(float tempxpos, float tempypos, float tempsize) {
    xpos = tempxpos;
    ypos = tempypos;
    size = tempsize;
    kelpA=new Kelp(color(200, 200, 0), xpos, xpos, ypos, size/2, size/20, 0.5, 3);
    kelpB=new Kelp(color(200, 200, 0), xpos+size/2, xpos+size/2, ypos, size/2, size/20, 0.05, 4);
    kelpC=new Kelp(color(200, 200, 0), xpos+size/3, xpos+size/3, ypos, size/2, size/20, 0.2, 6);
    kelpD=new Kelp(color(200, 200, 0), xpos+size/2-size/3, xpos+size/2-size/2, ypos, size/2, size/20, 0.4, 2);
    kelpE=new Kelp(color(200, 200, 0), xpos-size/4, xpos-size/4, ypos, size/2, size/20, 0.3, 7);
    kelpF=new Kelp(color(200, 200, 0), xpos-size/2, xpos-size/2, ypos, size/2, size/20, 0.6, 5);
    kelpG=new Kelp(color(200, 200, 0), xpos-size/2+size/3, xpos-size/2+size/3, ypos, size/2, size/20, 0.1, 8);
  }

  void displayNormal() {
    fill(250, 150, 0);
    ellipse (xpos, ypos, size, size/2);
    kelpA.sway();
    kelpA.display();
    kelpB.sway();
    kelpB.display();
    kelpC.sway();
    kelpC.display();
    kelpD.sway();
    kelpD.display();
    kelpE.sway();
    kelpE.display();
    kelpF.sway();
    kelpF.display();
    kelpG.sway();
    kelpG.display();
  }

  void displayCollision() {
    fill(250, 150, 0);
    ellipse (xpos, ypos, size, size/2);
  }
}

class Submarine {
  float xpos;
  float ypos;
  float speed;

  Submarine(float tempxpos, float tempypos, float tempspeed) {
    xpos = tempxpos;
    speed = tempspeed;
    ypos = tempypos;
  }

  void display() {
    fill(250, 250, 0);
    noStroke();
    ellipse(xpos, ypos, 150, 50);  
    rect(xpos, ypos-80, 10, 80);
    rect(xpos-15, ypos-80, 15, 10);
    fill (0, 0, 200);
    stroke(1);
    strokeWeight(1);
    ellipse (xpos-40, ypos, 10, 10);
    ellipse (xpos-20, ypos, 10, 10);
    ellipse (xpos, ypos, 10, 10);
    ellipse (xpos+20, ypos, 10, 10);
    ellipse (xpos+40, ypos, 10, 10);
    noFill();
    noStroke();
  }

  void move() {
    xpos=xpos-speed;
    if (xpos <1) {
      xpos=width;
    }
  }
}

class TinyFish {
  float xpos;
  float ypos;
  float xspeed;
  float absypos;
  float toggle = 0;
  float yspeed;

  TinyFish(float tempxpos, float tempypos, float tempxspeed, float tempyspeed) {
    xpos = tempxpos;
    xspeed = tempxspeed;
    ypos = tempypos;
    absypos = tempypos;
    yspeed = tempyspeed;
  }

  void display() {
    fill(250, 250, 0);
    noStroke();
    ellipse(xpos, ypos, 10, 7);  
    triangle(xpos+2, ypos, xpos+10, ypos, xpos+12, ypos+10);
    triangle(xpos+2, ypos, xpos+10, ypos, xpos+12, ypos-10);
    fill (0);
    ellipse(xpos-3, ypos-2, 2, 2); 
    stroke(1);
    strokeWeight(1);
    noFill();
    arc(xpos-5, ypos, 4, 4, 0, PI/2); //x, y, width, height, start, stop (angle in radians)
    noStroke();
  }

  void swim() {
    xpos=xpos-xspeed;
    if (xpos <1) {
      xpos=width;
      absypos = random(schooloffish1.yposRangeLow, schooloffish1.yposRangeHigh);
      ypos = absypos;
    }
    if (toggle == 0) {
      ypos=ypos-yspeed;
      if (ypos < absypos-20) {
        toggle = 1;
      }
    } else if (toggle == 1) {
      ypos = ypos +yspeed;
      if (ypos > absypos+20) {
        toggle = 0;
      }
    }
  }
}

class SchoolOfFish {
  float yposRangeLow;
  float yposRangeHigh;
  float speedRangeLow;
  float speedRangeHigh;
  float yspeedLow;
  float yspeedHigh;
  TinyFish tinyfish1;
  TinyFish tinyfish2;
  TinyFish tinyfish3;
  TinyFish tinyfish4;
  TinyFish tinyfish5;
  TinyFish tinyfish6;


  SchoolOfFish(float tempyposRangeLow, float tempyposRangeHigh, float tempspeedRangeLow, float tempspeedRangeHigh, 
    float tempyspeedLow, float tempyspeedHigh) {
    yposRangeLow = tempyposRangeLow;
    yposRangeHigh=tempyposRangeHigh;
    speedRangeLow=tempspeedRangeLow;
    speedRangeHigh=tempspeedRangeHigh;
    yspeedLow = tempyspeedLow;
    yspeedHigh = tempyspeedHigh;
    tinyfish1 = new TinyFish(width, random(yposRangeLow, yposRangeHigh), random(speedRangeLow, speedRangeHigh), random(yspeedLow, yspeedHigh));
    tinyfish2 = new TinyFish(width, random(yposRangeLow, yposRangeHigh), random(speedRangeLow, speedRangeHigh), random(yspeedLow, yspeedHigh));
    tinyfish3 = new TinyFish(width, random(yposRangeLow, yposRangeHigh), random(speedRangeLow, speedRangeHigh), random(yspeedLow, yspeedHigh));
    tinyfish4 = new TinyFish(width, random(yposRangeLow, yposRangeHigh), random(speedRangeLow, speedRangeHigh), random(yspeedLow, yspeedHigh));
    tinyfish5 = new TinyFish(width, random(yposRangeLow, yposRangeHigh), random(speedRangeLow, speedRangeHigh), random(yspeedLow, yspeedHigh));
    tinyfish6 = new TinyFish(width, random(yposRangeLow, yposRangeHigh), random(speedRangeLow, speedRangeHigh), random(yspeedLow, yspeedHigh));
  }

  void display() {
    tinyfish1.swim();
    tinyfish1.display();
    tinyfish2.swim();
    tinyfish2.display();
    tinyfish3.swim();
    tinyfish3.display();
    tinyfish4.swim();
    tinyfish4.display();
    tinyfish5.swim();
    tinyfish5.display();
    tinyfish6.swim();
    tinyfish6.display();
  }
}

class Bubble {
  float xpos;
  float absxpos;
  float ypos;
  float absypos;
  float xspeed;
  float yspeed;
  float size;
  float toggle = 0;

  Bubble(float tempxpos, float tempypos, float tempxspeed, float tempyspeed, float tempsize) {
    xpos = tempxpos;
    absxpos = tempxpos;
    xspeed = tempxspeed;
    ypos = tempypos;
    absypos = tempypos;
    yspeed = tempyspeed;
    size = tempsize;
  }

  void display() {
    noFill();
    stroke(0);
    strokeWeight(1);
    ellipse(xpos, ypos, size, size);  
    noStroke();
  }

  void swim() {
    ypos=ypos-yspeed;
    if (ypos <1) {
      ypos = absypos;
    }
    if (toggle == 0) {
      xpos=xpos-xspeed;
      if (xpos < absxpos-20) {
        toggle = 1;
      }
    } else if (toggle == 1) {
      xpos = xpos +xspeed;
      if (xpos > absxpos+20) {
        toggle = 0;
      }
    }
  }
}

//pass a random number of bubbles... 
class Bubbles {
  float numBubbles;
  float xpos;
  float ypos;
  float xspeedLow;
  float xspeedHigh;
  float yspeedLow;
  float yspeedHigh;
  float sizeLow;
  float sizeHigh;
  Bubble bubble1;
  Bubble bubble2;
  Bubble bubble3;
  Bubble bubble4;
  Bubble bubble5;
  Bubble bubble6;

  Bubbles(float tempnumBubbles, float tempxpos, float tempypos, float tempxspeedLow, float tempxspeedHigh, 
    float tempyspeedLow, float tempyspeedHigh, float tempsizeLow, float tempsizeHigh) {
    numBubbles = tempnumBubbles;
    xpos = tempxpos;
    ypos = tempypos;
    xspeedLow = tempxspeedLow;
    xspeedHigh = tempxspeedHigh;
    yspeedLow = tempyspeedLow;
    yspeedHigh = tempyspeedHigh;
    sizeLow = tempsizeLow;
    sizeHigh = tempsizeHigh;
    bubble1 = new Bubble(xpos, ypos, random(xspeedLow, xspeedHigh), random(yspeedLow, yspeedHigh), random(sizeLow, sizeHigh));
    bubble2 = new Bubble(xpos, ypos, random(xspeedLow, xspeedHigh), random(yspeedLow, yspeedHigh), random(sizeLow, sizeHigh));
    bubble3 = new Bubble(xpos, ypos, random(xspeedLow, xspeedHigh), random(yspeedLow, yspeedHigh), random(sizeLow, sizeHigh));
    bubble4 = new Bubble(xpos, ypos, random(xspeedLow, xspeedHigh), random(yspeedLow, yspeedHigh), random(sizeLow, sizeHigh));
    bubble5 = new Bubble(xpos, ypos, random(xspeedLow, xspeedHigh), random(yspeedLow, yspeedHigh), random(sizeLow, sizeHigh));
    bubble6 = new Bubble(xpos, ypos, random(xspeedLow, xspeedHigh), random(yspeedLow, yspeedHigh), random(sizeLow, sizeHigh));
  }

  void display() {
    bubble1.swim();
    bubble1.display();
    bubble2.swim();
    bubble2.display();
    bubble3.swim();
    bubble3.display();
    bubble4.swim();
    bubble4.display();
    bubble5.swim();
    bubble5.display();
    bubble6.swim();
    bubble6.display();
  }
}

class Clam {
  float xpos;
  float ypos;
  float size;

  Clam (float tempxpos, float tempypos, float tempsize) {
    xpos = tempxpos;
    ypos = tempypos;
    size = tempsize;
  }

  void display() {
    fill(200, 200, 200);
    ellipse(xpos, ypos, size, size/2);
    pushMatrix();
    translate(xpos, ypos+size/4);
    rotate(radians(15));
    ellipse(0, 0, size, size/2);
    popMatrix();
    pushMatrix();
    translate(xpos, ypos+size/4);
    rotate(radians(30));
    ellipse(0, 0, size, size/2);
    popMatrix();
    pushMatrix();
    translate(xpos, ypos+size/4);
    rotate(radians(60));
    ellipse(0, 0, size, size/2);
    popMatrix();
    pushMatrix();
    translate(xpos-size/4, ypos+size/4);
    rotate(radians(90));
    ellipse(0, 0, size, size/2);
    popMatrix();
    pushMatrix();
    translate(xpos-size/2, ypos+size/4);
    rotate(radians(110));
    ellipse(0, 0, size, size/2);
    popMatrix();
    pushMatrix();
    translate(xpos-size/2, ypos+size/4);
    rotate(radians(140));
    ellipse(0, 0, size, size/2);
    popMatrix();
    triangle(xpos, ypos, xpos-size, ypos, xpos, ypos-size/2-size/4);
  }
}

class Rock {
  float xpos;
  float ypos;


  Rock (float tempxpos, float tempypos ) {
    xpos = tempxpos;
    ypos = tempypos;
  }

  void display() {
    fill(80, 80, 80);
    beginShape();
    vertex(xpos, ypos);
    vertex(xpos+100, ypos);
    vertex(xpos+80, ypos-60);
    vertex(xpos+30, ypos-80);
    vertex(xpos+20, ypos-30);
    endShape();
    noFill();
  }
}

class SeaStar {
  float xpos;
  float ypos;
  // PShape star;

  SeaStar (float tempxpos, float tempypos ) {
    xpos = tempxpos;
    ypos = tempypos;
  }


  // void setup() {
  /*star = createShape();
   star.beginShape();
   // You can set fill and stroke
   star.fill(255, 255, 0);
   // Here, we are hardcoding a series of vertices
   star.vertex(xpos+0, ypos-30);
   star.vertex(xpos+8, ypos-10);
   star.vertex(xpos+27, ypos-5);
   star.vertex(xpos+13, ypos+7);
   star.vertex(xpos+19, ypos+30);
   star.vertex(xpos+0, ypos+15);
   star.vertex(xpos-19, ypos+30);
   star.vertex(xpos-13, ypos+7);
   star.vertex(xpos-27, ypos-5);
   star.vertex(xpos-8, ypos-10);
   star.endShape(CLOSE);*/
  // }

  void display() {
    // shape(star);
    fill (0);
    ellipse(xpos-7, ypos-4, 3, 3); 
    ellipse(xpos+7, ypos-4, 3, 3);
    stroke(1);
    strokeWeight(1);
    noFill();
    arc(xpos, ypos+5, 13, 10, 0, PI); //x, y, width, height, start, stop (angle in radians)
    noStroke();
    fill(255, 255, 0);
    // Here, we are hardcoding a series of vertices
    vertex(xpos+0, ypos-30);
    vertex(xpos+8, ypos-10);
    vertex(xpos+27, ypos-5);
    vertex(xpos+13, ypos+7);
    vertex(xpos+19, ypos+30);
    vertex(xpos+0, ypos+15);
    vertex(xpos-19, ypos+30);
    vertex(xpos-13, ypos+7);
    vertex(xpos-27, ypos-5);
    vertex(xpos-8, ypos-10);
  }
}


class Octopus {
  float xpos;
  float ypos;
  float xspeed; //increment for movement in x direction
  float size;  
  float xpos2;
  float swayspeed;
  float ypos2;

  Octopus (float tempxpos, float tempypos, float tempxspeed, float tempswayspeed, float tempsize) { 
    xpos=tempxpos;
    ypos=tempypos;
    xspeed = tempxspeed;
    size = tempsize;
    xpos2 = tempxpos;
    swayspeed = tempswayspeed;
    ypos2 = tempypos;
  }

  void displayWave() {
    fill(0, 0, 250); 
    noStroke();
    ellipse(xpos2, ypos2, size, size);
    stroke(0, 0, 250);
    //bottom legs
    beginShape();
    strokeWeight(size/4);
    noFill();
    vertex(xpos2, ypos2); // first point, left left
    // xpos2+size, ypos-size, xpos2+size+size/2, ypos+2*size, xpos2+size*2, ypos+size
    bezierVertex(xpos-size, ypos2+size, xpos+size/4, ypos2+size/2+size, xpos-size, ypos2+size+size); //first control, second control, next point on curve
    endShape();
    beginShape();
    strokeWeight(size/4);
    noFill();
    vertex(xpos2+size/2 - size/16, ypos2); // first point, right left
    bezierVertex(xpos+size, ypos2-size/2-size/4, xpos-size/4, ypos2-size/4-size/2, xpos+size, ypos2-size-size); //first control, second control, next point on curve
    endShape();
    beginShape();
    strokeWeight(size/4);
    noFill();
    vertex(xpos2+size/2 - size/4, ypos2); // first point, left right
    bezierVertex(xpos-size/3, ypos2+size/2+size/4, xpos+size/10, ypos2+size/2.5, xpos-size/4, ypos2+size+size); //first control, second control, next point on curve
    endShape();
    beginShape();
    strokeWeight(size/4);
    noFill();
    vertex(xpos2+size/2 - size/20, ypos2); // first point, right right
    bezierVertex(xpos+size/3, ypos2+size/2-size/4, xpos-size/10, ypos2+size/4+size/2, xpos+size/4, ypos2+size+size); //first control, second control, next point on curve
    endShape(); 
    //side legs
    beginShape();
    strokeWeight(size/4);
    noFill();
    vertex(xpos2, ypos2); // first point, left top
    bezierVertex(xpos2-size, ypos, xpos2-size-size/2, ypos+size, xpos2-size*2, ypos+size); //first control, second control, next point on curve
    endShape(); 
    beginShape();
    strokeWeight(size/4);
    noFill();
    vertex(xpos2, ypos2); // first point, right top
    bezierVertex(xpos2+size, ypos, xpos2+size+size/2, ypos+size, xpos2+size*2, ypos+size); //first control, second control, next point on curve
    endShape(); 
    beginShape();
    strokeWeight(size/4);
    noFill();
    vertex(xpos2, ypos2); // first point, left bottom
    bezierVertex(xpos2-size, ypos+size, xpos2-size-size/2, ypos+2*size, xpos2-size*2, ypos+size/2+size); //first control, second control, next point on curve
    endShape(); 
    beginShape();
    strokeWeight(size/4);
    noFill();
    vertex(xpos2, ypos2); // first point, right bottom
    bezierVertex(xpos2+size, ypos+size, xpos2+size+size/2, ypos+2*size, xpos2+size*2, ypos+size/2+size); //first control, second control, next point on curve
    endShape(); 
    noStroke();

    fill (0);
    ellipse(xpos2-7, ypos2-4, 3, 3); 
    ellipse(xpos2+7, ypos2-4, 3, 3);
    stroke(1);
    strokeWeight(1);
    noFill();
    arc(xpos2, ypos2+5, 13, 10, 0, PI); //x, y, width, height, start, stop (angle in radians)
    noStroke();
  }

  void displayNormal () {
    fill(0, 0, 250); 
    noStroke();
    ellipse(xpos2, ypos2, size, size);
    stroke(0, 0, 250);
    //bottom legs
    beginShape();
    strokeWeight(size/4);
    noFill();
    vertex(xpos2, ypos2); // first point, left left
    // xpos2+size, ypos-size, xpos2+size+size/2, ypos+2*size, xpos2+size*2, ypos+size
    bezierVertex(xpos-size, ypos2+size, xpos+size/4, ypos2+size/2+size, xpos-size, ypos2+size+size); //first control, second control, next point on curve
    endShape();
    beginShape();
    strokeWeight(size/4);
    noFill();
    vertex(xpos2+size/2 - size/16, ypos2); // first point, right left
    bezierVertex(xpos+size, ypos2+size, xpos-size/4, ypos2+size/2+size, xpos+size, ypos2+size+size); //first control, second control, next point on curve
    endShape();
    beginShape();
    strokeWeight(size/4);
    noFill();
    vertex(xpos2+size/2 - size/4, ypos2); // first point, left right
    bezierVertex(xpos-size/3, ypos2+size/2+size/4, xpos+size/10, ypos2+size/2.5, xpos-size/4, ypos2+size+size); //first control, second control, next point on curve
    endShape();
    beginShape();
    strokeWeight(size/4);
    noFill();
    vertex(xpos2+size/2 - size/20, ypos2); // first point, right right
    bezierVertex(xpos+size/3, ypos2+size/2-size/4, xpos-size/10, ypos2+size/4+size/2, xpos+size/4, ypos2+size+size); //first control, second control, next point on curve
    endShape(); 
    //side legs
    beginShape();
    strokeWeight(size/4);
    noFill();
    vertex(xpos2, ypos2); // first point, left top
    bezierVertex(xpos2-size, ypos, xpos2-size-size/2, ypos+size, xpos2-size*2, ypos+size); //first control, second control, next point on curve
    endShape(); 
    beginShape();
    strokeWeight(size/4);
    noFill();
    vertex(xpos2, ypos2); // first point, right top
    bezierVertex(xpos2+size, ypos, xpos2+size+size/2, ypos+size, xpos2+size*2, ypos+size); //first control, second control, next point on curve
    endShape(); 
    beginShape();
    strokeWeight(size/4);
    noFill();
    vertex(xpos2, ypos2); // first point, left bottom
    bezierVertex(xpos2-size, ypos+size, xpos2-size-size/2, ypos+2*size, xpos2-size*2, ypos+size/2+size); //first control, second control, next point on curve
    endShape(); 
    beginShape();
    strokeWeight(size/4);
    noFill();
    vertex(xpos2, ypos2); // first point, right bottom
    bezierVertex(xpos2+size, ypos+size, xpos2+size+size/2, ypos+2*size, xpos2+size*2, ypos+size/2+size); //first control, second control, next point on curve
    endShape(); 
    noStroke();

    fill (0);
    ellipse(xpos2-7, ypos2-4, 3, 3); 
    ellipse(xpos2+7, ypos2-4, 3, 3);
    stroke(1);
    strokeWeight(1);
    noFill();
    arc(xpos2, ypos2+5, 13, 10, 0, PI); //x, y, width, height, start, stop (angle in radians)
    noStroke();
  }

  void swayLeft() {
    xpos = xpos - 2*swayspeed;
  }

  void swayRight() {
    xpos = xpos + 2*swayspeed;
  }

  void swayUp() {
    ypos = ypos- swayspeed;
  }

  void swayDown() {
    ypos = ypos+ swayspeed;
  }



  int state = 0;
  int state2 = 2;
  float edge1;
  float edge2;
  float edge3;
  float edge4;

  void sway() {
    edge1 = xpos2+size/2;
    edge2 = xpos2-size/2;
    edge3 = ypos2+size/2;
    edge4 = ypos2;
    //ypos = ypos - swayspeed;
    xpos2 = xpos2 - xspeed;

    if (xpos2 <1) {
      xpos2 = width;
      xpos=xpos2;
    }
    if (state ==0) {
      swayRight();
      if (xpos > edge1) {
        state = 1;
      }
    }
    if (state ==1) {
      swayLeft();
      if (xpos < edge2) {
        state = 0;
      }
    }
    if (state2==2) {
      swayUp();
      if (ypos < edge4) {
        state2 = 3;
      }
    }
    if (state2 == 3) {
      swayDown();
      if (ypos > edge3) {
        state2 = 2;
      }
    }
  }
}

class Seahorse {
  float xpos;
  float ypos;
  float xspeed;


  Seahorse(float tempXpos, float tempYpos, float tempXspeed) {
    xspeed=tempXspeed;
    xpos=tempXpos;
    ypos=tempYpos;
  }

  void display() {
    fill(255, 150, 0);
    noStroke();

    triangle(xpos+8, ypos, xpos+15, ypos, xpos+18, ypos+10);  //bottom tail
    triangle(xpos+8, ypos, xpos+15, ypos, xpos+18, ypos-10);  //top tail
    ellipse(xpos, ypos+20, 25, 25);
    fill(0, 200, 200); 
    ellipse (xpos-4, ypos+17, 15, 15);
    fill(255, 150, 0);
    ellipse(xpos, ypos, 16, 36);  //main body
    ellipse(xpos, ypos-20, 20, 20);
    pushMatrix();
    translate(xpos-2, ypos-10);
    rotate(radians(155));
    rect(0, 0, 15, 8);
    popMatrix();
    fill (0);
    ellipse(xpos-3, ypos-20, 3, 3); 
    stroke(1);
    strokeWeight(1);
    noFill();
    // arc(xpos-5, ypos-5, 10, 10, 0, PI/2); //x, y, width, height, start, stop (angle in radians)
    noStroke();
  }

  void swim() {
    xpos=xpos-xspeed;
    if (xpos <1) {
      xpos=width;
    }
  }
}

//sea cucumber
//sea snail
//seahorse
//octopus ink
Fish fish1;
Fish fish2;
Fish fish3;
Fish fish4;
Fish fish5;
Fish fish6;
Kelp kelp1;
Kelp kelp2;
Kelp kelp3;
Kelp kelp4;
Kelp kelp5;
Kelp kelp6;
Kelp kelp7;
Kelp kelp8;
Kelp kelp9;
SquareSpotFish squarespotfish1;
SquareSpotFish squarespotfish2;
SquareSpotFish squarespotfish3;
Jellyfish jellyfish1;
Jellyfish jellyfish2;
Jellyfish jellyfish3;
PufferFish pufferfish1;
Crab crab1;
Anenome anenome1;
Anenome anenome2;
Submarine submarine1;
SchoolOfFish schooloffish1;
SchoolOfFish schooloffish2;
Bubbles bubbles1;
Bubbles bubbles2;
Rock rock1;
SeaStar seastar1;
Octopus octopus1;
Clam clam1;
Seahorse seahorse1;

//void serialEvent (Serial myPort) {
// get the byte:
//  int inByte = myPort.read();
// print it:
// println(inByte);
//  Something = inByte;
//}

/*
final String PARTICLE_URL = "https://api.particle.io/v1/devices/2a0035001347353236343033/led?access_token=2e6f6a2ad61e6b68746ac161d859366e8d6c69eb";
void doParticle() {
  PostRequest post = new PostRequest(PARTICLE_URL);
  post.addData("args", "wave");
  post.addHeader("Content-Type", "application/x-www-form-urlencoded");
  post.addHeader("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,*//*;q=0.8");
  post.addHeader("Connection", "keep-alive");
  post.send();
  println("Reponse Content: " + post.getContent());
  println("Reponse Content-Length Header: " + post.getHeader("Content-Length"));
}
*/

void setup() {
  //String portName = Serial.list()[2];
  //myPort = new Serial(this, portName, 9600);
  size(800, 500, P2D);
  submarine1=new Submarine(width, 265, 2);
  // traits of fish: color, x, y, speed
  fish1=new Fish(color(200, 0, 0), 250, 70, 0.75);
  fish2=new Fish(color(0, 250, 0), 250, 150, 1);
  fish3=new Fish(color(200, 0, 200), 275, 220, 2);
  fish4=new Fish(color(150, 0, 250), width, 400, 0.75);
  fish5=new Fish(color(250, 250, 0), 600, 350, 1);
  fish6=new Fish(color(0, 0, 200), width, 235, 3);
  //traits of kelp: color, fixed x postition, xpos, height, thickness, sway speed, sway width
  kelp1=new Kelp(color(0, 100, 0), 100, 100, height, 300, 2, .25, 40);
  kelp2=new Kelp(color(0, 100, 100), 200, 200, height, 250, 6, 0.75, 30);
  kelp3=new Kelp(color(0, 200, 0), 80, 80, height, 350, 4, 0.5, 50);
  kelp4=new Kelp(color(0, 175, 0), 500, 500, height, 400, 2, 0.5, 20);
  kelp5=new Kelp(color(0, 90, 0), 600, 600, height, 175, 7, 0.2, 35);
  kelp6=new Kelp(color(0, 220, 0), 720, 720, height, 350, 3, 0.3, 45);
  kelp7=new Kelp(color(0, 255, 0), 50, 50, height, 450, 5, 0.3, 20);
  kelp8=new Kelp(color(0, 90, 0), 70, 70, height, 220, 7, 0.45, 60);
  kelp9=new Kelp(color(0, 168, 0), 140, 140, height, 160, 6, 0.6, 45);
  squarespotfish1 = new SquareSpotFish(width, 60, 0.85); //x, y, speed
  squarespotfish2 = new SquareSpotFish(width, 300, .5);
  squarespotfish3 = new SquareSpotFish(width, 200, 2.1);
  //traits of jellyfish: x start, y start, x speed, sway speed, size
  jellyfish1 = new Jellyfish(300, 300, 0.25, 1.5, 50);
  jellyfish2 = new Jellyfish(100, 450, 0.75, 0.8, 35);
  jellyfish3 = new Jellyfish(400, 200, 0.5, 0.4, 70);
  pufferfish1 = new PufferFish(570, 275, 0.25);
  crab1=new Crab(45, 455, 30, 1);
  anenome1=new Anenome(250, 480, 50); 
  anenome2=new Anenome(400, 470, 30); 
  schooloffish1 = new SchoolOfFish(100, 200, 1, 1.2, 0.4, 0.8);
  schooloffish2 = new SchoolOfFish(100, 200, 1.8, 2, 0.8, 1);
  //float tempnumBubbles, float tempxpos, float tempxspeedLow, float tempxspeedHigh,
  // float tempyspeedLow, float tempyspeedHigh, float tempsizeLow, float tempsizeHigh
  bubbles1 = new Bubbles(0, 200, height, 0.5, 2, 2, 5, 3, 10);
  rock1 = new Rock(600, height);
  seastar1 = new SeaStar(650, 470);
  octopus1 = new Octopus(width, 200, 1, 1, 40);
  clam1 = new Clam(530, 470, 20);
  bubbles2 = new Bubbles(0, clam1.xpos, clam1.ypos, 0.2, 1.2, 1, 3, 5, 15);
  seahorse1 = new Seahorse(width, 330, 1.5);
}
int subTrue = 0;
int octWave = 0;
void draw() {

  background(0, 200, 200);
  fill(150, 120, 100);
  rect(0, height-50, width, 50);
  noFill();
  if ((keyPressed == true) && (key == 'w')) {
    octWave = 1;

    //do web in background. name MUST EXACTLY MATCH doParticle()
    //thread("doParticle");
    //doParticle();
  }
  if (octWave ==1) {
    octopus1.sway();
    octopus1.displayWave();
    // myPort.write('4');
  } else {
    octopus1.sway();
    octopus1.displayNormal();
  }
  if (octopus1.xpos <10) {
    octWave = 0;
    // myPort.write('5');
  }
  if ((keyPressed == true) && (key == 's')) {
    submarine1.move();
    submarine1.display();
    subTrue = 1;
    // myPort.write('2');
  }
  if (subTrue ==1) {
    submarine1.move();
    submarine1.display();
    // myPort.write('2');
  }
  if (submarine1.xpos <10) {
    subTrue = 0;
    // myPort.write('3');
  }
  fish1.swim();
  fish1.display();
  fish2.swim();
  fish2.display();
  fish3.swim();
  fish3.display();
  fish4.swim();
  fish4.display();
  fish5.swim();
  fish5.display();
  fish6.swim();
  fish6.display();
  kelp1.sway();
  kelp2.sway();
  kelp3.sway();
  kelp4.sway();
  kelp5.sway();
  kelp6.sway();
  kelp7.sway();
  kelp8.sway();
  kelp9.sway();
  kelp1.display();
  kelp2.display();
  kelp3.display();
  kelp4.display();
  kelp5.display();
  kelp6.display();
  kelp7.display();
  kelp8.display();
  kelp9.display();
  squarespotfish1.swim();
  squarespotfish1.display();
  squarespotfish2.swim();
  squarespotfish2.display();
  squarespotfish3.swim();
  squarespotfish3.display();
  jellyfish1.sway();
  jellyfish2.sway();
  jellyfish3.sway();
  pufferfish1.swim();
  if (mousePressed == true) {
    pufferfish1.display2();
    //  myPort.write('1');
  } else {
    pufferfish1.display();
    // myPort.write('0');
  }
  crab1.scuttle();
  crab1.display();
  if (crab1.xpos - crab1.size/2 > anenome1.xpos+anenome1.size/2 || crab1.xpos + crab1.size/2 < anenome1.xpos - anenome1.size/2 ) {
    anenome1.displayNormal();
  } else {
    anenome1.displayCollision();
  }
  if (crab1.xpos - crab1.size/2 > anenome2.xpos+anenome2.size/2 || crab1.xpos + crab1.size/2 < anenome2.xpos - anenome2.size/2 ) {
    anenome2.displayNormal();
  } else {
    anenome2.displayCollision();
  }
  schooloffish1.display();
  schooloffish2.display();

  //bubbles1.display();
  rock1.display();
  // seastar1.setup();
  seastar1.display();
  clam1.display();
  bubbles2.display();
  seahorse1.swim();
  seahorse1.display();
}