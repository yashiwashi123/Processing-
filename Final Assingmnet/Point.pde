class Point {
 
  PVector pos = new PVector(0.0, 0.0, 0.0);
  boolean snap = false;
  float displaySize = 6.0;
  color fillColor = color(0);
  PVector vel; 
  PVector acceleration; 
  float maxspeed; 
  float mass = 20; 
  float maxforce;
  float r; 
  
  Point(float posX, float posY) {
    this.pos.set(posX, posY, 0.0);
    vel = new PVector(0,0); 
    acceleration = new PVector (0,0); 
    maxspeed = 5; 
    maxforce = 10; 
    r = 2; 
  }
  
  void applyForce(PVector force){
  PVector f = force.get();
  acceleration.add(f);
}

 
  //Stays in window
  void collideToWindow() {
    float border = 10;
    float vx = vel.x;
    float vy = vel.y;
    
    if (this.pos.y > height - border) {
     // Bottom screen
     float bounce = 0.8;
     this.pos.y = height - border;
    
    } else if (this.pos.y < 0 + border) {
     // Top screen
     this.pos.y = 0 + border;
    }
    if (this.pos.x < 0 + border) {
     // Left screen
     this.pos.x = 0 + border;     
    } else if (this.pos.x > width - border) {
     // Right screen
     this.pos.x = width - border;
    }    
  }
  //checks collision with particles 
  void ParticleCollision(){
   for (Particle prt: ps.particles){
     float intersection = dist(this.pos.x, this.pos.y, prt.location.x, prt.location.y);
     if(intersection < 6){
       PVector collision = new PVector (0, .1); 
       PVector collisionPos = new PVector (-prt.location.x *4, -prt.location.y*4); 
       collisionPos.normalize(); 
       this.pos.sub(collisionPos); 
       break; 
       
     }
   }
  }
    
   void update() {
    vel.add(acceleration);    
    // Limit speed
     vel.limit(maxspeed); 
    pos.add(vel);
    // Reset accelertion to 0 each cycle
    acceleration.mult(0);
  }
  //Path Following
  void follow(Path p) {

    // Predict location 50 (arbitrary choice) frames ahead
    // This could be based on speed 
    PVector predict = vel.get();
    predict.normalize();
    predict.mult(50);
    PVector predictLoc = PVector.add(pos, predict);
    PVector normal = null;
    PVector target = null;
    float worldRecord = 1000000;  
    for (int i = 0; i < p.points.size()-1; i++) {

  
      PVector a = p.points.get(i);
      PVector b = p.points.get(i+1);

      
      PVector normalPoint = getNormalPoint(predictLoc, a, b);
      if (normalPoint.x < a.x || normalPoint.x > b.x) {
        normalPoint = b.get();
      }
      float distance = PVector.dist(predictLoc, normalPoint);
      if (distance < worldRecord) {
        worldRecord = distance;
        normal = normalPoint;
        PVector dir = PVector.sub(b, a);
        dir.normalize();
        dir.mult(10);
        target = normalPoint.get();
        target.add(dir);
      }
    }
    if (worldRecord > p.radius) {
      seek(target);
    }
  }


  PVector getNormalPoint(PVector p, PVector a, PVector b) {
    PVector ap = PVector.sub(p, a);
    PVector ab = PVector.sub(b, a);
    ab.normalize(); // Normalize the line
    ab.mult(ap.dot(ab));
    PVector normalPoint = PVector.add(a, ab);
    return normalPoint;
  }

  void seek(PVector target) {
    PVector desired = PVector.sub(target, pos);  
    if (desired.mag() == 0) return;
    desired.normalize();
    desired.mult(maxspeed);
    PVector steer = PVector.sub(desired, vel);
    steer.limit(maxforce);  

      applyForce(steer);
  }
   void borders(Path p) {
    if (pos.x > p.getEnd().x + r) {
      pos.x = p.getStart().x - r;
      pos.y = p.getStart().y + (pos.y-p.getEnd().y);
    }
  
   }
  void display() {
    noStroke();
    fill(this.fillColor);
    ellipse(this.pos.x, this.pos.y, this.displaySize, this.displaySize);
  }
}