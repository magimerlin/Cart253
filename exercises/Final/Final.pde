
Ball ball;

color backgroundColor = color(0);
  
  int PosX() {
    //return next X;
  }

  int PosY() {
    //return next Y;
  }

void setup() {
  size (400, 700, P3D);
  ball = new Ball(width/2, height/2);
}

void draw() {

  ball.update();
  ball.display(); 
  
  noFill();
  background(204);
  camera(70.0, 35.0, 120.0, PosX(), PosY(), 0.0, 
    0.0, 1.0, 0.0);
  translate(50, 50, 0);
  rotateX(-PI/6);
  rotateY(PI/3);
  box(45);
}


void keyPressed() {

  ball.keyPressed();
}

void keyReleased() {

  ball.keyReleased();
}