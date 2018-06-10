class RagDoll{
 //store points and segments of ragdoll
  
ArrayList<Point> points = new ArrayList<Point>();
ArrayList<Segment> segments = new ArrayList<Segment>();


RagDoll(float x, float y){
  // points and segments of the ragdoll
  
  Point body1 = addPoint(x-10, y, color(255));
  Point body2 = addPoint(x+10, y, color(255));
  Point body3 = addPoint(x-10, y+40, color(255));
  Point body4 = addPoint(x+10, y+40, color(255));
  addSegment(body1, body2, true, color(255));
  addSegment(body1, body3, true, color(255));
  addSegment(body2, body4, true, color(255));
  addSegment(body3, body4, true, color(255));
  addSegment(body1, body4, false, color(0));
  addSegment(body2, body3, false, color(0));
  
  Point hips1 = addPoint(x-10, y+55, color(255));
  Point hips2 = addPoint(x+10, y+55, color(255));
  addSegment(body3, hips1, true, color(255));
  addSegment(body4, hips2, true, color(255));
  addSegment(hips1, hips2, true, color(255));
  addSegment(body3, hips2, false, color(0));
  
  Point head1 = addPoint(x-10, y-30, color(255));
  Point head2 = addPoint(x+10, y-30, color(255));
  addSegment(head1, head2, true, color(255));
  addSegment(body1, head1, true, color(255));
  addSegment(body2, head2, true, color(255));
  addSegment(body2, head1, false, color(0));
  
  Point leftArm = addPoint(x-20, y, color(255));
  Point leftElbow = addPoint(x-45, y+5, color(255));
  Point leftHand = addPoint(x-70, y+20, color(255));
  Point leftHandTip = addPoint(x-80, y+30, color(255));
  
  addSegment(body1, leftArm, true, color(255));
  addSegment(body3, leftArm, false, color(255));
  addSegment(leftArm, leftElbow, true, color(255));
  addSegment(leftElbow, leftHand, true, color(255));
  addSegment(leftHand, leftHandTip, true, color(255));
  
  Point rightArm = addPoint(x+20, y, color(255));
  Point rightElbow = addPoint(x+45, y+5, color(255));
  Point rightHand = addPoint(x+70, y+20, color(255));
  Point rightHandTip = addPoint(x+80, y+30, color(255));
  addSegment(body2, rightArm, true, color(100, 0, 0));
  addSegment(body4, rightArm, false, color(0));
  addSegment(rightArm, rightElbow, true, color(255));
  addSegment(rightElbow, rightHand, true, color(255));
  addSegment(rightHand, rightHandTip, true, color(255));
  
  Point leftLeg = addPoint(x-20, y+50, color(255));
  Point leftKnee = addPoint(x-25, y+90, color(255));
  Point leftFoot = addPoint(x-20, y+130, color(255));
  Point leftFootTip = addPoint(x-25, y+140, color(255));
  addSegment(body4, leftLeg, false, color(0));
  addSegment(body3, leftLeg, true, color(255));
  addSegment(hips1, leftLeg, true, color(255));
  addSegment(leftLeg, leftKnee, true, color(255));
  addSegment(leftKnee, leftFoot, true, color(255));
  addSegment(leftFoot, leftFootTip, true, color(255));
  addSegment(leftLeg, leftFoot, false, color(0));
  
  Point rightLeg = addPoint(x+20, y+50, color(255));
  Point rightKnee = addPoint(x+25, y+90, color(255));
  Point rightFoot = addPoint(x+20, y+130, color(255));
  Point rightFootTip = addPoint(x+25, y+140, color(255));
  addSegment(body3, rightLeg, false, color(0));
  addSegment(body4, rightLeg, true, color(255));
  addSegment(hips2, rightLeg, true, color(255));
  addSegment(rightLeg, rightKnee, true, color(255));
  addSegment(rightKnee, rightFoot, true, color(255));
  addSegment(rightFoot, rightFootTip, true, color(255));
  addSegment(rightLeg, rightFoot, false, color(0));
  
  
}

//Adds point to ragdoll
Point addPoint(float posX, float posY, color fillColor) {
  Point newPoint = new Point(posX, posY);
  newPoint.fillColor = fillColor;
  points.add(newPoint);
  return newPoint;
}

//connects points with a segment
Segment addSegment(Point point1, Point point2, boolean isVisible, color strokeColor) {
  Segment newSegment = new Segment(point1, point2);
  newSegment.visible = isVisible;
  newSegment.strokeColor = strokeColor;
  segments.add(newSegment);
  return newSegment;
}
}