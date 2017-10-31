class Mandala {

  int x;
  int y;
  int size;
  float theta;

  Mandala(int tempX, int tempY, int tempSize) {
    x = tempX;
    y = tempY;
    size = tempSize;
    theta = 0;
  }

  void draw() {
    for (float i = 0; i < TWO_PI; i += 0.2) {
      // all of the code baneath this is creating the mandala object. 
      pushMatrix();
      translate(x,y);
      rotate(theta + i);
      line(0, 0, size, 5);
      // From 0 to 360 degrees (2*PI radians)
      for (float j = 0; j < TWO_PI; j += 0.5) {
        // Push, translate, rotate!
        pushMatrix();
        translate(size, 0);
        rotate(-theta - j);
        line(0, 0, size/2, 0);
        popMatrix();
      }
      popMatrix();
    }
    theta += 0.01;
  }
}