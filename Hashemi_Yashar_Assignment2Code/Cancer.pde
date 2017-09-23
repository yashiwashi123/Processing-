//Author - Yashar Hashemi

class Cancer {
  PVector location; 
  PVector pTime;
   //initialization of the object
  Cancer() {
    //initializes the cacner cell in the middle of the window
    //the x and y time parameters for perlin noise 
    pTime = new PVector(0, 10000); 
    //starts at perlin noise location instead of middle to avoid stray cell    
    location = new PVector(map(noise(pTime.x), 0, 1, 0, width), map(noise(pTime.y), 0, 1, 0, height)); 
    
    
   
  }
  //Perlin Noise step function that takes time increments as parameters
  void noisestep(float ntx, float nty) { 
      location.x = map(noise(pTime.x), 0, 1, 0, width);
      location.y = map(noise(pTime.y), 0, 1, 0, height);     
      pTime.x += ntx;
      pTime.y += nty;
      
  }
 
  void step() {
     
    float n = random(1);
    //60% of the time the cell moves using perlin noise
    
    if (n<=.6){
      noisestep(.01, .01);
      }
    else{
      //40% of the time the cell moves 7 pixels to the right
      location.y+=9; 
      
    }
    //if the mouse is pressed, the cell moves at 3 different Perlin Noise times
    if (mousePressed == true) {
      //r is either 0, 1 or 2
      int r = int(random(3));
      //if r is 0 the cell moves at increments of .05 seconds which means it has the potential to move greater distances
      if (r==0)
        noisestep(.05, .05);
      //increments of .005 seconds
      else if(r==1){
         noisestep(.005, .005);
      }
      //increments of .01 seconds
      else if(r==2){
         noisestep(.01, .01);
      }
    
    }
   
  }
  //displays the object as a red ellipse inside of a white ellipse
  void display(){
    //white outline
    stroke(255);
    //white ellipse
    fill(255); 
    ellipse(location.x, location.y, 30, 30);
    //red ellipse
    fill(255, 50, 50); 
    ellipse(location.x, location.y, 10, 10); 
  }
}