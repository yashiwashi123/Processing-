/*
@Yashar Hashemi 
CMSC  210 : Programming Nature

--Instructions--

clicking the mouse will splash the ragdolls; 

pressing the "p" key will cause one of the ragdolls to pee

pressing the "n" key will create a new path

--debugging--
clicking on a point on the ragdoll will allow you to drag it with your mouse if it gets stuck

*/



Path path; 
Point pinnedObj = null;
ParticleSystem ps;
Pee pee;
RagDoll doll1; 
RagDoll doll2;
int peeCount = 0;
int splashCount = 0; 

void setup() {
  size(1500, 700);
  background(0,191,255); 
  doll1 = new RagDoll(50, 550); 
  doll2 = new RagDoll( 170, 550); 
  newPath();     
  ps = new ParticleSystem(new PVector(width/2,50));  
  pee = new Pee(doll2.points.get(5).pos); 
}


void draw() {
  background(0,191,255); 

    
  //PATH FOLLOWING
  path.display(); 
  doll1.points.get(7).follow(path); 
  doll1.points.get(7).borders(path); 
  doll2.points.get(7).follow(path); 
  doll2.points.get(7).borders(path); 
  doll1.points.get(11).follow(path); 
  doll1.points.get(11).borders(path); 
  doll2.points.get(11).follow(path); 
  doll2.points.get(11).borders(path); 
  doll1.points.get(15).follow(path); 
  doll1.points.get(15).borders(path); 
  doll2.points.get(15).follow(path); 
  doll2.points.get(15).borders(path); 
  
  for (PeeDrop pd : pee.particles){ 
    pd.separate(pee.particles); 
    pd.follow(path);
    pd.borders(path);
    
  }
  //PARTICLE SYSTEMS
 if(mousePressed == true){
  ps.origin.set(mouseX,mouseY,0);    
  ps.addParticle();
  ps.run();
  splashCount ++; 
 }
 else{ps.stop();}
 
if ((keyPressed == true) && (key == 'p')) {
 pee.origin.set(doll2.points.get(5).pos); 
 pee.addParticle(); 
 pee.run();
 peeCount ++; 
}else{pee.stop();}

//NEW PATH CREATION
if ((keyPressed == true) && (key == 'n')){
newPath(); 
}

//TEXT DISPLAY 
if (peeCount > 1){
  textSize(24);
  text("Quit being nasty", width/2, 100); 
}
 fill(224,224,0);
  textSize(18);
  text("lazy river simulator", 1150, 50); 
 
// DISPlAY/UPDATE/CHECK COLLISION FOR RAGDOLLS
  for (Point pt : doll1.points) { 
    pt.update(); 
    pt.display();
}    
  for (Point pt : doll1.points){    
  pt.ParticleCollision(); 
}
  
  for (int timestep = 0; timestep < 6; timestep++) {
    for (Segment segment : doll1.segments) { segment.update(); }
    
    for (Point pt : doll1.points) { 
      pt.collideToWindow(); 
      
    }
  }
  for (Segment segment : doll1.segments) { segment.display(); }
  for (Point pt : doll1.points) { pt.display(); }
  
  for (Point pt : doll2.points) { 
    pt.update(); 
    pt.display();
}    
  for (Point pt : doll2.points){    
  pt.ParticleCollision(); 
}
  
  for (int timestep = 0; timestep < 6; timestep++) {
    for (Segment segment : doll2.segments) { segment.update(); }
    
    for (Point pt : doll2.points) { 
      pt.collideToWindow(); 
      
    }
  }
  
  // Display ragdoll and collisions
  for (Segment segment : doll2.segments) { segment.display(); }
  for (Point pt : doll2.points) { pt.display(); }}



// CLICK ON POINT OF RAGDOLL/DRAG RAGDOLL IF IT GETS STUCK
void mousePressed() {
  for (Point pt : doll1.points) {
    if (dist(pt.pos.x, pt.pos.y, mouseX, mouseY) < 10) {
      pinnedObj = pt;
      pt.snap = true;
      break;
    }
  }
   for (Point pt : doll2.points) {
    if (dist(pt.pos.x, pt.pos.y, mouseX, mouseY) < 10) {
      pinnedObj = pt;
      pt.snap = true;
      break;
    }
  }


} 
void mouseReleased() {
  if (pinnedObj != null) {
    pinnedObj.snap = false;
    pinnedObj = null;
  }
}

void mouseDragged() {
  if (pinnedObj != null) {
    pinnedObj.pos.x = mouseX;
    pinnedObj.pos.y = mouseY;
  }
}
//NEW PATH FUNCTION 
void newPath() {
  
  path = new Path();
  path.addPoint(-20, height/2);
  path.addPoint(random(0, width/3), random(50, height-70));
  path.addPoint(random(width/3, width/3*2), random(50, height-70));
  path.addPoint(random(width/3 *2, width + 10), random(50, height -50)); 
  path.addPoint(width+10, height/2);
}