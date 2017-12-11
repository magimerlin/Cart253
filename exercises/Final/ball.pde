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

  //the keys function enables me to press two keys at the same time. If I want to jump and also 
  //move left or right i will be able to do that. 
  boolean[] keys = {false, false};

  Ball(int _x, int _y, int _ballSize, color _ballColor, PApplet processing ) {

    jumpSound = new SoundFile(processing, "boop.wav");
    ballSize = _ballSize;
    ballColor = _ballColor;
    x = _x;
    y = _y;
  }

  void display() {

    noStroke();
    fill(ballColor);
    //draw the circle in it's current position
    ellipse(x, y, ballSize, ballSize);
  }

  void jump() {

    //where the sound gets activated, whenever the player presses the space bar the sound hgets played.
    if ( jump == false && falling == false) {
      jump = true;
      ySpeed = -17;
    }
    
     jumpSound.play();

  }

//the following is what controls or assigns the balls movement on certain commands, in this case the commands are whether the player is pressing
//the left and right arrow keys or the space bar. 
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