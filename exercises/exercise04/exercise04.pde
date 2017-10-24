// Griddies
// by Pippin Barr
// MODIFIED BY: MAGI MERLIN
//
// A simple artificial life system on a grid. The "griddies" are squares that move
// around randomly, using energy to do so. They gain energy by overlapping with
// other griddies. If a griddie loses all its energy it dies.

// The size of a single grid element
int gridSize = 20;
// An array storing all the griddies
Griddie[] griddies = new Griddie[100];
GriddieEater[] griddieEaters = new GriddieEater[20];

// setup()
//
// Set up the window and the griddies

void setup() {
  // Set up the window size and framerate (lower so we can watch easier)
  size(640, 480);
  frameRate(10);

  // QUESTION: What does this for loop do? ANSWER: This loop allows for the Griddies to be created however many times determined at the begginging of the code. (whether it is 100 griddies or 1000.)
  // whenever i is less then 100 (in this case) 100 griddies will be drawn around the screen randomly only on whole numbers.
  for (int i = 0; i < griddies.length; i++) {
    int x = floor(random(0, width/gridSize));
    int y = floor(random(0, height/gridSize));
    griddies[i] = new Griddie(x * gridSize, y * gridSize, gridSize);
  }
    for (int i = 0; i < griddieEaters.length; i++) {
    int x = floor(random(0, width/gridSize));
    int y = floor(random(0, height/gridSize));
    griddieEaters[i] = new GriddieEater(x * gridSize, y * gridSize, gridSize);
  }
}

// draw()
//
// Update all the griddies, check for collisions between them, display them.

void draw() {
  background(50);

  // We need to loop through all the griddies one by one
  for (int i = 0; i < griddies.length; i++) {

    // Update the griddies
    griddies[i].update();

    // Now go through all the griddies a second time...
    for (int j = 0; j < griddies.length; j++) {
      // QUESTION: What is this if-statement for? ANSWER: This statment ensures that when the griddies touch and cross paths something will happen. first we need to make the 100 griddies
      //and then loop through them again to check whether or not they overlap with each other.
      if (j != i) {
        // QUESTION: What does this line check? ANSWER: this checks when the griddies cross paths with one another
        griddies[i].collide(griddies[j]);
      }
    }
    
    // Display the griddies
    griddies[i].display();
  }
  for (int i = 0; i < griddieEaters.length; i++) {

    // Update the griddies
    griddieEaters[i].update();

    // Now go through all the griddies a second time...
    for (int j = 0; j < griddieEaters.length; j++) {
      // QUESTION: What is this if-statement for? ANSWER: This statment ensures that when the griddies touch and cross paths something will happen. first we need to make the 100 griddies
      //and then loop through them again to check whether or not they overlap with each other.
      if (j != i) {
        // QUESTION: What does this line check? ANSWER: this checks when the griddies cross paths with one another
        griddieEaters[i].collide(griddies[j]);
      }
    }
    
    // Display the griddies
    griddieEaters[i].display();
  }
}