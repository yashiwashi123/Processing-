ArrayList<Particle> plist = new ArrayList<Particle>(); 
PVector start;
PVector wind = new PVector(.005, -.002); 
int total = 100; 
void setup() {
  size(1000, 1000);
  //start = new PVector(random((width/2- 100), (width/2 +100)), random(height/2 -100, height/2 +100));
  background(255); 
  for (int i = 0; i < total; i ++){
    start = new PVector(random((width/2- 20), (width/2 +20)), random(height/2 -20, height/2 +20));
    plist.add(new Particle(start)); 
  }
}
void draw(){
background(255);
for (int i = plist.size()-1; i >=0; i--) {
  Particle  p = (Particle) plist.get(i); 
  p.applyForce(wind); 
  p.run(); 
  if (p.isDead()){
    plist.remove(i);
  }
}
}

    