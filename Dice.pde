//diceProject 10/10/2017
//Help from Andrew Smith (Instructor) 

//Declares Variables used in the sketch.
Die[] myDie;
int randomNumber;
int x;
int y;
int totalRoll = 0;
int mouse = 0;

void setup() {
  //Sets the size of the window, setting rectMode() to CENTER 
  //("changing the way in which parameters given to rect() are intepreted." 
  //Processing Reference), calls the noLoop() function, and creates nine "myDie"'s.
  size(700, 700);
  rectMode(CENTER);
  noLoop();
  background(255);
  myDie = new Die[9];
  int num = 0;
  for (int y = 300; y <= 500; y += 100) {
    for (int x = 200; x <= 400; x += 100) {
      myDie[num] = new Die(x, y);
      num++;
    }
  }
}

void draw() {
  
  //The drawing is reset and the nine dice are rolled and shown.
  fill(255);
  background(255);
  for (int numTwo = 0; numTwo < 9; numTwo ++) {
    myDie[numTwo].roll();
    myDie[numTwo].show();
  }
  
  //The text is shown on the screen with the number equal to the sum of the dice.
  textSize(35);
  text("Total of Die Roll:", 250, 100);
  text(totalRoll, 550, 100);

  if (mouse == 0) {
    //For the first instance, before the mouse is pressed, the phrase,
    //"Click the screen to get new die rolls." will be printed.
    textSize(20);
    fill(0);
    text("Click the screen to get new die rolls.", 300, 650);
  }
}

void mousePressed() {
  
  //Redraws the dice, resets the totalRoll variable, and adds 1 to the mouse variable.
  redraw();
  totalRoll = 0;
  mouse++;
}

class Die { 
  int x;
  int y;
  Die(int _x, int _y) {
    x = _x;
    y = _y;
  }

  void roll() {
    
    //Generates a random number from 1 to 6 and adds 
    //that number to the totalRoll variable.
    
    randomNumber = (int) (Math.random() * 6) + 1;
    totalRoll += randomNumber;
  }

  void show() {
    //Creates a rectangle with a white fill and resets the fill to black for the dots.
    fill(255);
    rect(x, y, 100, 100, 5);
    fill(0);

    //Checks what the randomNumber variable is equal to and 
    //places the dots on the rectangle accordingly.
    if (randomNumber == 2) {
      ellipse(x + 25, y + 25, 10, 10);
      ellipse(x - 25, y - 25, 10, 10);
    }
    if (randomNumber == 3) {
      ellipse(x, y, 10, 10);
      ellipse(x + 25, y + 25, 10, 10);
      ellipse(x - 25, y - 25, 10, 10);
    }
    if (randomNumber == 4) {
      ellipse(x + 25, y + 25, 10, 10);
      ellipse(x - 25, y - 25, 10, 10);
      ellipse(x + 25, y - 25, 10, 10);
      ellipse(x - 25, y + 25, 10, 10);
    }
    if (randomNumber == 5) {
      ellipse(x + 25, y + 25, 10, 10);
      ellipse(x - 25, y - 25, 10, 10);
      ellipse(x + 25, y - 25, 10, 10);
      ellipse(x - 25, y + 25, 10, 10);
      ellipse(x, y, 10, 10);
    }
    if (randomNumber == 6) {
      ellipse(x + 25, y + 25, 10, 10);
      ellipse(x - 25, y - 25, 10, 10);
      ellipse(x + 25, y - 25, 10, 10);
      ellipse(x - 25, y + 25, 10, 10);
      ellipse(x - 25, y, 10, 10);
      ellipse(x + 25, y, 10, 10);
    }
    if (randomNumber == 1) {
      ellipse(x, y, 10, 10);
    }
  }
}
