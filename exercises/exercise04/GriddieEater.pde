

class GriddieEater {
  // Limits for energy level and gains/losses
  //the griddie eaters innitial energy was zero, they were technically so pale they were invisiible so I just put their energy at 255 so you can see them.
  int energy = 255; 
  int collideEnergy = -255;
  
  // Position, size, energy, and fill color
  int x;
  int y;
  int size;
  color fill = color(0,0,255);

  // Griddie(tempX, tempY, tempSize)
  //
  // Set up the Griddie with the specified location and size
  // Initialise energy to the maximum
  GriddieEater(int tempX, int tempY, int tempSize) {
    x = tempX;
    y = tempY;
    size = tempSize;

  }

  // update()
  //
  // Move the Griddie and update its energy levels
  void update() {
    
     if (energy == 0) {
      return;
    }
    
 int xMoveType = floor(random(-1,2));
    int yMoveType = floor(random(-1,2));
    x += size * xMoveType;
    y += size * yMoveType;
    

    if (x < 0) {
      x += width;
    }
    else if (x >= width) {
      x -= width;
    }
    if (y < 0) {
      y += height;
    }
    else if (y >= height) {
      y -= height;
    }

  }

  // collide(other)
  //
  // Checks for collision with the other Griddie
  // and updates energy level
  
  void collide(Griddie other) {

    if (x == other.x && y == other.y) {
     //DECREASE THE GRIDDIES ENERGY TO ZERO! before I had the griddie eaters energy being added with the collide energy instead of the griddies. now the eaters will be able to eat!
      other.energy += collideEnergy;
      // Constrain the energy level to be within bound
    }
  }

  // display()
  //
  // Draw the Griddie on the screen as a rectangle
  void display() {
    // QUESTION: What does this fill line do?
    fill(fill, energy); 
    noStroke();
    rect(x, y, size, size);
  }
}