// 0 means menu, 1 means question game, 2 means hill game.
int state = 0;
int changeFactTime;
int savedTime;

boolean wait;
boolean waited;

PImage backgroundIMG;

QuestionGame qGame;
Menu menu;
HillGame hillGame;
Player player;

color yellow = color(253, 253, 5);
color blue = color(14, 76, 139);
color red = color(229, 0, 42);

void setup(){
  size(1200, 750);
  
  savedTime = millis();
  changeFactTime = 5000;
  
  backgroundIMG = loadImage("GuiAssets/MenuBackground.jpg");
  background(backgroundIMG);
  
  menu = new Menu();
  qGame = new QuestionGame();
  hillGame = new HillGame();
  player = new Player();
  
  wait = false;
  waited = true;
  
  BeanoChar[] characters = menu.getCharacters();
  
  player.setCharacter(characters[0]);
  
  switch(state){
    case(0):
      break;
    case(1):
      break;
    case(2):
      break;
  }
}

void draw(){
  switch (state){
    case(0):
      wait = false;
      waited = false;
      image(backgroundIMG, 0, 0);
      menu.drawTitle();
      menu.characterChoices();
      menu.factBox();
      menu.chosenCharacter(player.getCharacter());
      menu.startButton();
      
      int passedTime = millis() - savedTime;
      if (passedTime > changeFactTime){
        menu.nextFact();
        menu.factBox();
        savedTime = millis();
      }
      break;
    case(1):
      // draw background over menu
      image(backgroundIMG, 0, 0);
      boolean qGameFinished = qGame.playGame();
      if (qGameFinished){
        int correctAnswers = qGame.showScore();
        if (wait){
          delay(2500);
          state = 2;
          hillGame.setSpeed(correctAnswers/2);
          savedTime = millis();
          qGame.resetGame();
          waited = true;
        }
        wait = true;
        if (waited){
          wait = false;
          waited = false;
        }
      }
      break;
    case(2):
      boolean hillGameFinished = hillGame.playGame();
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

void scriptThatMakesMyDelayWork(){
  int count = 0;
  while(count < 2){
    delay(1250);
    println(count);
    count ++;
  }
}

void mouseClicked(){
  // if on menu
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
