
class Paddles {

  float x;
  float y;
  float vy = .6;
  float vx;

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
    fill (paddlesColor);
    rect(x, y, paddleLength, paddleHeight);
  }
}