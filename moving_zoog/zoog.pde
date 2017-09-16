class zoog{

float xloc;
float yloc; 
int xspeed; 
int yspeed; 
 zoog(float x, float y, int xs, int ys){ 
    xspeed =xs;
    yspeed = ys; 
    xloc = x; 
    yloc = y; 
    rectMode(CORNER); 
    rect(xloc,yloc,20,100);
    ellipse(xloc,yloc-30,60,60);
    ellipse(xloc-19,yloc-30,16,32); 
    ellipse(xloc+19,yloc-30,16,32); 
    line(xloc-10,yloc+50,xloc-20,yloc+60);
    line(xloc+10,yloc+50,xloc+20,yloc+60);
        
  }

  void moveX(){
    xloc+=xspeed; 
  }
  
  void moveY(){
    yloc+=yspeed; 
  }
  void display(){
    ellipseMode(CENTER); 
    rectMode(CORNER); 
    rect(xloc,yloc,20,100);
    ellipse(xloc,yloc-30,60,60);
    ellipse(xloc-19,yloc-30,16,32); 
    ellipse(xloc+19,yloc-30,16,32); 
    line(xloc-10,yloc+50,xloc-20,yloc+60);
    line(xloc+10,yloc+50,xloc+20,yloc+60);
  
  }
}