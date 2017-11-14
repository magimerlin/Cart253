
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
    
   }
   
    void display() {

    noStroke();
    fill(255);
    //draw the circle in it's current position
    ellipse(x, y, SIZE, SIZE);
  }

}