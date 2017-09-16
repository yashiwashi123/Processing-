zoog myzoog;  
void setup(){
 
size(200, 200); 
myzoog = new zoog(200, 200, -1, -2); 
}

void draw(){

background(0); 
myzoog.moveX();
myzoog.display();
myzoog.moveY(); 
myzoog.display(); 
}