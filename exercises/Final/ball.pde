/*
a bouncing ball
 */

class Ball {
  
  SoundFile jumpSound;

  //for the jump
  color ballColor;
  float ySpeed;
  float speed = 3;
  int onAPaddle = -1;
 


  float x;
  float y;
  int ballSize;

  boolean jump = false;

  //the keys function enables me to press two keys at the same time. if i want to jump and also 
  //move left or right i will be able to do that. 
  boolean[] keys = {false, false};

  Ball(int _x, int _y, int _ballSize, color _ballColor, PApplet processing ) {

    jumpSound = new SoundFile(processing, "boop.wav");
    ballSize = _ballSize;
    ballColor = _ballColor;
    x = _x;
    y = _y;
  }

  //void collide (Paddles paddles, Paddle otherPaddles) {
  //}

  void display() {

    noStroke();
    fill(ballColor);
    //draw the circle in it's current position
    ellipse(x, y, ballSize, ballSize);
  }

  void jump() {

    if ( jump == false && falling == false) {
      jump = true;
      ySpeed = -17;
    }
    
     jumpSound.play();

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
    } else if ( x> width) {
      x = x-width;
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
        jump();
        println("boop");
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