float theta = 0;


void setup() {
  size(500,500);
}

void draw() {
  background(0);
  translate(width/2,height/2);
  rotate(theta);
  rectMode(CENTER);
  rect(0,0,100,100);
  theta += 0.01;
  
  stroke(255);
  // Translate to center of window
  translate(width/2, height/2);
  // Loop from 0 to 360 degrees (2*PI radians)
  for (float i = 0; i < TWO_PI; i += 0.2) {
    // Push, rotate and draw a line!
    pushMatrix();
    rotate(theta + i);
    line(0, 0, 100, 0);
    // From 0 to 360 degrees (2*PI radians)
    for (float j = 0; j < TWO_PI; j += 0.5) {
      // Push, translate, rotate!
      pushMatrix();
      translate(100, 0);
      rotate(-theta - j);
      line(0, 0, 50, 0);
      // Done with the inside loop, pop!
      popMatrix();
    }
    // Done with the outside loop, pop!
    popMatrix();
  }
  endShape();
  // Increment theta
  theta += 0.01;
}