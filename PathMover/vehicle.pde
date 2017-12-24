class vehicle{
  PVector location; 
  PVector velocity; 
  PVector acceleration; 
  float r; 
  float maxforce; 
  float maxspeed; 
  
  Vehicle(float x, float y){
    acceleration = new PVector (0, 0); 
    velocity = new PVector (0,0); 
    location = new PVector (x, y); 
    r = 3; 
    maxspeed = 4; 
    maxforce= .1; 
  }
  
  void update(){
    velocity.add(acceleration);
    velocity.limit(maxspeed);
    location.add(velocity);
    acceleration.mult(0);
  }
  void applyForce(PVector force) {}
  
  PVector getNormalPoint(PVector p , PVector a, PVector b){
    PVector ap = PVector.sub(p, a); 
    PVector ab - PVector.sub(b,a); 
    ab.normalize(); 
    ab.mult(ap.dot(ab)); 
    PVector normalPoint= PVector.add(a, ab); 
    return normalPoint; 
  }
  
  void follow(path p) {
    PVector predict = veloctiy.get(); 
    predict.normalize(); 
    predict.mult(25); 
    PVector predictLoc = PVector.add(loc, predict); 
    PVector a = p.start; 
    PVector b = p.end; 
    PVector normalPoint = getNormalPoint(predictLoc, a, b); 
    PVector dir = PVector.sub(b, a); 
    dir.normalize(); 
    dir.mult(10); 
    PVector target = PVector.add(normalPoint, dir); 
    float distance = PVector.dist(normalPoint, predictLoc); 
    if(distance>p.radius){
      seek(target); 
    }
  }
}