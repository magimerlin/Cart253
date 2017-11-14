
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