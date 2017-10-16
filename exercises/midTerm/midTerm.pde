

// Global variables for the paddles and the ball
Paddle leftPaddle;
Paddle rightPaddle;
Ball ball;
SpeedPowerUp speedPowerUp;
ShrinkPowerUp shrinkPowerUp;

//GameScore score 



// The distance from the edge of the window a paddle should be
int PADDLE_INSET = 8;

//ADDED: true or false statment allowing for the game to have a definitive end
boolean gameOver = false; 

// The background colour during play (black)
color backgroundColor = color(0);

//ADDED: variables for size-changing circles 
float diameter; 
float angle = 0;


// setup()
//
// Sets the size and creates the paddles and ball

void setup() {
  // Set the size
  size(640, 480);

  // Create the paddles on either side of the screen. 
  // Use PADDLE_INSET to to position them on x, position them both at centre on y
  // Also pass through the two keys used to control 'up' and 'down' respectively
  // NOTE: On a mac you can run into trouble if you use keys that create that popup of
  // different accented characters in text editors (so avoid those if you're changing this)

  //CHANGED: paddle controls changed to D,F and J,K. this will make the players of the game a bit confused because instead of moving the paddlesm up and now ur moving left to right. 
  leftPaddle = new Paddle(PADDLE_INSET, height/2, 'd', 'f');
  rightPaddle = new Paddle(width - PADDLE_INSET, height/2, 'j', 'k');

  // Create the ball at the centre of the screen
  ball = new Ball(width/2, height/2);
  speedPowerUp = new SpeedPowerUp(width/2, height/2);
  shrinkPowerUp = new ShrinkPowerUp (width/2, height/2);


// draw()
//
// Handles all the magic of making the paddles and ball move, checking
// if the ball has hit a paddle, and displaying everything.

//ADDED: original size of the circle.
diameter = height - 10;
}
 


void draw() {
  // changes the color of the background depending on the score of either the right paddle or left paddle. 
  //background(leftPaddle.score, rightPaddle.score, 0);
  background (0);

//CHANGED: winner is determined and announced on screen as well as the indication of a game over.
if (gameOver==false) {
  playGame();
} else 
{
  String winner = "";
  if (leftPaddle.score >= 175 )
  {
    winner = "Left Wins";
    text (winner, width/4, 340);
  } else
  {
    winner = "Right Wins";
    text (winner, width/4, 340);
  }
  fill (255);
  text("GAME OVER ", width/5, height/2);
  textSize(64);
}
}

void playGame () {    // Update the paddles and ball by calling their update methods

//this changes the sixe of the circles in the background 

 float d1 = 10 + (sin(angle) * diameter/2) + diameter/2;
  float d2 = 10 + (sin(angle + PI/2) * diameter/2) + diameter/2;
  float d3 = 10 + (sin(angle + PI) * diameter/2) + diameter/2;

 noStroke();
  noStroke();
  //CHANGED: colour of the circles change depending on which side scores. 
  fill(leftPaddle.score, rightPaddle.score, 0);
  ellipse(0, height/2, d1, d1);
  ellipse(width/2, height/2, d2, d2);
  ellipse(width, height/2, d3, d3);

  angle += 0.02;  
  

  leftPaddle.update();
  rightPaddle.update();
  ball.update();
  speedPowerUp.update();
  shrinkPowerUp.update();

  // Check if the ball has collided with either paddle
  ball.collide(leftPaddle, rightPaddle);
  ball.collide(rightPaddle, leftPaddle);
  speedPowerUp.collide(leftPaddle, rightPaddle);
  speedPowerUp.collide(rightPaddle, leftPaddle);
  shrinkPowerUp.collide(leftPaddle, rightPaddle);
  shrinkPowerUp.collide(rightPaddle, leftPaddle);



  //one.collide(Paddle paddleHit, Paddle paddleOpponent);

  leftPaddle.checkPaddleScore(ball);
  rightPaddle.checkPaddleScore(ball);
  // Check if the ball has gone off the screen
  if (ball.isOffScreen()) {
    // If it has, reset the ball
    //   println("test");
    ball.reset();
  }
  if (speedPowerUp.isOffScreen()) {

    speedPowerUp.reset();
  }
  if (shrinkPowerUp.isOffScreen()) {

    shrinkPowerUp.reset();
  }

  // Display the paddles and the ball ADDED: power ups
  leftPaddle.display();
  rightPaddle.display();
  ball.display();
  speedPowerUp.display();
  shrinkPowerUp.display();
}


// keyPressed()
//
// The paddles need to know if they should move based on a keypress
// so when the keypress is detected in the main program we need to
// tell the paddles

void keyPressed() {
  // Just call both paddles' own keyPressed methods
  leftPaddle.keyPressed();
  rightPaddle.keyPressed();
}

// keyReleased()
//
// As for keyPressed, except for released!

void keyReleased() {
  // Call both paddles' keyReleased methods
  leftPaddle.keyReleased();
  rightPaddle.keyReleased();
}