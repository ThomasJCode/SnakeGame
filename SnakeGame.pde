import ddf.minim.*;
//Declaration of variables and objects
Minim sManager; //Game audio manager
AudioPlayer sMenu, sGame, sFood, sEat; //Sound variable declaration
int playSound = 0, x = 1, y, szSn = 40, tInit = 2, tam, pts, top, state, Cheats = 0, Debug = 0, Mode = 'i', SnakeColor = 'a', px, pf;
int nButtonsMenu = 4, nButtonsOptions = 5, nButtonsGameOver = 2, nButtonsCredits = 1, nButtonsHelp = 1, SnakeSpeed, SpeedByColor;
color cText = #F6FF0A, SnakeColorDefault, SnakeStrokeColorDefault; // cText -> Button hover color
boolean start, gMenu, drawBoxes;
boolean deadSnake = true;
PFont fontText, fontText2; //Text font variables
PImage[] imgSnake = new PImage [5];
Snake [] sn; //Vetor Snake
Button[] menuButtons, optionButtons, creditsButtons, helpButtons, gameOverButtons; //Button array
Food food = new Food(0, 0, szSn, szSn, #DB2525); //Snake's "food" variable | Food color


void setup () {
  size(800, 660); //Screen size
  height = 600; //Screen height, excluding the menu bar
  //frameRate(10); //Frames per second (FPS)

  //Linking font with variable
  fontText = createFont("Pixelmania.ttf", 50);
  fontText2 = createFont("dogica.ttf", 30);

  //Loading images
  imgSnake[0] = loadImage("images/snake0.png");
  imgSnake[1] = loadImage("images/snake1.png");
  imgSnake[2] = loadImage("images/snake2.png");
  imgSnake[3] = loadImage("images/snake3.png");
  imgSnake[4] = loadImage("images/snake4.png");

  //Linking audio with variables
  sManager = new Minim(this);
  sFood = sManager.loadFile("food.wav");
  sMenu = sManager.loadFile("menu.mp3");
  sGame = sManager.loadFile("game.mp3");
  sEat = sManager.loadFile("eat.wav");


  //Creating menu buttons
  menuButtons = new Button[4];
  optionButtons = new Button[5];
  creditsButtons = new Button[1];
  helpButtons = new Button[1];
  gameOverButtons = new Button[2];

  //Main Menu buttons
  menuButtons[0] = new Button("START GAME", new PVector(width/3.5, height*0.5), 40, color(255), color(cText));
  menuButtons[1] = new Button("OPTIONS", new PVector(width/2.8, height*0.6), 40, color(255), color(cText));
  menuButtons[2] = new Button("CREDITS", new PVector(width/2.8, height*0.7), 40, color(255), color(cText));
  menuButtons[3] = new Button("HELP", new PVector(width/2.3, height*0.8), 40, color(255), color(cText));

  //Options Menu buttons
  optionButtons[0] = new Button("BACK", new PVector(width*0.45, height*0.9), 30, color(255), color(cText));
  optionButtons[1] = new Button(">GREEN (EASY)", new PVector(width*0.25, height*0.35), 30, color(255), color(cText));
  optionButtons[2] = new Button(">BROWN (MEDIUM)", new PVector(width*0.25, height*0.45), 30, color(255), color(cText));
  optionButtons[3] = new Button(">RED   (HARD)", new PVector(width*0.25, height*0.55), 30, color(255), color(cText));
  optionButtons[4] = new Button(">BLUE  (EXTREME)", new PVector(width*0.25, height*0.65), 30, color(255), color(cText));


  //Help Menu buttons
  helpButtons[0] = new Button("BACK", new PVector(width*0.45, height*0.9), 30, color(255), color(cText));

  //Credits Menu buttons
  creditsButtons[0] = new Button("BACK", new PVector(width*0.45, height*0.9), 30, color(255), color(cText));

  //Game Over Menu buttons
  gameOverButtons[0] = new Button("TRY AGAIN", new PVector(width*0.25, height*0.7), 50, color(255), color(cText));
  gameOverButtons[1] = new Button("BACK TO MENU", new PVector(width*0.3, height*0.9), 30, color(255), color(cText));

  drawBoxes = false;
}

void draw() {

  if (start && gMenu) {//Iniciar o jogo somente se for dado o Start
    if (frameCount % SnakeSpeed == 0)  
    GameScreen();
  } else
    TitleScreen();

  //Menu bar
  fill(#004148); //Painting menu background
  noStroke(); //No borders
  rect(0, 600, width, 60); //Menu rectangle
  fill(255); //Text color
  noStroke(); //No borders
  textSize(30); //Font Size
  textFont(fontText2);
  text("Score " + pts, 20, 640); //Text, variable, and position
  text("Highscore " + top, 360, 640); //Text, variable, and position

  //Game sound effects
  if (playSound == 1) {
    sGame.pause();    //Pausing game music
    sGame.rewind();   //Restarting music
    sMenu.play();     //Playing menu music
  } else if (playSound == 2) {
    sMenu.pause();    //Pausing game music
    sMenu.rewind();   //Restarting music
  }


  switch (Mode) {
  case 'i':        //Initial mode
    break;
  case 's':        //If the mode is set to 's', start the game
    start = true;
    break;
  case 'o' :       //If the mode is set to 'o', open options menu
    OptionsMenu();
    break;
  case 'c':       //If the mode is set to 'c', open credits menu
    CreditsMenu();
    break;
  case 'h':       //If the mode is set to 'h', open help menu
    HelpMenu();
    break;
  case 'd':        //If the mode is set to 'd', reset the game
    start = false;
    Mode = 'g';
    break;
  case 'b' :       //If the mode is set to 'b', return to the main menu
    Mode = 'i';
    break;
  case 'g' :       //If the mode is set to 'g', return to the main menu
    GameOverMenu();
    break;
  }

  switch (SnakeColor) {  //Snake color selector
  case 'a':        //Snake in green color
    SnakeColorDefault = #01803C;
    SnakeStrokeColorDefault = #00401E;
    optionButtons[1].textColor = #F6FF0A;
    optionButtons[2].textColor = 255;
    optionButtons[3].textColor = 255;
    optionButtons[4].textColor = 255;
    SpeedByColor = 7;
    
    break;
  case 'b':        //Snake in brown color
    SnakeColorDefault = #754628;
    SnakeStrokeColorDefault = #402414;
    optionButtons[2].textColor = #F6FF0A;
    optionButtons[1].textColor = 255;
    optionButtons[3].textColor = 255;
    optionButtons[4].textColor = 255;
    SpeedByColor = 5;
    
    break;
  case 'c' :       //Snake in red color
    SnakeColorDefault = #D42A2E;
    SnakeStrokeColorDefault = #B40407;
    optionButtons[3].textColor = #F6FF0A;
    optionButtons[1].textColor = 255;
    optionButtons[2].textColor = 255;
    optionButtons[4].textColor = 255;
    SpeedByColor = 4;

    break;
  case 'd':       //Snake in blue color
    SnakeColorDefault = #0895a1;
    SnakeStrokeColorDefault = #019190;
    optionButtons[4].textColor = #F6FF0A;
    optionButtons[1].textColor = 255;
    optionButtons[2].textColor = 255;
    optionButtons[3].textColor = 255;
    SpeedByColor = 3;

    break;
  }

  
}
