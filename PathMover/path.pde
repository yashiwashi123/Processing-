class path{
PVector start; 
PVector end; 
float radius;

Path(){
  radius = 20; 
  start = new PVectpr(0, height/2); 
  end = new PVector(width, 2* height/3); 
  
}
void display(){
  strokeWeight(radius*2); 
  stroke(0,100); 
  line(start.x, start.y, end.x, end.y); 
  strokeWeight(1); 
  stroke(0); 
  line(start.x, start.y, end.x, end.y); 
}
}