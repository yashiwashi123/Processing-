
Source m; 
Mover[] cell ;
PVector grav; 
PVector wind; 
PVector friction;
float fco; 

void setup() {
  size(1000, 1000); 
  background(130); 
  m = new Source(); 
  cell = new Mover[20]; 
  //initializes the array of movers
  for (int i = 0; i <20; i++) {
    cell[i] = new Mover(random(1, 5), random(0, width), random(0, height));
  }
  /*
grav = new PVector(0, .1*cell[0].mass); 
   wind = new PVector(-1/cell[0].mass, 0); 
   
   fco =  ; 
   */
}


void draw() {

  background(50); 
  m.display();  
/*
  friction = cell[1].velocity; 
  friction.mult(-1); 
  friction.normalize();
  friction.mult(fco); 

*/
  for (int i = 0; i <20; i++) {
    /*
   cell[i].applyForce(friction); 
     cell[i].applyForce(grav); 
     cell[i].applyForce(wind);
     */
    cell[i]. update(m.loc.x, m.loc.y);
    cell[i].checkEdges(); 
    cell[i]. display();
  }
}