
class CellWalker {

 
  PVector position;
  PVector velocity;
  //PVector acceleration;
  float telomeres; 
  // Size
  float r;


  // Fitness and DNA
  //float fitness;
  DNA dna;
  // To count which force we're on in the genes
  int geneCounter = 0;


  //constructor
  CellWalker(PVector l, DNA dna_, int totalRockets) {
    acceleration = new PVector();
    velocity = new PVector();
    position = l.get();
    r = 4;
    dna = dna_;
    finishTime = 0;          // We're going to count how long it takes to reach target
    recordDist = 10000;      // Some high number that will be beat instantly
  }

  

 

  // Did I make it to the target?
  

  void applyForce(PVector f) {
    acceleration.add(f);
  }

   CellWalker reproduce(){
   //add a new CellWalker to the grid
   CellWalker c = new CellWalker(position);
   c.telomeres = telomeres;
   return c;
 }

  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
  }

  void display() {
    //background(255,0,0);
    float theta = velocity.heading2D() + PI/2;
    fill(200, 100);
    stroke(0);
    strokeWeight(1);
    pushMatrix();
    translate(position.x, position.y);
    rotate(theta);

    // Thrusters
    rectMode(CENTER);
    fill(0);
    rect(-r/2, r*2, r/2, r);
    rect(r/2, r*2, r/2, r);

    // Rocket body
    fill(175);
    beginShape(TRIANGLES);
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape();

    popMatrix();
  }

 

  DNA getDNA() {
    return dna;
  }

}