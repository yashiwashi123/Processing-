

Cancer c; 
void setup(){ 
  size(1000, 1000); 
  c = new Cancer();
  
 
}

void draw(){ 
  background(0); 
  c.step(); 
  c.display(); 
}