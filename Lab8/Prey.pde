class Prey {
  //prey object 
  //slows down as it get farther from target
  //limit "sensing" to 100 pixels
  //Design an arbitrary scheme for finding "desired" vector if
  //  sensing a predator and if not sensing a predator
  //if "caught" implement removal form the system

  PVector position;
  PVector velocity;
  PVector acceleration;
  PVector undesired; //

  float diam;
  int visionRange = 100;
  int slowRange = 100;
  int maxSpeed;
  float maxforce;
  boolean caught;

  Prey() {
    position = new PVector(random(width), random(height));
    velocity = new PVector(0, 0);
    acceleration = new PVector(0.01, 0.01);
    diam = 10;
    maxSpeed = 6;
    maxforce = 0.5;
    caught = false;
  }

  void display() {
    fill(0, 160, 160);
    ellipse(position.x, position.y, diam, diam);
  }

  void update(Predator predator) {
    undesired = PVector.sub(predator.position, this.position); 
    float distance = undesired.mag();
    if (distance < 10) {
      caught = true;
    }
    undesired.normalize();
    if (distance < visionRange) {
      flee(predator);
    } else {
      move();
    }
    velocity.add(acceleration);
    velocity.limit(maxSpeed);
    position.add(velocity);
    this.checkEdges();
    acceleration.mult(0);
  }
  //flees a prey
  void flee(Predator predator) {
    undesired = PVector.sub(predator.position, this.position);
    float distance = undesired.mag();
    undesired.normalize();
    //slows down if its far from a prey
    if (distance > slowRange) {
      float mapDis = map(distance, 0, 100, 0, maxSpeed);
      undesired.mult(mapDis);
    } else{
      undesired.mult(maxSpeed);
    }
    PVector steer = PVector.sub(undesired, this.velocity);
    steer.mult(-1);
    steer.limit(this.maxforce);
    applyForce(steer);
  }
  void move() {
    float lifespan = 1000;
    applyForce(PVector.random2D());
    //applyForce(new PVector(0.1, 0.1));
  }

  //simple application of force
  void applyForce(PVector force) {
    acceleration.add(force);
  }

  boolean isDead() {
    return caught;
  }

  void checkEdges() {
    if (position.x<0) {              //if too far left
      position.x=width;              //move to the right of the window
    } else if (position.x>width) {  //if too far right
      position.x=0;                 //move to the left of the window
    }
    if (position.y<0) {             //if too high
      position.y=height;            //move to the bottom of the window
    } else if (position.y>height) { //if too low
      position.y=0;                 //move to the top of the window
    }
  }
  PVector align(ArrayList<Prey> prey){
    PVector sum = new PVector(0,0); 
    for (Prey other : prey){
      sum.add(other.velocity);
    }
    sum.div(prey.size()); 
    sum.setMag(maxSpeed); 
    PVector steer = PVector.sub(sum, velocity); 
    steer.limit(maxforce); 
    return steer; 
  }
  PVector seek(PVector target){
    PVector desired = PVector.sub(target, position);
    desired.normalize();
    desired.mult(maxSpeed);
    PVector steer = PVector.sub(desired, velocity); 
    steer.limit(maxforce); 
    return steer;
  
  }
  PVector cohesion(ArrayList<Prey> prey){
    float neightbordist = 50;
    PVector sum = new PVector(0,0); 
    int count = 0; 
    for (Prey other : prey){
      float d = PVector.dist(position, other.position); 
      if((d > 0) && (d < neightbordist)){
        sum.add(other.position); 
        count ++; 
      }
    }
     if (count >0){
       sum.div(count);
       return seek(sum); 
     }
     else{
       return new PVector(0,0); 
     }
  }
  void separate(ArrayList<Prey> prey){
    float desiredseparation = diam*2;
    PVector sum  = new PVector();  
    int count = 0;
    for (Prey other: prey){
      float d = PVector.dist(position, other.position);
      if ((d>0) &&(d <desiredseparation)){
        PVector diff = PVector.sub(position, other.position); 
        diff.normalize();
        diff.div(d); 
        sum.add(diff); 
        count++;
      }
    }
    if(count >0){
      sum.div(count); 
      sum.normalize(); 
      sum.mult(maxSpeed); 
      PVector steer = PVector.sub(sum, velocity); 
      steer.limit(maxforce);
      applyForce(steer); 
    }
  }
}