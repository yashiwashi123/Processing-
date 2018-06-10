//Author- Yashar Hashemi 
//declares the cancer object
Cancer c; 
void setup(){ 
  size(1000, 1000); 
  //constructs the cancer object
  c = new Cancer();
  background(0); 
 
}

void draw(){ 
  
  //steps using the step() function in the Cancer class
  c.step(); 
  //displays the Cancer cell using the display() function in the cancer class
  c.display(); 
}