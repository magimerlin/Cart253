
class Thinking {

   //this class acts a lot like the paddles but is also using an
  
  
  float x;
  float y;
  float vy = 1;
  float vx;

  int size;


  color textColor = color(255,0,0);

  String displayText;
  int timeInterval;
  int startedMoving =0;
  float alpha =0;
  int endInterval;




  Thinking( int X, float Y, String textString, int interval) {

    x = X;
    y = Y;
    displayText = textString;
    timeInterval = interval;
    endInterval=timeInterval+12000;
  }

  void update() {

    //the only direction the paddles are able to move is along the y axis... for now?
    if ( millis() > timeInterval &&startedMoving==0) {
      startedMoving =1;
     // y += vy;
    }
    if(startedMoving ==1)
    {
      x= ball.x;
      y = ball.y;
    }
    if(millis()>endInterval && startedMoving ==1)
    {
      startedMoving =2;
    }
    if(startedMoving ==2 && alpha >0)
    {
       x= ball.x;
      y = ball.y;
    }
    if(startedMoving ==2&& alpha <=0)
    {
      startedMoving=3;
    }
  }

  void display() {

    noStroke();
    rectMode(CORNER);
    if(alpha <255 && startedMoving ==1)
    {
      alpha +=0.40;
    }
     if(alpha >=0 && startedMoving ==2)
    {
      alpha -=0.40;
    }
    fill (textColor,alpha);
    textSize(40);
    text(displayText, x, y);
  }
}