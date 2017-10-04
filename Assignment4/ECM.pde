class ECM{
float coefficient; 
PVector friction; 
PVector influence; 
ECM(){}
ECM(float co, float spd, PVector fric, PVector inf){
  //friction coefficient
  coefficient= co; 
  friction =fric.get(); 
  //will it make the object speed up or slow down
  friction.mult(spd);
  friction.normalize(); 
  
  friction.mult(coefficient); 
  influence = inf.get(); 
}
void display(int r, int g, int b, int t){
rectMode(CORNERS); 
fill(r,g,b, t); 
rect(0,0, width, height); 

}
}