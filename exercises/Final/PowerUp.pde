
class PowerUp {

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

  PowerUp(float _x, int _y) {
    x = _x;
    y = _y;
    vx = SPEED;
    vy = SPEED;
    startTimer = millis();
  }

  void update() { 

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
      
      if (y > height){
        y  = -50;
        x = random(20,width-20);
         startPowerUp = false;
         startTimer = millis();
         timePassed = 0;
      }
    }
  }

  boolean collidesWithBall (Ball ball) {

    boolean fromRightLeft = ball.x +(ball.ballSize/2)  >= x && (ball.x-(ball.ballSize/2))<= (x + powerUpSize);
    boolean fromTop = ball.y+(ball.ballSize/2)>= y && ball.y+(ball.ballSize/2)<(y+powerUpSize);

    if (fromRightLeft  && fromTop)
    {
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