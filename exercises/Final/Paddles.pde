
class Paddles {

  int x;
  int y;
  float vy = 1;
  float vx;

  int size;

  int paddleHeight = 10;
  int paddleLength = 50;

  color fill = (255);
  //boolean ballHitsPaddles = false; 

  color paddlesColor = color(255);


  Paddles( int X, int Y) {

    x = X;
    y = Y;
  }

  void update() {

    y += vy;
  }

  void display() {

    noStroke();
    rectMode(CORNER);
    fill (paddlesColor);
    rect(x, y, paddleLength, paddleHeight);
  }

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