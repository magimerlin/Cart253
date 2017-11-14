
class Ball {

  int SPEED = 5;
  int SIZE = 25;

  int x;
  int y;

  //create a variable for velocity
  int vx;
  int vy;


  Ball(int _x, int _y ) {
    x = _x;
    y = _y;
    vx = 0;
    vy = SPEED;

 
  }
   void update() {

    x += vx;
    y += vy; 
    
    if (y > height - SIZE) {
      // set the position to be on the floor
      y = height - SIZE;
      // and make the y speed 90% of what it was,
      // but in the opposite direction
      vy = -vy ;

      //switch the direction
      //speedY = speedY;
    } else if (y <= 350) { 
      // if the ball hits the top,
      // make it bounce off
      vy = -vy;
    }
    
    if ( x< 0) {
    x = x + width;
    }
    
    else if ( x> width) {
      x = x-width;
    }
   }
   
    void display() {

    noStroke();
    fill(255);
    //draw the circle in it's current position
    ellipse(x, y, SIZE, SIZE);
  }
  
  void keyPressed() {
 
    if (keyCode == RIGHT) {
      vx = SPEED;
    } else if (keyCode == LEFT) {
      vx = -SPEED;
    }
  }
   
   void keyReleased() {

 
  }
  
}