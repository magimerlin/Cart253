
Ball ball;
Paddles[] paddles;

//final int GRID_SIZE= 20;

color backgroundColor = color(0);
int halfScreenn;
int currentPos;

//int scrollPos = GRID_SIZE;


void setup() {

  size (400, 700);
  ball = new Ball(width/2, height/2);

  paddles = new Paddles [1000];

  float _yTemp = -3;

  for (int i=0; i<100; i++) {

    if (i%5 == 0) {
      _yTemp = _yTemp - 200;
    }
    paddles[i] = new Paddles (random(width), _yTemp);
  }


  //  for (int i = 0; i < paddles.length; i++)
  //  {
  //    if (random(1) > 0.85)
  //    {
  //      paddles[i] = int(random(height / GRID_SIZE));
  //    }
  //  }
  //  // Half screen in terms of grid size
  //  halfScreen = currentPos = width / GRID_SIZE / 2;
}


void draw() {

  background(0);
  ball.update();
  ball.display(); 
  for (int i=0; i<100; i++) {

    paddles[i].update();
    paddles[i].display();
  }

  //  for (int i = currentPos - halfScreen, j = 0; i < currentPos + halfScreen; i++, j++)
  //  {
  //  if (paddles[i] > 0)
  //  {
  //    rect(scrollPos + j * GRID_SIZE, height - scenery[i] * GRID_SIZE, 
  //      GRID_SIZE, height);
  //  }
  ////}
  //  scrollPos--;
  ////scrollPos %= halfScreen;
  //if (scrollPos == 0)
  //{
  //  currentPos++;
  //  scrollPos = GRID_SIZE;
  //  if (currentPos == paddles.length - halfScreen)
  //    exit(); // End
  //}
}


void keyPressed() {

  ball.keyPressed();
}