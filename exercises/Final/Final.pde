
Ball ball;
Paddles[] paddles;



color backgroundColor = color(0);
int halfScreenn;
int currentPos;

boolean falling = false;
float floorY = 600;




void setup() {

  size (400, 700);
  ball = new Ball(width/2, height/2);

  paddles = new Paddles [1000];

  float _yTemp = -3;

  for (int i=0; i<100; i++) {

    if (i%5 == 0) {
      _yTemp = _yTemp - 200;
    }
    paddles[i] = new Paddles (random(width), _yTemp);
  }
}


void draw() {

  background(0);
  ball.update();
  ball.display(); 
  for (int i=0; i<100; i++) {

    paddles[i].update();
    paddles[i].display();
  }
}


void keyPressed() {

  ball.keyPressed();
}

void keyReleased() {
  
  ball.keyReleased();

}