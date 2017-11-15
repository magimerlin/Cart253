
Ball ball;
Paddles[] paddles;



color backgroundColor = color(0);
int halfScreenn;
int currentPos;

boolean falling = false;
float floorY = 600;




void setup() {

  size (400, 700);
  ball = new Ball(width/2, height/2,10,255);

  paddles = new Paddles [1000];

  float _yTemp = -20;
  float _yStart = -3;

  for (int i=0; i<1000; i++) {

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

  for (int i=0; i<1000; i++) {

    paddles[i].update();
    paddles[i].display();
  }
  for (int i = 0; i< paddles.length; i++)
  {

    // if there is collision
    if (paddles[i].collidesWithBall(ball))
    {
      // on a platform
      paddles[i].onPaddles =true;

      ball.y= (int)paddles[i].y-5;
      ball.ySpeed =0;
      ball.jump=false;
      falling =false;
      break;
    }
  }
  // next check if falling
  if (ball.jump ==false)
  {
    for (int i = 0; i< paddles.length; i++)
    {
      //if we are on the platform
      if (paddles[i].onPaddles  ==true)
      {
        println("are on a platform");

        // we want to test if we should falll
        if (paddles[i].collidesWithBall(ball) ==false)
        {
          println("falling");
          paddles[i].onPaddles =false;
          falling =true;
          break;
        }
      }
    }
  }
   // if we are falling then go down
  if (falling ==true)
  {
    ball.ySpeed +=1;
    ball.y+=ball.ySpeed;
    // stop at ground
    if (ball.y>floorY-50)
    {
      falling =false;
    }
  }
  
}


void keyPressed() {

  ball.keyPressed();
}

void keyReleased() {
  
  ball.keyReleased();

}