
//CODE SOURCE! fresh off the processing website. shoutsOut to them where would I be
//without their life HaCkS!

import processing.sound.*;
PImage img;
SoundFile sax;
SoundFile guitar;
SoundFile drum;
SoundFile hihat;

//these booleans make music not playing as the default so that later with mouse clicked 
//I can make clicking the quadrent of the window and music will stop and play on click
boolean saxIsPlaying =false;
boolean guitarIsPlaying =false;
boolean drumIsPlaying= false;
boolean hihatIsPlaying=false;


void setup() {
  size(800, 800);
  frameRate(30);
  img = loadImage("hats.jpg");
  img.loadPixels();
  // Only need to load the pixels[] array once, because we're only
  // manipulating pixels[] inside draw(), not drawing shapes.
  loadPixels();

  //these are the files set to play during the running of the program
  sax = new SoundFile(this, "sax.mp3");
  guitar = new SoundFile(this, "guitar.mp3");
  drum = new SoundFile( this, "drum.mp3");
  hihat = new SoundFile(this, "hihat.mp3");

}

//this code basically alters the apperence of the image and makes everything black. once the mouse hovers over the image the pixels show the true color. 
void draw() {
  for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++ ) {
      // Calculate the 1D location from a 2D grid
      int loc = x + y*img.width;
      // Get the R,G,B values from image
      float r, g, b;
      r = red (img.pixels[loc]);
      g = green (img.pixels[loc]);
      b = blue (img.pixels[loc]);
      // Calculate an amount to change brightness based on proximity to the mouse
      float maxdist = 100;//dist(0,0,width,height);
      float d = dist(x, y, mouseX, mouseY);
      float adjustbrightness = 255*(maxdist-d)/maxdist;
      r += adjustbrightness;
      g += adjustbrightness;
      b += adjustbrightness;
      // Constrain RGB to make sure they are within 0-255 color range
      r = constrain(r, 0, 255);
      g = constrain(g, 0, 255);
      b = constrain(b, 0, 255);
      // Make a new color and set pixel in the window
      color c = color(r, g, b);
      pixels[y*width + x] = c;
    }
  }
  updatePixels();
}

//the if statments are what create the 4 sections of the image that are clickabl, each section of the image start and stops when clicked. 
void mousePressed()
{
  if (mouseX>0 && mouseX < width/2 && mouseY>0 && mouseY< height/2)
  {
    println("sax");
    if (saxIsPlaying ==false)
    {
      sax.loop();
      saxIsPlaying=true;
    } else if (saxIsPlaying ==true)
    {
      sax.stop();
      saxIsPlaying=false;
    }
  } else if (mouseX>width/2 && mouseX < width && mouseY>0 && mouseY< height/2)
  {
    println("guitar");
    if (guitarIsPlaying ==false)
    {
      guitar.loop();
       guitar = new SoundFile(this, "guitar.mp3");
      guitarIsPlaying=true;
    } else if (guitarIsPlaying ==true)
    {
      guitar.stop();
      guitarIsPlaying=false;
    }
  }

  if (mouseX>0 && mouseX<width/2 && mouseY>0 && mouseY >height/2)
  {
    println("drum");
    if (drumIsPlaying ==false)
    {
      drum.loop();
      drumIsPlaying=true;
    } else if (drumIsPlaying ==true)
    {
      drum.stop();
      drumIsPlaying=false;
    }
  }
  
  if (mouseX>0 && mouseX>width/2 && mouseY>height/2 && mouseY < height)
  {
    println("hihate");
    if (hihatIsPlaying ==false)
    {
      hihat.loop();
      hihatIsPlaying=true;
    } else if (hihatIsPlaying ==true)
    {
      hihat.stop();
      hihatIsPlaying=false;
    }
  }
}