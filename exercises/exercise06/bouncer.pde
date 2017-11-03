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
   mouseX = targetX;
   mouseY= targetY;
   


   
   //meant to allow the bouncers to FOLLOW the blue ellipse instead of pilling on top of it.
   float distX = targetX-x;
   
   if(distX>2)
   {
     x=x+(distX/10);
   }
   
   if(distX<2)
   {
      x=x-(distX/10);
   }
   /*else 
   {
     x=targetX;
   }*/
   
    /*float distY = targetY-y;
   
   if(distY>0)
   {
     y+=distY/10;
   }
   else if(distY<0)
   {
      y-=distY/10;
   }
   */
  // }
    
    
    
  }
}