/*
a bouncing ball
 */

class Ball {

  //for the jump
  color ballColor;
  float ySpeed;
  float speed = 3;


  int x;
  int y;
  int ballSize;

  boolean jump = false;

  //the keys function enables me to press two keys at the same time. if i want to jump and also 
  //move left or right i will be able to do that. 
  boolean[] keys = {false, false};

  Ball(int _x, int _y, int _ballSize, color _ballColor ) {

    ballSize = _ballSize;
    ballColor = _ballColor;
    x = _x;
    y = _y;
  }

  //void collide (Paddles paddles, Paddle otherPaddles) {
  //}

  void display() {

    noStroke();
    fill(255);
    //draw the circle in it's current position
    ellipse(x, y, ballSize, ballSize);
  }

  void jump() {

    if ( jump == false && falling == false) {
      jump = true;
      ySpeed = -15;
    }
  }


  void update() {

    if (keys[0] ==true)
    {
      x-=speed;
    }
    if (keys[1] ==true)
    {
      x+=speed;
    }

    if (x < 0) {
      x = x + width;
    } else if (x > width) {
      x = x - width;
    }
    
    for (int i = 0; i< platforms.length; i++)
  {

    // if there is collision
    if (paddles[i].collidesWithBallr(m))
    {
      // on a platform
      paddles[i].onPaddles =true;

      ball.y=platforms[i].y-5;
      ball.ySpeed =0;
      ball.jump=false;
      falling =false;
      break;
    }
  }
  // next check if falling
  if (ball.jump ==false)
  {
    for (int i = 0; i< platforms.length; i++)
    {
      //if we are on the platform
      if (platforms[i].onPlatform  ==true)
      {
        println("are on a platform");

        // we want to test if we should falll
        if (platforms[i].collidesWithMover(m) ==false)
        {
          println("falling");
          platforms[i].onPlatform =false;
          falling =true;
          break;
        }
      }
    }
  }




  void keyPressed() {

    if (keyCode ==LEFT)
    {
      keys[0] =true;
    }
    if (keyCode ==RIGHT)
    {
      keys[1] =true;
    }
    //for jump
    if (key == ' ')
    {
      ball.jump();
    }
  }

  void keyReleased()
  {
    if (keyCode ==LEFT)
    {
      keys[0] =false;
    }
    if (keyCode ==RIGHT)
    {
      keys[1] =false;
    }
  }
}