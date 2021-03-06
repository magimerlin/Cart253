float theta = 0;
float spinSpeed = 0.1;
Mandala[] mandalas = new Mandala[4]; //the amount of mandalas displayed on the screen.
Mandala mainMandala;


void setup() {
  size(500, 500);
  //this allows for the window to be resized. 
  surface.setResizable(true); 
  //matrtrixSpinner = new 

//this array was addded to allow for new mandalas to be drawn randomly on the screen.
  for (int i = 0; i < mandalas.length; i++) {
    int x = floor(random (0, width));
    int y = floor(random(0, height));
    int size = floor(random(10,200));
    mandalas[i] = new Mandala(x,y,size);
  }
  
  mainMandala = new Mandala(width/4,height/4,100);
}




void draw() {
  background(0);
  
  //DRAWING THE MANDALA! source: taken from pippins math slides. 
    for (int i = 0; i < mandalas.length; i++) {
      mandalas[i].draw();
    }
  
  
  
  //this places the rectangle in the middle of the screen 
  translate(width/2, height/2);
  rotate(theta);
  rectMode(CENTER);
  rect(0, 0, 100, 100);
  //this line controls the speed of the objects and allows for the mouse to correspond with the speed depending on where you move it onthe screen. 
  theta += (mouseX)/spinSpeed/1000;
  spinSpeed += 0.001;
  stroke(random(255), random(255), random(255));

//The main mandala that rotates with the rectangle is drawn using the mandala class.
  mainMandala.draw();
}


//void mouseClicked() {
//}