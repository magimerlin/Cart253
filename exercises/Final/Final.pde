
Ball ball;

color backgroundColor = color(0);

void setup() {
  size (400,700);
  ball = new Ball(width/2,height/2);
 
}

void draw(){
  
  background(0);
  
  ball.update();
  ball.display();
}

void keyPressed() {
  
  ball.keyPressed();

}

void keyReleased(){

  ball.keyReleased();
}