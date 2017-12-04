
import processing.sound.*;

Ball ball;
Paddles[] paddles;
Menu menu;
SoundFile jumpSound;


Thinking[] thinking;

color backgroundColor = color(0);
int halfScreenn;
int currentPos;
int startTime;
int recordTime;

boolean falling = false;
float floorY = 600; //WHAT IS THIS??
boolean gameOver = false;
boolean showMenu =true;
PFont fontBold;
PowerUp powerup;


void setup() {

  size (400, 700);
  reset();
  menu = new Menu(this);
  fontBold = createFont("Amatic-Bold.ttf", 32);
  powerup = new PowerUp (random(20, width-2), -20, this);
}


void draw() {

  background(0);



  //RESTART TIMER EVERYTIME PERSON DIES 
  // if game not over
  if (gameOver ==false)
  {
    if (showMenu ==true)
    {
      menu.display();
    } 
    // game is playing
    else
    {
      handleGame();
    }
  }

  //gameover
  else
  {
    background(0);
    fill(255);
    textSize(55);
    textAlign(CENTER);
    text("YOU LIVED FOR " + recordTime + " SECONDS...", width/2, height/2);
    //println("gameOver");
  }
}


void handleGame() {

  fill(255, 0, 0);
  rect( 30, 69, 40, 40);
  fill(255);
  textSize(32);
  textFont(fontBold);
  text((millis() - startTime)/1000, 50, 100);

  powerup.update();
  powerup.display();
  if (powerup.collidesWithBall(ball) ==true)
  {
    for (int i=0; i<paddles.length; i++) {

      paddles[i].vy = paddles[i].vy - .01;
    }
  }

  //update the ball
  ball.update();
  ball.display(); 


  if (ball.y < 0) {
    for (int i = 0; i< paddles.length; i++) {
      paddles[i].vy += 0.1;
    }
  }

  handleBall();
  paddleDisplay();
  thinkingDisplay();
}



void handleBall() {

  //if we are jumping (falling)
  if (ball.jump ==true)
  {
    // if we are moving up
    if (ball.ySpeed <=0)
    {
      ball.ySpeed +=1;
      // change speed for jump
      ball.y+=ball.ySpeed;
    }
    // if we are mving down
    if (ball.ySpeed >0)
    {
      falling =true;
    }
  }

  // test each platform and see if we are on one IF we are not on one
  if (ball.onAPaddle ==-1)
  {
    for (int i = 0; i< paddles.length; i++)
    {

      // if there is collision 
      if (paddles[i].collidesWithBall(ball))
      {
        println("collide while on paddle");
        // on a platform - which one  == i
        ball.onAPaddle =i;
        //set the new y pos for the ball
        ball.y= paddles[i].y - (ball.ballSize/2);
        //test
        //ball.ballColor = color(0, 0, 255);
        ball.ySpeed =0;
        ball.jump=false;
        falling =false;
        break;
      }
    }
  }

  // either stay on the paddle or if you move fall. .. 
  if (ball.onAPaddle !=-1)
  {

    int paddleIndex= ball.onAPaddle;
    // println("paddle index:: "+paddleIndex);
    // if the ball is STILL on the platform
    if (paddles[paddleIndex].collidesWithBall(ball) )
    {
      // println("on a paddle");

      ball.y= paddles[paddleIndex].y-(ball.ballSize/2)+paddles[paddleIndex].vy;
      ball.ySpeed =0;
      //falling =false;
      //test
      // ball.ballColor = color(0, 0, 255);
      //ball.jump=false;
    } 
    // means we are no longer on a paddle
    else
    {
      println("not on a paddle");
      ball.onAPaddle=-1;
      falling =true;
    }
  }
  // case for falling 
  if (falling ==true && ball.onAPaddle==-1)
  {
    ball.ySpeed +=1;
    ball.y+= ball.ySpeed;
    //test
    // ball.ballColor = color(255, 0, 0);
  }
}

void paddleDisplay() {
  //go through each paddle and update and display
  for (int i=0; i<paddles.length; i++) {

    paddles[i].update();
    paddles[i].display();
  }

  //test for game over
  if (ball.y-(ball.ballSize/2)>height)
  {
    gameOver =true;
    ball.ySpeed =0;
    recordTime = (millis() - startTime)/1000;
  }
}

void thinkingDisplay() {
  //go through each paddle and update and display
  for (int i=0; i<thinking.length; i++) {

    thinking[i].update();
    thinking[i].display();
  }
}



//reset the game
void reset()
{
  gameOver =false;
  falling = false;
  ball = new Ball(width/2, 680, 20, 255, this);
  startTime = millis();

  paddles = new Paddles [1000];

  //float _yTemp = -20;
  float _yStart = -3;



  for (int i=0; i< paddles.length; i++) {

    if (i%5 == 0 && i!=0) {
      _yStart = _yStart - 100; //this is the amount of space seperating the paddles from each other on the y axis.
    }
    paddles[i] = new Paddles ((int)random(width), (int)random(_yStart-300, _yStart)); //the amount of space between the paddles on the x axis.
  }

  thinking = new Thinking[14];
  //This allows for me to display various strings of text on a time interval. 
  int timeInterval =30000;
  thinking[0] = new Thinking(width/2, (int)random(-200, -100), "Who are you", millis()+timeInterval );
  thinking[1] = new Thinking(width/2, (int)random(-200, -100), "Who am I", millis()+timeInterval*2 );
  thinking[2] = new Thinking(width/2, (int)random(-400, -300), "I'm a ball...\n if I'm a ball\n what are you", millis()+timeInterval*3 );
  thinking[3] = new Thinking(width/2, (int)random(-200, -100), "What am I doing here", millis()+timeInterval*4 );
  thinking[4] = new Thinking(width/2, (int)random(-500, -400), "It's strange,\n I feel like I should have purpose\n... do I", millis()+timeInterval*5 );
  thinking[5] = new Thinking(width/2, (int)random(-300, -200), "Do you ever think of the\n vastness of the universe?", millis()+timeInterval*6 );
  thinking[6] = new Thinking(width/2, (int)random(-500, -400), "If the universe is ever\n expanding what\n is it expanding into", millis()+timeInterval*7 );
  thinking[7] = new Thinking(width/2, (int)random(-200, -100), "Hey, I feel trapped.", millis()+timeInterval*8 );
  thinking[8] = new Thinking(width/2, (int)random(-400, -300), "This box is kinda small and\n I can't seem to leave it", millis()+timeInterval*9 );
  thinking[9] = new Thinking(width/2, (int)random(-200, -100), "Are my choices even my own", millis()+timeInterval*10 );
  thinking[10] = new Thinking(width/2, (int)random(-200, -100), "Is there a God", millis()+timeInterval*11 );
  thinking[11] = new Thinking(width/2, (int)random(-200, -100), "Are you God", millis()+timeInterval*12 );
  thinking[12] = new Thinking(width/2, (int)random(-500, -400), "Please, tell me,\n is there anything beyond\n this", millis()+timeInterval*13 );
  thinking[13] = new Thinking(width/2, (int)random(-200, -100), "What happens if I fall", millis()+timeInterval*14 );
}



void keyPressed() {
  if (gameOver)
  {
    if (key == ' ')
    {
      reset();
    }
  } else
  {
    ball.keyPressed();
  }
}

void keyReleased() {

  ball.keyReleased();
}

void mousePressed()
{
  if (showMenu ==true)
  {
    menu.mousePressed();
  }
}