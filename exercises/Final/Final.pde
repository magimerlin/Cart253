
Ball ball;
Paddles[] paddles;



color backgroundColor = color(0);
int halfScreenn;
int currentPos;

boolean falling = false;
float floorY = 600;




void setup() {

  size (400, 700);
  ball = new Ball(width/2, height/2,25,255);

  paddles = new Paddles [1000];

  float _yTemp = -20;
  float _yStart = -3;

  for (int i=0; i<100; i++) {

    if (i%5 == 0 && i!=0) {
   
    // println(_yTemp);
      _yStart = _yStart - 200;
       _yTemp = _yStart - 50;
         println(i+" "+_yTemp);
      
    }
     paddles[i] = new Paddles (random(width), random(_yStart-200,_yStart));
    //paddles[i] = new Paddles (random(width), _yTemp);
  }
}


void draw() {

  background(0);
  ball.update();
  ball.display(); 
  
  //if we are jumping
  if (ball.jump ==true)
  {
    falling =false;
    // increment the ySpeed
    ball.ySpeed +=1;

    /* reset ... 
     for (int i=0; i< platforms.length; i++)
     {
     platforms[i].onPlatform =false;
     }*/
    // change speed for jump
    ball.y+=ball.ySpeed;
  }

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