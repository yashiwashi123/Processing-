ArrayList<Prey> prey; //<>//
ArrayList<Predator> predators;
CellularAutomata ca = new CellularAutomata(61, 61); 
void setup() {
  size(600, 600);
  prey = new ArrayList<Prey>();
  predators = new ArrayList<Predator>();
  //fills the prey array list with 10 prey 
  for (int i = 0; i < 10; i++) {
    prey.add(new Prey());
  }
  
  //fills the predators array list with 10 predatores 
  for (int i = 0; i < 10; i++) {
    predators.add(new Predator(new PVector(random(width), random(height))));
  }
}

void draw() {
  background(200);
  ca.update();
  ca.display(); 

  //check if the prey list is empty after removals occur, if so, end program
  //check for emptiness needs to occur before closestPrey is initialized
  if (prey.isEmpty()) {
    println("Predators win!");
    //stop();
    //noLoop();
  } else {
    // only runs if prey is not empty
    Prey closestPrey = prey.get(0); //to determine which prey predator will attack
    for (int i = predators.size()-1; i>=0; i--) { //loop through predators backwards (bc of remove)
      Predator pred = predators.get(i);
      for (Prey p : prey) {
        PVector pos = p.position; //p is prey
        PVector closPreyPos = closestPrey.position; //position of closest prey
        //TO THINK ABOUT: actually want to get the absolute value of the distance NOT just dist
        if (pos.dist(pred.position) < closPreyPos.dist(pred.position)) {
          closestPrey = p;
        }
      }
      pred.separate(predators);
      PVector m = ca.magic(pred.position.copy()); 
      pred.applyForce(m); 
      pred.update(closestPrey); 
      //remove any dead predators BEFORE displaying
      if (pred.isDead()) {
        predators.remove(pred);
      } else {
        pred.display();
      }
    }
  }
  //stops the program if either one of the lists is empty
  if (predators.isEmpty()) { 
    println("Prey win!");
  } else {
    // only runs if predators is not empty
    Predator closestPredator = predators.get(0); //to determine which predator prey will escape
    for (int i = prey.size()-1; i>=0; i--) { //loop through prey backwards (bc of remove)
      Prey p = prey.get(i);
      for (Predator pred : predators) {
        PVector pos = pred.position;
        PVector closPredPos = closestPredator.position;
        //TO THINK ABOUT: actually want to get the absolute value of the distance NOT just dist???
        if (pos.dist(p.position) < closPredPos.dist(p.position)) {
          closestPredator = pred;
        }
      }
      
      p.separate(prey);
      PVector a = p.align(prey);
      p.applyForce(a); 
      PVector c = p.cohesion(prey);
      p.applyForce(c); 
      PVector m1 = ca.magic(p.position.copy()); 
      p.applyForce(m1); 
      p.applyForce(p.cohesion(prey));
      
      p.update(closestPredator);
      
      //remove any dead prey BEFORE displaying
      if (p.isDead()) {
        prey.remove(p);
      } else {
        p.display();
      }
    }
  }
  
  //these two for loops are just to make the predatros and prey visible
  //without these, they would not be visible at the end of the program
  for(int i = 0; i < predators.size() ; i++){
    predators.get(i).display();
  }
  for(int i = 0; i < prey.size() ; i++){
    prey.get(i).display();
  }

}