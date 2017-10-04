class bug {
 PVector location;
 PVector velocity; 
 PVector acceleration; 
 PVector force;
 PVector destination;
 float topspeed; 
 
bug(float x, float y){
    location = new PVector(x, y);
    velocity = new PVector(0, 0); 
    acceleration = new PVector(0, 0); 
    topspeed = 5; 
 }
void update(){
   velocity.add(acceleration);
   velocity.limit(topspeed);
   location.add(velocity);
   acceleration.mult(0); 
}
void attract(float x, float y){
      destination = new PVector(x, y); 
      force =PVector.sub(destination, location); 
      force.normalize(); 
      force.mult(.7); 
      acceleration = force;

}
    
void checkForce(PVector force){
  if (force.x  != 0 && force.y != 0){
    acceleration= acceleration.mult(-1);  
  }

     
}


void applyForce(PVector force) {
    
    //Newton’s second law at its simplest.
      PVector f = force.get();
      
      acceleration.add(f);
}

void display() {
  stroke(0);
   fill(175);
 
   ellipse(location.x,location.y, 16,16);
  
}
  
}