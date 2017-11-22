
Ball ball;
Paddles[] paddles;
Menu menu;



color backgroundColor = color(0);
int halfScreenn;
int currentPos;
int startTime;
int recordTime;

boolean falling = false;
float floorY = 600; //WHAT IS THIS??
boolean gameOver = false;
boolean showMenu =true;


void setup() {

  size (400, 700);
  reset();
  menu = new Menu();
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
      handleJump();
      paddleCollide();
      gameOver();
      paddleUpdate();
      fallingBall();
      
    } //menu is false
  }

  //gameover
  else
  {
    background(0);
    fill(255);
    textSize(24);
    textAlign(CENTER);
    text("YOU LIVED FOR " + recordTime + " SECONDS!", width/2, height/2);
    //println("gameOver");
  }
}


void handleGame() {
  text((millis() - startTime)/1000, 50, 100);

  //text(millis()/1000, 50, 100);
  //update the ball
  ball.update();
  ball.display(); 


  if (ball.y < 0) {
    for (int i = 0; i< paddles.length; i++) {
      paddles[i].vy += 0.1;
    }
  }
}



void handleJump()
{
  //if we are jumping
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
}


void paddleCollide() 
{
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
  }


  void fallingBall() {
    // case for falling 
    if (falling ==true && ball.onAPaddle==-1)
    {
      ball.ySpeed +=1;
      ball.y+= ball.ySpeed;
    }
  }
}

void paddleUpdate() {
  //go through each paddle and update and display
  for (int i=0; i<paddles.length; i++) {

    paddles[i].update();

    paddles[i].display();
  }
}

void gameOver() {
  //test for game over
  if (ball.y-(ball.ballSize/2)>height)
  {
    gameOver =true;
    ball.ySpeed =0;
    recordTime = (millis() - startTime)/1000;
  }
}


//reset the game
void reset()
{
  gameOver =false;
  falling = false;
  ball = new Ball(width/2, 680, 20, 255);
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