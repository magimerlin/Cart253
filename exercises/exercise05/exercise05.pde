float theta = 0;
float spinSpeed = 0.1;
//Matrix matrixSpinner;


void setup() {
  size(500,500);
  surface.setResizable(true); // Put this in setup
  //matrtrixSpinner = new 
 
}

void draw() {
  background(0);
  //this places the rectangle in the middle of the screen 
  translate(width/2,height/2);
  rotate(theta);
  rectMode(CENTER);
  rect(0,0,100,100);
  //this line controls the speed of the objects and allows for the mouse to correspond with the speed depending on where you move it onthe screen. 
  theta += (mouseX)/spinSpeed/1000;
  spinSpeed += 0.001;
  stroke(random(255),random(255),random(255));
  

  //this line places the waky mandala half hieght half width based on the position of the rectangle. (its position is now considered the new 0,0 coordinate.)
  translate(width/2, height/2);

  for (float i = 0; i < TWO_PI; i += 0.2) {
    
// all of the code baneath this is creating the mandala object. 
    pushMatrix();
    rotate(theta + i);
    line(0, 0, 100, 5);
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
  // the speed in which the mandla rotates
  theta += 0.01;
 }


void mouseClicked() {

}