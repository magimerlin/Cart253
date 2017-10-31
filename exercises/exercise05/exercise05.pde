float theta = 0;


void setup() {
  size(500,500);
  surface.setResizable(true); // Put this in setup
}

void draw() {
  background(0);
  translate(width/2,height/2);
  rotate(theta);
  rectMode(CENTER);
  rect(0,0,100,100);
  theta += 0.01;
  println(width,height);
  stroke(255);

  translate(width/2, height/2);

  for (float i = 0; i < TWO_PI; i += 0.2) {

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

      popMatrix();
    }

    popMatrix();
  }
  endShape();
  // Increment theta
  theta += 0.01;
}

void mouseClicked() {
  surface.setSize(1000,20); //changes the size of the window.
}