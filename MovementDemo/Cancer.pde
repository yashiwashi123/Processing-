class Cancer {
  float x,y;
 
  float tx,ty;
 
  Cancer() {
    x = width/2;
    y = height/2; 
    
    tx = 0;
    ty = 10000;
  }
 
  void step() {
    int n = int(random(10));
    if (n<=5){
      x = map(noise(tx), 0, 1, 0, width);
      y = map(noise(ty), 0, 1, 0, height);     
      tx += 0.01;
      ty += 0.01;
      }
    else{
      x+=7; 
      
    }
   
   
  }
  
  void display(){
    stroke(255);
    fill(255); 
    ellipse(x, y, 30, 30);
    fill(255, 50, 50); 
    ellipse(x, y, 10, 10); 
  }
}