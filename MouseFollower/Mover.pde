class Mover {
 PVector loc; 
 PVector velocity; 
 PVector acceleration; 
 PVector mouse; 
 PVector direction; 
 float topspeed;

Mover(){
loc = new PVector(random(width), random(height)); 
velocity = new PVector(0,0); 
acceleration = new PVector(0,0); 
topspeed = 5; 


}
void update(){
  mouse = new PVector(mouseX, mouseY); 
  direction =PVector.sub(mouse, loc); 
direction.normalize(); 
direction.mult(.7); 
acceleration = direction; 

velocity.add(acceleration); 
velocity.limit(topspeed); 
loc.add(velocity); 




}

void display(){
stroke(0); 
fill(170);
ellipse(loc.x, loc.y, 20, 20); 
}

}