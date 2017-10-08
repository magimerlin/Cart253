color backgroundColor = color(0);

int numStatic = 1000;
int staticSizeMin = 1;
int staticSizeMax = 3;
color staticColor = color(180, 0, 150); 

int paddleX;
int paddleY;
int paddleVX;
int paddleSpeed = 10;
int paddleWidth = 200; // CHANGED: I want to make the paddle reduce in size everytime the ball hits it but stops getting small around size 60.
int paddleHeight = 16;
color paddleColor = color(255);

int ballX; //position of the ball on the screen relative to the x axis 
int ballY;
int ballVX; //speed of the ball relative to the x axis
int ballVY;
int ballSpeed = 1; //CHANGED: ball speed will start at 1px/sec.
int maxBallSpeed = 9; // this is the maximum ball speed. 
int ballSize = 16;
int acceleration = 1; //This allows the balls speed to accelerate by 1px/sec 
color ballColor = color(255);

void setup() {
  size(640, 480);

  setupPaddle();
  setupBall();
}

void setupPaddle() {
  paddleX = width;
  paddleY = height - paddleHeight;
  paddleVX = 0;
}

void setupBall() {
  ballX = width/2;
  ballY = height/2;
  ballVX = ballSpeed;
  ballVY = ballSpeed;
}

void draw() {
  background(backgroundColor);

  drawStatic();

  updatePaddle();
  updateBall();

  
  drawPaddle();
  drawBall();
}

void drawStatic() {
  for (int i = 0; i < numStatic; i++) {
    float x = random(0, width);
    float y = random(0, height);
    float staticSize = random(staticSizeMin, staticSizeMax);
    fill(staticColor);
    ellipse(x, y, staticSize, staticSize);
  }
}

void updatePaddle() {
  paddleX += paddleVX;  
  paddleX = constrain(paddleX, 0+paddleWidth/2, width-paddleWidth/2); // this makes the paddle stay in the confines of the programs window. 
}

void updateBall() {
  ballX += ballVX;
  ballY += ballVY;

  handleBallHitPaddle();
  handleBallHitWall();
  handleBallOffBottom();

}

void drawPaddle() {
  rectMode(CENTER);
  noStroke();
  fill(paddleColor);
  rect(paddleX, paddleY, paddleWidth, paddleHeight);
}

void drawBall() { 
  rectMode(CENTER);
  noStroke();
  fill(ballColor);
  rect(ballX, ballY, ballSize, ballSize);
}
  


void handleBallHitPaddle() {
  if (ballOverlapsPaddle()) {
    ballY = paddleY - paddleHeight/2 - ballSize/2; //makes sure ball hits the edge of paddle instead of going inside it. 
    ballVY = -ballVY;
    accelerateBall();  // VARIABLE added, acceleration of the ball.
      
   if (paddleWidth > 60){
        paddleWidth = paddleWidth - 10; // CHANGED: the paddle starts at 200 and reduces by 10px everytime the ball hits the paddle. it will stop reducing in size when 
        //hits the width of 60px. 
        
         //accelerateBall();{
         //  if (ballVX > ballspeed + 9)
           
        }
     }
  }


void accelerateBall(){
      if (ballVX < 0) { 
      ballVX = ballVX-acceleration;
    } else {
      ballVX = ballVX+acceleration;
    }
    if (ballVY < 0) { 
      ballVY = ballVY-acceleration;
    } else {
      ballVY = ballVY+acceleration; //these else and if functions allows the ball to accelerate everytime it hits the paddle.
    }
    
    if (ballVX > maxBallSpeed) { //this code stops the ball from accelerating forever and limits its speed to 9px/sec. 
      ballVX = maxBallSpeed; 
    }
    else if (ballVX < -maxBallSpeed){
      ballVX = -9;
    }
      
    if (ballVY> 9) {
        ballVY = maxBallSpeed; 
         }
         else if (ballVY < -maxBallSpeed) {
           ballVY = -maxBallSpeed; 
         }
 
      }
      
    //if (ballVX <= 9) {
    //  ballVX = -9; }
    //  else {
    //    ballVY = 9;}
    //   if (ballVY <= 9) {
    //  ballVY = -9; }
    //  else {
    //    ballVY = 9;}  
      

  
  
boolean ballOverlapsPaddle() {
  if (ballX - ballSize/2 > paddleX - paddleWidth/2 && ballX + ballSize/2 < paddleX + paddleWidth/2) {
    if (ballY > paddleY - paddleHeight/2) {
      println("hello");
      return true;
      
    }
  }
  return false;
}

void handleBallOffBottom() {
  if (ballOffBottom()) {
    ballX = width/2;
    ballY = height/2;
  }
}

boolean ballOffBottom() {
  return (ballY - ballSize/2 > height);
}

void handleBallHitWall() {
  if (ballX - ballSize/2 < 0) {
    ballX = 0 + ballSize/2;
    ballVX = -ballVX;
  } else if (ballX + ballSize/2 > width) {
    ballX = width - ballSize/2;
    ballVX = -ballVX;
  }

  if (ballY - ballSize/2 < 0) {
    ballY = 0 + ballSize/2;
    ballVY = -ballVY;
  }
}

void keyPressed() {
  if (keyCode == LEFT) {
    paddleVX = -paddleSpeed;
  } else if (keyCode == RIGHT) {
    paddleVX = paddleSpeed;
  }
}

void keyReleased() {
  if (keyCode == LEFT && paddleVX < 0) {
    paddleVX = 0;
  } else if (keyCode == RIGHT && paddleVX > 0) {
    paddleVX = 0;
  }
}