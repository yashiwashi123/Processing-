
bug b; 
PVector wind;
 
Source s; 

void setup(){
 
  
  b = new bug(random(0, width), random(0,height));
  background(255);
  size(500,500);

  wind = new PVector(0.1, 0); 
  s = new Source(random(0, width), random(0,height));
  
}
void draw() {
  PVector attr= s.attract(b); 
 b.checkEdges();
 b.applyForce(wind);
 b.applyForce(attr); 
 
 //b.checkEdges(); 
 b.reverseMovement();

 b.update();
 b.display();
 s.display(); 


}