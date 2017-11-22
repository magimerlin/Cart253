

class Menu {

  PenroseLSystem ds;
  String button = "play";
  int x;
  int y;
  Menu() { 
    ds = new PenroseLSystem();
    ds.simulate(4);
    x =width/2;
    y=height/2;
  }



  void display() {
 pushMatrix();
    ds.render();
    popMatrix();
      textSize(20);
      
      fill(255,0,0);
      rectMode(CORNER);
      rect(x,y,50,30);
    fill(255);
    
    text(button, x+4, y+20); 
  
  }
  
  void mousePressed()
  {
    println("mouse");
    if(mouseX>x && mouseX<x+50 && mouseY>y && mouseY<y+30)
    {
      showMenu =false;
      startTime = millis();
    }
  }
}