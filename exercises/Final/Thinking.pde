
class Thinking {

//this class originally acted like a paddle but has been changed to fade on top of the ball object every 30 seconds the game is running. 
//it moves with the ball until the 30 seconds is up. After the next "thought" fades in and thisd goes on until the the program runs 
//out of thoughts.
  
  
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

    //this is what allows for the text to fade in on top of the ellipse and move where ever the it moves until its TIME. IS. UP.
    
    if ( millis() > timeInterval &&startedMoving==0) {
      startedMoving =1;
     
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
      alpha +=0.40; //ALPHA is what allows for the text to fade in. the number is the speed at which the text fades in at.
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