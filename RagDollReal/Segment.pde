class Segment {
  Point point1;
  Point point2;
  float restLength = 0.0;
  boolean visible = true;
  color strokeColor = color(0);
  
  Segment(Point inputPoint1, Point inputPoint2) {
    this.point1 = inputPoint1;
    this.point2 = inputPoint2;
    this.restLength = inputPoint1.pos.dist(inputPoint2.pos);
  }
  

  void update() {
   float currentLength = this.point1.pos.dist(this.point2.pos);
   float lengthDifference = this.restLength - currentLength;
   float offsetPercent = lengthDifference / currentLength / 2.0;
   
   PVector direction = this.point2.pos.get();
   direction.sub(this.point1.pos);
   direction.mult(offsetPercent);
   
   if (! this.point1.snap) { this.point1.pos.sub(direction); }
   if (! this.point2.snap) { this.point2.pos.add(direction); }
  }
  
  void display() {
    if (this.visible) {
      stroke(this.strokeColor);
      strokeWeight(2);
      line(this.point1.pos.x, this.point1.pos.y, this.point2.pos.x, this.point2.pos.y);
    }
  }
}