class Mover {
  PVector loc; 
  PVector velocity; 
  PVector acceleration; 
  PVector destination; 
  PVector direction; 
  float mass; 
  float topspeed; //<>//

  //constructs the mover with a location and a mass value
  Mover(float m, float x, float y) {
    loc = new PVector(x, y); 
    velocity = new PVector(0, 0); 
    acceleration = new PVector(0, 0);  //<>//
    topspeed = 5; 
    mass = m;
  }
  //movement function
  void update(float x, float y) {
    float r = random(1); 

    //30% chance: directs cell towards a destination
    if (r<=.3) {
      destination = new PVector(x, y); 
      direction =PVector.sub(destination, loc); 
      direction.normalize(); 
      direction.mult(.7); 
      acceleration = direction;
    }
    // 40% chance of accelerating to the right
    if  ( r<=.7 && r> .3) {
      acceleration.x  = .5;
    }
    //30% chance of accelerating in random direction
    else {

      int choicex = floor(random(0, 3) -1);
      int choicey = floor(random(0, 3) -1);
      acceleration.x = float(choicex); 
      acceleration.y = float(choicey); 
      acceleration.normalize();
      acceleration.mult(.5);
    }
    // add acceleration to verlocy, and velocity to location
    velocity.add(acceleration); 
    //limits the max velocity
    velocity.limit(topspeed); 
    loc.add(velocity);
  }
  // applies a force to the object
  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass); 
    acceleration.add(f);
  }

  //checks for edge collision and inverts velocity if there is a collision
  void checkEdges() { 
    if (loc.x > width) {
      loc.x = width;
      velocity.x *= -1;
    } else if (loc.x < 0) {
      velocity.x *= -1;
      loc.x = 0;
    }
    if (loc.y > height) {
      loc.y = height;
      velocity.y *= -1;
    } else if (loc.y < 0) {
      velocity.y *= -1;
      loc.y= 0;
    }
  }
  //displays the mover
  void display() {
    stroke(0); 
    fill(45, 187, 250, 150);
    ellipse(loc.x, loc.y, mass*6, mass*6);
  }
}