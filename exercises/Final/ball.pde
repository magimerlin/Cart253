/*
a bouncing ball
 */

class Ball{
  
  int SPEED = 10
  int SIZE = 16

  int x;
  int y;
 
  //create a variable for velocity
  int vx;
  int vy; 
  
  Ball(int _x,int_y) {
    x = _x;
    y = _y;
   vx = SPEED;
   VY = SPEED;
  }
  
  void update() {
    
    x += vx;
    y += vy;
    
  }
  
  void collide (Paddles paddles, Paddle otherPaddles) {
  }
  
  void display() {
    
    noStroke();
    fill(ballColor)
   

  char leftkey='k' ;
  char rightkey='l';

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
    ellipse(ballX, ballY, h, h);

    //add a little gravity to the speed
    //speedY = speedY + .7;  

    //add speed to the ball's
    ballY = ballY + speedY; 


    if (ballY > height - h) {
      // set the position to be on the floor
      ballY = height - h;
      // and make the y speed 90% of what it was,
      // but in the opposite direction
      speedY = speedY * -0.9;

      //switch the direction
      //speedY = speedY;
    } else if (ballY <= 0) { 
      // if the ball hits the top,
      // make it bounce off
      speedY = -speedY;
    }
  }
}