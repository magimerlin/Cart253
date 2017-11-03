// Bouncer
//
// A class that defines a circle that can bounce around on the screen
// at a specific velocity.

class Bouncer {

  // Variables for position
  float x;
  float y;

  // Variables for velocity
  float vx;
  float vy;

  // The size of the Bouncer
  float size;

  // The current fill colour of the Bouncer
  color fillColor;

  // The default fill colour of the Bouncer
  color defaultColor;

  int targetX;
  int targetY;
  float timePassed =0;
  float startTime =0;
  boolean startTimer = false;
  

  // Bouncer(tempX,tempY,tempVX,tempVY,tempSize,tempDefaultColor)
  //
  // Creates a Bouncer with the provided values by remembering them.

  Bouncer(float tempX, float tempY, float tempVX, float tempVY, float tempSize, color tempDefaultColor) {
    x = tempX;
    y = tempY;
    vx = tempVX;
    vy = tempVY;
    size = tempSize;
    defaultColor = tempDefaultColor;
    fillColor = defaultColor;
  }

  // update()
  //
  // Adds the Bouncer's current velocity to its position
  // and checks for bouncing off the walls.
  void update() {
    x += vx;
    y += vy;

    handleBounce();
  }

  // handleBounce()
  //
  // Checks if the bouncer is overlapping a side of the window
  // and if so reverses its velocity appropriately

  void handleBounce() {
    // Check the left and right
    if (x - size/2 < 0 || x + size/2 > width) {
      // Bounce on the x-axis
      vx = -vx;
    }

    // Check the top and bottom
    if (y - size/2 < 0 || y + size/2 > height) {
      // Bounce on the y-axis
      vy = -vy;
    }

    // Make sure the Bouncer isn't off the edge
    x = constrain(x, size/2, width-size/2);
    y = constrain(y, size/2, height-size/2);
  }

  // display()
  //
  // Draw an ellipse in the Bouncer's location, with its size
  // and with its fill
  void display() {
    noStroke();
    fill(fillColor);
    ellipse(x, y, size, size);
  }

  //function added! this allows for the bouncers to follow the blue ellipse but 
  //i haven't added an if statment they all jump on top of each other 
  void moveToTarget()
  {
    //supposed to allow for the bouncers to follow the x and y of the blue ellipse.
    //Pvector added!! and now it works! bouncers move towards blue ellipse.

    PVector mouse = new PVector(ballX, ballY);
    PVector loc = new PVector(x, y);
    PVector dist = PVector.sub(mouse, loc);
    
    //timer added! this is so that the bouncers have more of an independent quality to them.
    //they move toward the blue ellipse for 1 second and then break apart once the timer 
    //has expired. 
    if (dist.mag()>1 && startTimer ==false)
    {
      dist.normalize();
      dist.mult(5);
      x+=dist.x;
      y+=dist.y;
    } 
    
    else
    {
      if (startTimer ==false)
      {
        timePassed =0;
        startTime =millis(); 
        startTimer =true;
      }
      
      if (startTimer ==true)
      {
        timePassed = millis()-startTime;
      }
      if(timePassed>2500)
      {
        startTimer =false;
      }
       
        update();
    }
  }
}