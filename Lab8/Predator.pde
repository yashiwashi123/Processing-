class Predator {

  static final int visionRange = 100;
  static final int maxSpeed = 10;
  static final float maxForce = 0.5;
  static final int slowRange = 100;

  int lifespan;
  PVector position;
  PVector velocity;
  PVector acceleration;

  Predator(PVector position) {
    lifespan = 1000;
    this.position = position;
    velocity = new PVector(0, 0);
    acceleration= new PVector(0, 0);
  }

  void update(Prey p) {
    if (sensesPrey(p)) {
      seek(p);
    } else {
      search();
    }
    velocity.add(acceleration);  //add acceleration to velocity
    velocity.limit(maxSpeed);

    position.add(velocity);  //add velocity to location
    lifespan -= 1;
    acceleration.set(0, 0); 
    this.checkEdges();
  }

  void search() {
    //applyForce(new PVector(noise(lifespan),noise(lifespan+1000)));
    //applyForce(new PVector(0.1, 0.1));
    applyForce(PVector.random2D());
  }

  void seek(Prey p) { //basically seek and slow down as approaching target
    PVector desired = PVector.sub(p.position, this.position);
    float d = desired.mag();
    desired.normalize();
    if (d < slowRange) {
      float m = map(d, 0, 100, 0, maxSpeed);
      desired.mult(m);
    } else {
      desired.mult(maxSpeed);
    }
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxForce);
    applyForce(steer);
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

  void display() {
    fill(214, 116, 24);
    ellipse(position.x, position.y, 10, 10);
  }

  void applyForce(PVector f) {
    acceleration.add(f);
  }

  boolean isDead() {
    if (lifespan<0) {
      return true;
    }
    return false;
  }

  boolean sensesPrey(Prey p) {
    return PVector.dist(p.position, this.position)<visionRange;
  }
   void separate(ArrayList<Predator> pred){
    float desiredseparation = 200;
    PVector sum  = new PVector();  
    int count = 0;
    for (Predator other: pred){
      float d = PVector.dist(position, other.position);
      if ((d>0) &&(d <desiredseparation)){
        PVector diff = PVector.sub(position, other.position); 
        diff.normalize();
        diff.div(d); 
        sum.add(diff); 
        count++;
      }
    }
    if(count > 0){
      sum.div(count); 
      sum.normalize(); 
      sum.mult(maxSpeed); 
      PVector steer = PVector.sub(sum, velocity); 
      steer.limit(maxForce);
      applyForce(steer); 
    }
  }
}