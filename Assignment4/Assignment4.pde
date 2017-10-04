//Make two movers
Mover[] movers = new Mover[25];
ECM ecm; 
Source s;
float counter = 0;

void setup(){
  
  size(500,300);
  s = new Source(487, 150);
  ecm= new ECM(); 
  //assigns color of ECM
  ecm.display(0, 250, 55, 100); 
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(1, random(5, 30), random(120, 170));
  }
}
void draw(){ 
  //counts the number of iterations
  //counter +=1;
  //print(counter); 
  
  s.display();
  //go through all the movers
   for (int i = 0; i < movers.length; i++) {       
     //create a directional influence on the cancer cells
      PVector direction = new PVector(-.1, .05);       
      //construct an ecm with  friction and the directional influence      
      ecm = new ECM(.1, -1, movers[i].velocity.get(), direction); 
      //adds drag once it enters the source
      if ((movers[i].location.x > (s.location.x -12)) && (movers[i].location.y <(s.location.y+12)) && (movers[i].location.y >(s.location.y-12))){
        //use the stop function to count the iterations
        //stop(); 
        
        float speed = movers[i].velocity.mag();
        //drag formula: velocity^2 * coefficient
        float dragMagnitude = .05 *speed *speed; 
        PVector drag = movers[i].velocity.get();
        drag.mult(-1); 
        drag.normalize(); 
        drag.mult(dragMagnitude); 
        movers[i].applyForce(drag);
        movers[i].topspeed = 5; 
        
      }        
      //attracts movers to source      
      PVector force = s.attract(movers[i]); 
      movers[i].applyForce(force); 
      //apply directional influence and friction
      movers[i].applyForce(ecm.friction); 
      movers[i].applyForce(ecm.influence);       
      movers[i].update();
      movers[i].checkEdges();
      movers[i].display();
      
       
  
   }
    
}