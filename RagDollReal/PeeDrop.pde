class PeeDrop extends Particle{

PeeDrop(PVector p){
    super(p); 
    acceleration = new PVector(0,0);
    velocity = new PVector(random(-1,1),random(-2,0));
    location = p.get();
    lifespan = 255.0;
}

void display() {
    noStroke(); 
    
    fill(255, 255, 0);
    
    ellipse(location.x,location.y, 6, 6); 
  }
void follow(Path p) {

 
    PVector predict = velocity.get();
    predict.normalize();
    predict.mult(50);
    PVector predictLoc = PVector.add(location, predict);

   

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

//NORMAL POINT FOR PATH
   
  }

  PVector getNormalPoint(PVector p, PVector a, PVector b) {
    // Vector from a to p
    PVector ap = PVector.sub(p, a);
    // Vector from a to b
    PVector ab = PVector.sub(b, a);
    ab.normalize(); // Normalize the line
    // Project vector "diff" onto line by using the dot product
    ab.mult(ap.dot(ab));
    PVector normalPoint = PVector.add(a, ab);
    return normalPoint;
  }
  
  //SEEKS PATH

  void seek(PVector target) {
    PVector desired = PVector.sub(target, location);  // A vector pointing from the location to the target

  
    if (desired.mag() == 0) return;
    desired.normalize();
    desired.mult(.01);
    // Steering = Desired minus Velocity
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(3);  // Limit to maximum steering force

      applyForce(steer);
       
  }  
  //SEPARATE PEE DROPS FROM EACH OTHER
  void separate (ArrayList<PeeDrop> drops) {
    float desiredseparation = 5;
    PVector sum = new PVector();
    int count = 0;
    for (PeeDrop other : drops) {
      float d = PVector.dist(location, other.location);
      if ((d > 0) && (d < desiredseparation)) {
        PVector diff = PVector.sub(location, other.location);
        diff.normalize();
        diff.div(d);       
        sum.add(diff);
        count++;           
      }
    }
    if (count > 0) {
      sum.div(count);
      // Our desired vector is the average scaled to maximum speed
      sum.normalize();
      sum.mult(5);
      // Implement Reynolds: Steering = Desired - Velocity
      PVector steer = PVector.sub(sum, velocity);
      steer.limit(2);
      applyForce(steer);
    }
  }
void applyForce(PVector force){
  PVector f = force.get(); 
  
  acceleration.add(f);
  
  
}
void borders(Path p) {
    if (location.x > p.getEnd().x + 3) {
      location.x = p.getStart().x - 3;
      location.y = p.getStart().y + (location.y-p.getEnd().y);
    }

  
}
void update(){
    velocity.add(acceleration);
    velocity.limit(5); 
    location.add(velocity);
    lifespan -= 2.0;
    acceleration.mult(0); 
  
}
}