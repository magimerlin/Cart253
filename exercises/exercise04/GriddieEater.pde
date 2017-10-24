

class GriddieEater {
  // Limits for energy level and gains/losses
  
  int energy; 
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
    
 int xMoveType = floor(random(-1,2));
    int yMoveType = floor(random(-1,2));
    x += size * xMoveType;
    y += size * yMoveType;
    
    // QUESTION: What are these if statements doing?
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
    // QUESTION: What is this if-statement for?
  
    // QUESTION: What does this if-statement check?
    if (x == other.x && y == other.y) {
      // Increase this Griddie's energy
      energy -= collideEnergy;
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