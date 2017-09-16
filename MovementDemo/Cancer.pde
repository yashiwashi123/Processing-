
class Cancer{
  int x; 
  int y; 
  
  Cancer(){
    x = width/2; 
    y = height/2; 
  } 
  
  void display(){
    fill(255); 
    ellipse(x, y, 10, 10);
    
  }
  void step(){ 
    int choicex = int(random(-1, 3) -1)*10;
    int choicey = int(random(-1, 3) -1)*10;
    x += choicex; 
    y += choicey; 
  } 
}