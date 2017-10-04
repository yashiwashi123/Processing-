Source s;
bug b; 
PVector wind;

void setup(){
  s = new Source(); 
  b = new bug(random(0, width), random(0,height));
  background(0);
  size(500,500);
  s.display();
  wind = new PVector(0.1, 0); 
 
  
}
void draw() {
 b.attract(s.loc.x, s.loc.y);
 b.applyForce(wind); 

 b.update();
 b.display();


}