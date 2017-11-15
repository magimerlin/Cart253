
class Paddles {

  float x;
  float y;
  float vy = .6;
  float vx;


  boolean onPaddles = false;

  int size;

  int paddleHeight = 10;
  int paddleLength = 50;

  color fill = (255);
  //boolean ballHitsPaddles = false; 

  color paddlesColor = color(255);


  Paddles( float X, float Y) {

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

    if ( ball.x > x && ball.x < x + paddleLength
      && ball.y-(ball.ballSize/2) > y && ball.y-(ball.ballSize/2) < y + 5)
    {

      return true ;
    }

    return false;
  }
}