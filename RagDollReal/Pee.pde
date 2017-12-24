
class Pee {
  ArrayList<PeeDrop> particles;
  PVector origin;

  Pee(PVector location) {
    origin = location.get();
    particles = new ArrayList<PeeDrop>();
  }

  void addParticle() {
    particles.add(new PeeDrop(origin));
  }

  void addParticle(float x, float y) {
    particles.add(new PeeDrop(new PVector(x, y)));
  }

  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      PeeDrop p = particles.get(i);
      p.run();
      p.separate(particles); 
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
  void stop(){
    this.particles.removeAll(particles); 
  }
}