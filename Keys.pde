void mousePressed() {
  if (menuButtons[0].containsMouse() && Mode =='i') {  //If the '0' button is clicked, the game will start
     Mode = 's';
  }
  if (menuButtons[1].containsMouse() && Mode =='i') {  //If the '1' button is clicked, the Options menu will open
     Mode = 'o';
  }
  if (menuButtons[2].containsMouse() && Mode =='i') {  //If the '2' button is clicked, the Credits menu will open
     Mode = 'c';
  }
  if (menuButtons[3].containsMouse() && Mode =='i') {  //If the '3' button is clicked, the Help menu will open"
     Mode = 'h';
  }  
  if (optionButtons[0].containsMouse() && Mode =='o') {  //If the '0' button in the Options menu is clicked,
     Mode = 'b';                                    //it will return to the main menu
  }   
  if (creditsButtons[0].containsMouse() && Mode =='c') {  //If the '0' button in the Credits menu is clicked,
     Mode = 'b';                                    //it will return to the main menu
  } 
  if (helpButtons[0].containsMouse() && Mode =='h') {  //If the '0' button in the Help menu is clicked,
     Mode = 'b';                                    //it will return to the main menu
  } 
  if (gameOverButtons[0].containsMouse() && Mode =='g') {  //If the '0' button in the Game Over menu is clicked,
     Mode = 's';                                    //will start the game again
  } 
  if (gameOverButtons[1].containsMouse() && Mode =='g') {  //Se o botão "0" do menu gameover for clicado,
     Mode = 'i';                                    //it will return to the main menu
  }  
  if (optionButtons[1].containsMouse() && Mode =='o') {  //If the '1' button in the Options menu is clicked,
     SnakeColor = 'a';                                    //Snake will change to GREEN color
  } 
  if (optionButtons[2].containsMouse() && Mode =='o') {  //If the '2' button in the Options menu is clicked,
     SnakeColor = 'b';                                    //Snake will change to BROWN color
  } 
  if (optionButtons[3].containsMouse() && Mode =='o') {  //If the '3' button in the Options menu is clicked,
     SnakeColor = 'c';                                    //Snake will change to RED color
  } 
  if (optionButtons[4].containsMouse() && Mode =='o') {  //If the '4' button in the Options menu is clicked,
     SnakeColor = 'd';                                    //Snake will change to BLUE color
  } 
}

void keyPressed() {
  if (keyCode == LEFT && x == 0) { //If the left arrow is pressed, define X as -1 and Y as 0
    x = -1;
    y =  0;
  } else if (keyCode == UP && y == 0) { //If the up arrow is pressed, define X as 0 and Y as -1
    y = -1;
    x =  0;
  } else if (keyCode == RIGHT && x == 0) { //If the right arrow is pressed, define X as 1 and Y as 0
    x = 1;
    y = 0;
  } else if (keyCode == DOWN && y == 0) { //If the down arrow is pressed, define X as 0 and Y as 1
    y = 1;
    x = 0;
  } else if (key == 'a' && !start) Mode = 's';  //If the "a" key is pressed, start will change to "true"
  
  if ( key == 'c' ) Cheats++;  //Enable or Disable Cheats
  if ( Cheats > 1 ) {
    Cheats = 0;
  }
  if ( key == 'd' ) Debug++;  //Enable or disable Debug mode
  if ( Debug > 1 ) {
    Debug = 0;
  }
  if ( key == 's' ) SnakeSpeed --; //Increase Snake's speed when the "s" key is pressed
  
}
