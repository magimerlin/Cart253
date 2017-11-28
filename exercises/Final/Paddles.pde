
class Paddles {

  int x;
  float y;
  float vy = 1;
  float vx;

  int size;

  int paddleHeight = 10;
  int paddleLength = 50;

  color fill = (255);

  color paddlesColor = color(255);


  Paddles( int X, float Y) {

    x = X;
    y = Y;
  }

  void update() {

    //the only direction the paddles are able to move is along the y axis... for now?
    y += vy;
  }

  void display() {

    noStroke();
    rectMode(CORNER);
    fill (paddlesColor);
    rect(x, y, paddleLength, paddleHeight);
  }

//these booleans 
//
  boolean collidesWithBall (Ball ball) {
    boolean fromRightLeft = ball.x +(ball.ballSize/2)  >= x && (ball.x-(ball.ballSize/2))<= (x + paddleLength);
      boolean fromTop = ball.y+(ball.ballSize/2)>= y && ball.y+(ball.ballSize/2)<(y+5)+ball.ySpeed;

    if (fromRightLeft  && fromTop)
    {
      println("collision");
      return true ;
    }

    return false;
  }
}