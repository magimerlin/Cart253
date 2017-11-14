
Ball ball;

color backgroundColor = color(0);

void setup() {
  size (400,700);
  ball = new Ball(width/2,height/2,'k','l');
 
}

void draw(){
}

void keyPressed() {
  
  ball.keyPressed();

}

void keyReleased(){

  ball.keyReleased();
}