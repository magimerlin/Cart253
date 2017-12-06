
class Thinking {

   //this class acts a lot like the paddles but is also using an
  
  
  int x;
  float y;
  float vy = 1;
  float vx;

  int size;


  color textColor = color(255,0,0);

  String displayText;
  int timeInterval;




  Thinking( int X, float Y, String textString, int interval) {

    x = X;
    y = Y;
    displayText = textString;
    timeInterval = interval;
  }

  void update() {

    //the only direction the paddles are able to move is along the y axis... for now?
    if ( millis() > timeInterval ) {

      y += vy;
    }
  }

  void display() {

    noStroke();
    rectMode(CORNER);
    fill (textColor);
    textSize(40);
    text(displayText, x, y);
  }
}