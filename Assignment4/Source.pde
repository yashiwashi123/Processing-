class Source{
  PVector location; 
  float mass;
  float G; 
  Source(float x, float y){
    location = new PVector(x, y); 
    mass = 50;
    G = 5; 
  }
  
  //attracts a mover object to the source
  PVector attract(Mover m) {
    //gets vector between location of two objects
    PVector force = PVector.sub(location, m.location); 
    float distance = force.mag(); 
    distance = constrain(distance, 5.0, 25.0); 
    force.normalize(); 
    //using attraction/gravity formula
    float strength = (G * mass * m.mass) / (distance * distance); 
    force.mult(strength); 
    return force; 
    
  }
  void display(){
  stroke(0);
  fill(200); 
  ellipse(location.x, location.y, 25, 25); 
  }
  
  
  
  
}