class bug {
 PVector location;
 PVector velocity; 
 PVector acceleration; 
 float mass; 
 float topspeed; 
 float theta = 0;
 
 
bug(float x, float y){
    location = new PVector(x, y);
    velocity = new PVector(0, 0); 
    acceleration = new PVector(0, 0); 
    mass = 1; 
    topspeed = 5; 
 }
void update(){
   velocity.add(acceleration);
   velocity.limit(topspeed); 
   location.add(velocity);
   acceleration.mult(0); 
}

    
boolean checkForces(PVector floor, PVector wind){
  if (floor == null || wind == null){
    return true;
  }
  if (floor.x ==0 && floor.y ==0 && wind.x == 0 && wind.y == 0){
    return true; 
  }
  else return false; 
     
}


void applyForce(PVector force) {
    
    //Newton’s second law at its simplest.
      PVector f = force.get();
      
      acceleration.add(f);
}
void checkEdges() {
 

//When it reaches one edge, it bounces. It does not bounce from top y = 0

    if (location.x > width) {
      location.x = width;
      velocity.x *= -1;
    } else if (location.x < 0) {
      location.x = 0;
      velocity.x *= -1;
    }

    if (location.y > height) {
      velocity.y *= -1;
      location.y = height;
    }
    else if ( location .y < 0) { 
      location.y = 0; 
      velocity.y *= -1; 
      
    }

  }
void reverseMovement(){
   acceleration = acceleration.mult(-1); 
   
   
}

void display() {
   stroke(0);
   fill(175); 
   ellipse(location.x,location.y, 16,16);
   float x = (sin(theta) +1) * 25; 
   theta += .25; 
   fill(0); 
   stroke(0); 
   line(location.x, location.y, location.x +x -15, location.y+15); 
   line(location.x, location.y, location.x +x -15, location.y-15); 
  
}
}