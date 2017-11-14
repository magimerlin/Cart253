/*
a bouncing ball
 */

class Ball {

  int SPEED = 10;
  int SIZE = 16;

  int x;
  int y;

  //create a variable for velocity
  int vx;
  int vy;

  char rightKey;
  char leftKey;

  Ball(int _x, int _y, char _rigthKey, char _lefkey ) {
    x = _x;
    y = _y;
    vx = SPEED;
    vy = SPEED;

    rightKey = _rightKey;
    leftKey = _leftKey;
  }

  void update() {

    x += vx;
    y += vy;
  }

  //void collide (Paddles paddles, Paddle otherPaddles) {
  //}

  void display() {

    noStroke();
    fill(255);
  }

  void setup() {
    size(400, 700);
    smooth();
    noStroke();

    // change the mode we draw circles so they are
    // aligned in the top left
    ellipseMode(CENTER);
  }

  void draw() {
    //clear the background and set the fill colour
    background(0);
    fill(255);

    //draw the circle in it's current position
    ellipse(x, y, SIZE, SIZE);

    //add a little gravity to the speed
    //speedY = speedY + .7;  

    //add speed to the ball's
    x = y + vy; 


    if (y > height - SIZE) {
      // set the position to be on the floor
      y = height - SIZE;
      // and make the y speed 90% of what it was,
      // but in the opposite direction
      vy = -vy ;

      //switch the direction
      //speedY = speedY;
    } else if (y <= 0) { 
      // if the ball hits the top,
      // make it bounce off
      vy = -vy;
    }
  }

  void keyPressed() {

    if (key == rightKey) {

      vx = SPEED;
    } else if (key == leftKey) {

      vx = -SPEED;
    }
  }
}