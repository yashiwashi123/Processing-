class Mover {
 PVector location;
 PVector velocity;
 PVector acceleration;
 PVector force;
 PVector destination; 
 
 float topspeed;
 float mass;
 //Mover m = new Mover();
 
 Mover(float m, float x , float y){
   location = new PVector(x,y);
   velocity = new PVector(0,0);
   acceleration = new PVector(-0.001,0.01);
   topspeed = 8;
   mass = m;
 }
 
 void update(){
  
   velocity.add(acceleration);
   velocity.limit(topspeed);
   location.add(velocity);
   acceleration.mult(0);
 }
 void display(){
   stroke(0);
   fill(175);
 
   ellipse(location.x,location.y, 10,10);
 }
 
 

void applyForce(PVector force) {

//Newton’s second law at its simplest.
  PVector f = force.get();
  f.div(mass);
  acceleration.add(f);
}



  void checkEdges() {
 

//When it reaches one edge, it bounces. It does not bounce from top y = 0

    if (location.x > width) {
      location.x = width;
      velocity.x *= -1;
    } else if (location.x < 0) {
      location.x = 0;
      velocity.x *= -1;
    }

    if (location.y > height) {
      velocity.y *= -1;
      location.y = height;
    }

  }

}