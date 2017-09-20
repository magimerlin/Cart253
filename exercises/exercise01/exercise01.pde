final int CIRCLE_SPEED = 7; // This is the speed the circles is moving across the screen. Currently 7 pixles per second.  
final color NO_CLICK_FILL_COLOR = color(250, 100, 100); //The colour is the basic pink filling the circle.
final color CLICK_FILL_COLOR = color(100, 100, 250); // The blue fill that shows up when you hover the curser over the circle.
final color BACKGROUND_COLOR = color(250, 150, 150); //This is just the background colour
final color STROKE_COLOR = color(250, 150, 150); //colour of the circles border 
final int CIRCLE_SIZE = 50; //The circles... size. Circumpherance and hieght. 

int circleX; // where the circle will be placed on the X axis.  
int circleY; //Where the circle will be placed on the Y axis.
int circleVX;//The velosity on the X axis
int circleVY;//The velocity on the Y axis (where the circle is moving)

void setup() { // All information previously written actually applied
  size(640, 480); //size of the window containing the code 
  circleX = width/2;// makes the circle start in the center of the screen 
  circleY = height/2;//makes the circle start in the center of the screen. 
  //if either the height or width were to be diregarded from this code then the circle would 
  //continuously move alone either, the x or y axis continuously. 
  circleVX = CIRCLE_SPEED;// the speed in witch the circle moves along the x axis 
  circleVY = CIRCLE_SPEED;// the speed in which the circle moves along the y axis
  stroke(STROKE_COLOR);// the circles border colour 
  fill(NO_CLICK_FILL_COLOR); //blue fill when cursure hoveres over moving circle.
  background(BACKGROUND_COLOR); //colour of the background 
}

void draw() {
  //background (0);
    if (dist(mouseX, mouseY, circleX, circleY) < CIRCLE_SIZE/2) {
    fill(CLICK_FILL_COLOR); // this code calculates the position of the curser.
  }
  else {
    fill(NO_CLICK_FILL_COLOR);//
  }
  ellipse(circleX, circleY, CIRCLE_SIZE, CIRCLE_SIZE);
  circleX += circleVX;
  circleY += circleVY;
  if (circleX + CIRCLE_SIZE/2 > width || circleX - CIRCLE_SIZE/2 < 0) {
    circleVX = -circleVX;
  }
  if (circleY + CIRCLE_SIZE/2 > height || circleY - CIRCLE_SIZE/2 < 0) {
    circleVY = -circleVY;
  }
}

void mousePressed() {
  background(BACKGROUND_COLOR);
}