class Bouncer {
  
 int x; //where the ellipse starts in the window.
 int y;
 int vx;
 int vy;
 int size;
 color fillColor;
 color defaultColor;
 color hoverColor;
 
 // this defins where the bouncer ball will start, how fast it will go, what size it will be and what colors it will desplay. 
 //Its default color as well as the color it will show when the curser hovers over it.
 Bouncer(int tempX, int tempY, int tempVX, int tempVY, int tempSize, color tempDefaultColor, color tempHoverColor) { 
   x = tempX;
   y = tempY;
   vx = tempVX;
   vy = tempVY;
   size = tempSize;
   defaultColor = tempDefaultColor;
   hoverColor = tempHoverColor;
   fillColor = defaultColor;
 }
 
 void update() {
   //y=y+v the movment of the ellipse.
   x += vx;
   y += vy;
   
   handleBounce();
   handleMouse();
 }
 //CHANGED:
 //everytime the ball hits the side of the window it changes color.
 void handleBounce() {
  
   if (x - size/2 < 0 || x + size/2 > width) {
    vx = -vx; 
    fillColor = color(random(0,255),random(0,255),random(0,255));
   }
   
   if (y - size/2 < 0 || y + size/2 > height) {
     vy = -vy;
      fillColor = color(random(0,255),random(0,255),random(0,255));
   }
   
    
   
   //pervents the ball from moving off the screen
   x = constrain(x,size/2,width-size/2);
   y = constrain(y,size/2,height-size/2);
 }
 
 //this allows  curser to interact with the program changing the fill color of the ellipse.
 void handleMouse() {
   if (dist(mouseX,mouseY,x,y) < size/2) {
    fillColor = hoverColor;
   }
 }

 
 void draw() {
   noStroke();
   fill(fillColor);
   ellipse(x,y,size,size);

 }
 
}