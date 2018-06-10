class Source{
  PVector loc; 
  
  Source(){
    loc = new PVector(random(width), random(height));   
  }
  
  void display(){
  stroke(0);
  fill(200); 
  ellipse(loc.x, loc.y, 40, 40); 
  }
  
  
  
  
}