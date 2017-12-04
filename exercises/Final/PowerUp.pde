
class PowerUp {

  SoundFile powerUpSound;

  int SPEED = 2;
  float x;
  int y;
  // float mx;
  int vx;
  int vy;
  int powerUpSize =20;
  long startTimer;
  long timePassed;
  long timeInterval = 30000;
  boolean startPowerUp = false;

  color powerUpColor = color (0, 0, 255);

  PowerUp(float _x, int _y, PApplet processing) {

    powerUpSound = new SoundFile(processing, "powerup.wav");
    x = _x;
    y = _y;
    vx = SPEED;
    vy = SPEED;
    startTimer = millis();
  }

  void update() { 

    //this is the timer that allows for the power up to float down randomly across the screen every 30 seconds 
    if (startPowerUp == false) {

      timePassed = millis() - startTimer;
      if (timePassed > timeInterval) {
        startPowerUp = true;
      }
    }
    if (startPowerUp == true) {


      if (y%40 ==0)
      {
        vx = (int)random(-10, 10);
      }


      x+=vx;
      y+= vy;
      if (x> width) x=width-20;
      if (x<0)x = 20;

      if (y > height) {
        y  = -50;
        x = random(20, width-20);
        startPowerUp = false;
        startTimer = millis();
        timePassed = 0;
      }
    }
  }
  
 //this code was borrowed from the paddle class. It detects when the ball collides with the power up activating the reduction of speed the 
 //paddles are moving at as well as a quarky sound I added to make sure the player knows when he or she has collided with the power up.
  boolean collidesWithBall (Ball ball) {
    boolean fromRightLeft = ball.x +(ball.ballSize/2)  >= x && (ball.x-(ball.ballSize/2))<= (x + powerUpSize);
    boolean fromTop = ball.y+(ball.ballSize/2)>= y && ball.y+(ball.ballSize/2)<(y+powerUpSize);

    if (fromRightLeft  && fromTop)
    {
      powerUpSound.play();
      println("collisionPowerUp");
      return true ;
    }

  return false;
}


void display() {

  noStroke();
  rectMode(CORNER);
  fill (255, 0, 0);
  rect(x, y, powerUpSize, powerUpSize);
}
}