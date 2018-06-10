class Particle{
  PVector location; 
  PVector velocity; 
  PVector acceleration; 
  float lifespan; 
  float mass; 
  
  Particle(PVector l){
    acceleration = new PVector(0, 0); 
    velocity = new PVector (random(-3, 3), random(-2, 2)); 
    location = l.get(); 
    lifespan = random(0, 255); 
    mass = random(1, 2.5); 
  }
  void run(){
    update(); 
    display(); 
  }
  void update(){
    velocity.add(acceleration);
    location.add(velocity); 
    lifespan -=2; 
  }
  void display() {
    stroke(0, lifespan); 
    fill(0, lifespan); 
    ellipse(location.x, location.y, 5+mass, 6+mass); 
}
boolean isDead(){
  if(lifespan < 0) return true; 
  else return false; 
    
}
void applyForce(PVector force){
  PVector f = force.get();
  f.div(mass);
  acceleration.add(f);
}


}