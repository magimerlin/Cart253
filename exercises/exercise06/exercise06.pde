// Exercise 06

//CREDITS: the motion detecting code was sourced from a man in a proccessing chat room!
//his username is Mimansoob! Thanks Mimansoob!

// You can now move these boring looking bouncers with your mind! 
//im not even lying! you move your hand with your mind don't ya!

// Import the video library
import processing.video.*;
//import blobDetection.*;

// The capture object for reading from the webcam
Capture video;
//
PImage prevFrame;
float threshold = 150;
int Mx = 0;
int My = 0;
int ave = 0;

//where the ball starts off on screen.
int ballX = width/8;
int ballY = height/8;
//the speed at which the object moves around the screen. 
int speed = 5;


// An array of bouncers to play with
Bouncer[] bouncers = new Bouncer[10];

// Creates the bouncers and starts the webcam

void setup() {
  size(640, 480);

  // Our old friend the for-loop used to go through the length of an
  // array adding new objects to it (Bouncers in this case)
  for (int i = 0; i < bouncers.length; i++) {
    // Each Bouncer just starts with random values 
    bouncers[i] = new Bouncer(random(0, width), random(0, height), random(-10, 10), random(-10, 10), random(20, 50), color(random(255)));
  }

  // Start up the webcam
  video = new Capture(this, 640, 480, 30);
  video.start();
  //launches the video window and picks up all the colored pixles that make up the frame. 
  prevFrame = createImage (video.width, video.height, RGB);
}


void draw() {

  handleVideoInput();

  // Draw the video frame to the screen
  image(video, 0, 0);


//this is the code that launches the video window.
  if (video.available()) {

    prevFrame.copy(video, 0, 0, video.width, video.height, 0, 0, video.width, video.height); 
    prevFrame.updatePixels();
    video.read();
  }
  loadPixels();
  video.loadPixels();
  prevFrame.loadPixels();

  //
  Mx = 0;
  My = 0;
  ave = 0;

  //Going through every pixel in the video.
  for (int x = 0; x < video.width; x ++ ) {
    for (int y = 0; y < video.height; y ++ ) {

      //It's getting the color of the current frame and the previous frame. 
      int loc = x + y*video.width;            
      color current = video.pixels[loc];      
      color previous = prevFrame.pixels[loc]; 

      //this is splitting the data into red,green and blue.
      //
      float r1 = red(current); 
      float g1 = green(current); 
      float b1 = blue(current);
      float r2 = red(previous); 
      float g2 = green(previous); 
      float b2 = blue(previous);
      //works out how different the pixels are from frame to frame.
      float diff = dist(r1, g1, b1, r2, g2, b2);

      //pixels have to be moving above a certain threshold to allow for the ellipse to actually move.  
      //how different the pixels have to be before the ellipse starts to react.
      if (diff > threshold) { 
        pixels[loc] = video.pixels[loc];
        Mx += x;
        My += y;
        //ave is the count of all of the pixles over time.
        ave++;
      } else {

        pixels[loc] = video.pixels[loc];
      }
    }
  }
  fill(255);
  rect(0, 0, width, height);

  //this is the actual movement of the ellipse. if commented out the ellipse remains in the top right corner. it allows for the ellipse to follow the changing pixels in the video window. 
  if (ave != 0) { 
    Mx = Mx/ave;
    My = My/ave;
  }
  if (Mx > ballX + speed/2 && Mx > 50) {
    ballX+= speed;
  } else if (Mx < ballX - speed/2 && Mx > 50) {
    ballX-= speed;
  }
  if (My > ballY + speed/2 && My > 50) {
    ballY+= speed;
  } else if (My < ballY - speed/2 && My > 50) {
    ballY-= speed;
  }

  updatePixels();
  noStroke();
  fill(0, 0, 255);
  ellipse(ballX, ballY, 20, 20);

  //move to target added to all the bouncers! so that the bouncers can, as the kids say,
  //follow the leader! the blue ellipse!
  for (int i = 0; i<bouncers.length; i++) {
    //bouncers[i].update();
    bouncers[i].moveToTarget();
    bouncers[i].display();
  }
}

void handleVideoInput() {
  if (!video.available()) {
    return;
  }
}