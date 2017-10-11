class PowerUp {
     
    // Default values for speed and size
  int SPEED = 3;
  int SIZE = 16;

  // The location of the ball
  int x;
  int y;

  // The velocity of the ball
  int vx;
  int vy;
  color powerUpcolor = color(255,0,0);
  
  PowerUp(int _x, int _y) {
    x = _x;
    y = _y;
    vx = SPEED;
    vy = SPEED;
  }
  
    void update() {
    // First update the location based on the velocity (so the ball moves)
    x += vx;
    y += vy;
    
    // CHANGED: four new classes that allow for both players paddles to be manipulated 
    //fastPaddle();
    //ballMultiply();
    //slowPaddle();
    //smallPaddle();
    //sabotagePaddle();

    // Check if the ball is going off the top of bottom
    if (y - SIZE/2 < 0 || y + SIZE/2 > height) {
      // If it is, then make it "bounce" by reversing its velocity
        vy = -vy; }
    }
     boolean isOffScreen() {
    return (x + SIZE/2 < 0 || x - SIZE/2 > width);
  }
     void reset() {
    x = (int)random(500);
    y = (int)random(350);
    vx = (int) 
     }
    
     //CHANGED: this is what the class is going to be able to execute, each either effecting itself, the opposite paddle or the ball itself. 
     void fastPaddle(Paddle paddleHit) {
      paddleHit.SPEED = 13;
     }
     void slowPaddle(Paddle paddleOpponent){
       paddleOpponent.SPEED = 4;
     }
     void smallPaddle (Paddle paddleOpponent) {
       paddleOpponent.HEIGHT = 40;
     }
     void sabotagePaddle (Paddle paddleHit){
       paddleHit.SPEED = 4;
     }
    void ballMultiply (){
       //Ball = 10*Ball;
       }
    
     //this if statment allows for the new classes and their uses to be put into action. if the item hits the paddle then the function assigned will be applied. 
  void collide(Paddle paddleHit , Paddle paddleOpponent) {
    
    boolean insideLeft = (x + SIZE/2 > paddleHit.x - paddleHit.WIDTH/2);
    boolean insideRight = (x - SIZE/2 < paddleHit.x + paddleHit.WIDTH/2);
    boolean insideTop = (y + SIZE/2 > paddleHit.y - paddleHit.HEIGHT/2);
    boolean insideBottom = (y - SIZE/2 < paddleHit.y + paddleHit.HEIGHT/2);
   
       if (insideLeft && insideRight && insideTop && insideBottom) {
         paddleOpponent.HEIGHT = 40;
         fastPaddle(paddleHit);
         slowPaddle(paddleOpponent);
         smallPaddle(paddleOpponent);
         //ballMultiply(paddleHit);
         
    } 
  }
  
  void display() {
    // Set up the appearance of the ball (no stroke, a fill, and rectMode as CENTER)
    noStroke();
    fill(powerUpcolor);
    rectMode(CENTER);

    // Draw the ball
    rect(x, y, SIZE, SIZE);
  }
}