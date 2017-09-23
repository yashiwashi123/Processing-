

Mover[] moverArray ;
void setup(){

size(1000, 1000); 
background(130); 
moverArray = new Mover[20]; 
for (int i = 0; i < 20 ;  i ++ ) {moverArray[i] = new Mover();}
}


void draw(){
for (int i = 0; i < 20 ; i++) {
  moverArray[i]. update();
  moverArray[i]. display();
}

}