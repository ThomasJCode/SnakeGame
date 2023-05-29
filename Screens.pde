//INITIAL MENU
void TitleScreen() {
  gMenu = false;
  playSound = 1; //Play music from menu
  background(#02727c); //home screen background


  textFont(fontText2);
  for (int i = 0; i < nButtonsMenu; i++) {
    menuButtons[i].draw(drawBoxes);
  }


  fill(255); //tEXT COLOR
  textFont(fontText);
  //textAlign(CENTER, CENTER); //Initial text alignment
  text("SNAKE GAME", width*0.05, height/5); //Text and size according to the widht,height

  SnakeAnimation();


  if (start) { //When starting the game..
    x = 1; //X starting position
    y = 0; //y starting position
    tam = tInit; //Set Snake size to initial default
    pts = 0; //reset initial score
    SnakeSpeed = SpeedByColor; //Return Snake speed to default
    piece(); //snake pieces
    playSound = 2; //Pause menu music and restart it
    sEat.pause();
    sGame.loop();  //Play game music in loop
    gMenu = true;
  }
}


//OPTIONS MENU
void OptionsMenu() {
  background(#004148); //Screen background color
  fill(255); //Text color
  textFont(fontText2);
  text("OPTIONS", width*0.4, height*0.1); //Text and size according to the widht,height
  text("DIFFICULTY:", width*0.17, height*0.3);
  for (int i = 0; i < nButtonsOptions; i++) {
    optionButtons[i].draw(drawBoxes);
  }
}

//CREDITS MENU
void CreditsMenu() {
  background(#004148); //Screen background color
  fill(255); //Text color
  textFont(fontText2);
  text("CREDITS", width*0.4, height*0.1); //Text and size according to the widht,height
  textSize(40);
  text(">GABRIEL DE CAMPOS ", width*0.1, height*0.4); //Text and size according to the widht,height
  text(">THOMAS JEFFERSON ", width*0.1, height*0.6); //Text and size according to the widht,height
  for (int i = 0; i < nButtonsCredits; i++) {
    creditsButtons[i].draw(drawBoxes);
  }
}

//HELP MENU
void HelpMenu() {
  background(#004148); //Screen background color
  fill(255); //Text color
  textFont(fontText2);
  text("HELP", width*0.45, height*0.1); //Text and size according to the widht,height
  textFont(fontText2);
  textSize(20);
  String txtHelp = "*No jogo SnakeGame, o objetivo é acumular a maior quantidade possível de pontos sem perder. Cada vez que você captura uma comida, a cobra aumenta de tamanho. À medida que a cobra cresce, sua velocidade de movimento também aumenta.";
  String txtHelp1 = "*Para controlar a cobra, utilize as setas do teclado: para cima, para baixo, para a esquerda e para a direita. Pressione a tecla 'a' para iniciar o jogo.";
  text(txtHelp, 10, 100, 790, 200); //Text and size according to the widht,height
  text(txtHelp1, 10, 250, 790, 400); //Text and size according to the widht,height
  for (int i = 0; i < nButtonsHelp; i++) {
    helpButtons[i].draw(drawBoxes);
  }
}

//GAME OVER
void GameOverMenu() {
  background(#004148); //Screen background color
  fill(255); //Text color
  textFont(fontText);
  text("GAMEOVER", width*0.13, height/5); //Text and size according to the widht,height
  textFont(fontText2);
  text("Score: "+pts, width*0.3, height/2.5); //Text and size according to the widht,height
  textFont(fontText2);
  for (int i = 0; i < nButtonsGameOver; i++) {
    gameOverButtons[i].draw(drawBoxes);
  }
}

//GAME SCREEN
void GameScreen() {
  background(#35DBDB); //Screen background color


  for (int i = tam-1; i >=0; i--) { //Loop to show all parts

    if (i == 0) {  //If i is 0 (first piece) it will be moved
      sn[i].show(x, y);
    } else { //If it's a body part, it will just follow the head.
      sn[i].x = sn[i-1].x;  //previous X position -1
      sn[i].y = sn[i-1].y;  //previous Y position -1
      sn[i].show(0, 0); //Show the stopped object 0,0
    }

    //If Snake hits his own body or the edges of the screen, it's game over.
    if ((i > 2 && sn[0].x == sn[i].x && sn[0].y == sn[i].y) ||
      sn[0].x < 0 || sn[0].y < 0 || sn[0].x > width-szSn || sn[0].y > height-szSn) //Check points x,y height and width
      if (Cheats == 1) {
      } else
        Mode = 'd'; //Reset game when Snake dies
  }

  food.show(0, 0);

  //Check if Snake got the food & check highscore & add new piece
  if (sn[0].x == food.x && sn[0].y == food.y) {
    pts += 10; //Add +10 points to each food
   
     if (pts == 50  && SnakeSpeed > 0) SnakeSpeed--;
     if (pts == 100 && SnakeSpeed > 0) SnakeSpeed--;
     if (pts == 150 && SnakeSpeed > 0) SnakeSpeed--;
     if (pts == 200 && SnakeSpeed > 0) SnakeSpeed--;
     if (pts == 250 && SnakeSpeed > 0) SnakeSpeed--;
     if (pts == 300 && SnakeSpeed > 0) SnakeSpeed--;
     
    if (pts > top) top = pts; //If the score is greater than the highscore, it becomes the highscore.

    String highscores = ("top");
    String[] list = split(highscores, ' ');
    saveStrings("highscores.txt", list); //Save the strings to a txt file

    piece(); //Call "piece" to add one more piece to Snake
  }

  //Show "Cheats ON" message when enabled
  switch(Cheats) {
  case 0:
    break;
  case 1:
    textSize(80); //Text size
    //textAlign(CENTER, CENTER); //Initial text alignment
    fill(255); //Cor do texto
    text("CHEATS ON", width*0.05, height*0.5); //Text and size according to the widht,height
    break;
  }

  //Show information for debug
  switch(Debug) {
  case 0:
    break;
  case 1:
    textSize(30); //Text size
    fill(255); //Text color
    text("X: "+x, width*0.1, height*0.2);
    text("Y: "+y, width*0.1, height*0.3);
    text("Framecout: "+(frameCount), width*0.1, height*0.6);
    text("FPS: "+frameRate, width*0.1, height*0.7);
    text("SnakeSpeed: "+ SnakeSpeed, width*0.1, height*0.8);
    //text("VY: "+ show.vy, width*0.1, height*0.9);
    break;
  }
}
