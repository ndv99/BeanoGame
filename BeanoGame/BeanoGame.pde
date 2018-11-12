// 0 means menu, 1 means question game, 2 means hill game.
int state = 0;
int changeFactTime;
int savedTime;

// control variables for making game time/question scores show for the correct amount of time
boolean wait;
boolean waited;

// background image
PImage backgroundIMG;

// preparing classes for use
QuestionGame qGame;
Menu menu;
HillGame hillGame;
Player player;

// custom colours
color yellow = color(253, 253, 5);
color blue = color(14, 76, 139);
color red = color(229, 0, 42);

void setup(){
  size(1200, 750);
  
  // timers to show a different fact every 5 seconds on menu screen
  savedTime = millis();
  changeFactTime = 5000;
  
  // load background image
  backgroundIMG = loadImage("GuiAssets/MenuBackground.jpg");
  background(backgroundIMG);
  
  // initialise classes
  menu = new Menu();
  qGame = new QuestionGame();
  hillGame = new HillGame();
  player = new Player();
  
  // initialising timer control variables
  wait = false;
  waited = true;
  
  // all characters are kept in a list
  BeanoChar[] characters = menu.getCharacters();
  
  // default character set (to Dennis)
  player.setCharacter(characters[0]);
  hillGame.setCharacter(characters[0]);
  
}

void draw(){
  // state switch. default is 0 (menu)
  switch (state){
    case(0): // case 0 is the menu
      // reset timers for showing scores and facts
      wait = false;
      waited = false;
      
      // ensures background doesn't have leftovers from minigames
      image(backgroundIMG, 0, 0);
      
      // draws the stuff on the menu screen
      menu.drawTitle();
      menu.characterChoices();
      menu.factBox();
      menu.chosenCharacter(player.getCharacter()); // gets the character chosen by the player
      menu.startButton();
      
      // fact rotation every 5 seconds
      int passedTime = millis() - savedTime;
      if (passedTime > changeFactTime){
        menu.nextFact();
        menu.factBox();
        savedTime = millis();
      }
      break;
    case(1): // case 1 is the question game
      // draw background over menu
      image(backgroundIMG, 0, 0);
      
      // game tells draw loop when finished
      boolean qGameFinished = qGame.playGame();
      
      if (qGameFinished){
        // shows how many answers the player got correct
        int correctAnswers = qGame.showScore();
        
        // little 'if' statement to make the score show for 2.5 seconds
        if (wait){
          delay(2500);
          state = 2;
          
          // start speed of hill game is higher if you get a better score
          hillGame.setSpeed(correctAnswers * 1.5);
          
          // reset the game for the next play
          savedTime = millis();
          qGame.resetGame();
          
          // makes this 'if' statement happen
          waited = true;
        }
        
        // assists with the 'if' statement above so that it doens't break
        /* 
        Basically, when 'wait' is true, the program is forced to show the score for 2.5 seconds.
        The 'waited' variable stores whether or not the program has waited, so that it can be reset afterwards and reused.
        */
        wait = true;
        if (waited){
          wait = false;
          waited = false;
        }
      }
      break;
    case(2): // case 2 is the hill run game
      boolean hillGameFinished = hillGame.playGame(); // works in a similar way to the question game
      
      // everything here works identically to the question game - see case(2) for an explanation of this.
      if (hillGameFinished){
        int timeTaken = millis();
        hillGame.showTime(savedTime, timeTaken);
        if (wait){
          delay(2500);
          hillGame.resetGame();
          state = 0;
          waited = true;
        }
        wait = true;
        if (waited){
          wait = false;
          waited = false;
        }
      }
      break;
  }
}


// tracks mouse clicks on menu
void mouseClicked(){
  // if on menu (is disabled when minigames are running
  if (state == 0){
    // start game
    if (mouseX > 443.5 && mouseX < 800 && mouseY > 330 && mouseY < 670){
      state = 1;
    }
    
    // characters selection
    BeanoChar[] characters = menu.getCharacters();
    if (mouseX > 450 && mouseX < 550 && mouseY > 25 && mouseY < 125){
      player.setCharacter(characters[0]);
      hillGame.setCharacter(characters[0]);
    }
    if (mouseX > 550 && mouseX < 650 && mouseY > 25 && mouseY < 125){
      player.setCharacter(characters[1]);
      hillGame.setCharacter(characters[1]);
    }
    if (mouseX > 650 && mouseX < 750 && mouseY > 25 && mouseY < 125){
      player.setCharacter(characters[2]);
      hillGame.setCharacter(characters[2]);
    }
    if (mouseX > 750 && mouseX < 850 && mouseY > 25 && mouseY < 125){
      player.setCharacter(characters[3]);
      hillGame.setCharacter(characters[3]);
    }
  }
}
