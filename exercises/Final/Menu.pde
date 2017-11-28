

class Menu {
  

  PenroseLSystem ds;
  String button = "play";
  int x;
  int y;
  PFont font;
  PFont fontSmall;
  PFont fontBold;

  Menu() { 

    font = createFont("Amatic-Regular.ttf", 50);
    fontSmall = createFont("Amatic-Regular.ttf", 32);


    ds = new PenroseLSystem();
    ds.simulate(4);
    x =width/2;
    y=height/2;
  }



  void display() {

    //image (titleImage, width/2, 100);
    textFont(font);
    text("It's Easy Until It's Hard", width/2, 100);
    textAlign(CENTER);
   
    //This Allows for the sketch to be drawn in the background of the play button and title text.
    pushMatrix();
    ds.render();
    popMatrix();
    //textSize(30);
    
    //this displays both the red rectangle and the "play" text. 
    fill(255, 0, 0);
    rectMode(CORNER);
    rect(x, y, 50, 30);
    fill(255);
    textFont(fontSmall);
    text(button, x+25, y+24);
  }

//this code allows for people to enter the game on click
  void mousePressed()
  {
    println("mouse");
    if (mouseX>x && mouseX<x+50 && mouseY>y && mouseY<y+30)
    {
      showMenu =false;
      startTime = millis();
    }
  }
}