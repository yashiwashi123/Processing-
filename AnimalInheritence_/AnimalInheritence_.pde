Animal a; 
Dog d; 

void setup(){
  a = new Animal(); 
  d = new Dog();
  d.sleep(); 
  a.eat(); 
  println(d.dheight);
  d.grow(); 
  println(d.dheight);
}