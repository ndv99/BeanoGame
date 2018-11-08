// 0 means menu, 1 means question game, 2 means hill game.
int state = 0;

int changeFactTime;
int savedTime;

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
        qGame.showScore();
        state = 2;
        qGame.resetGame();
      }
      break;
    case(2):
      hillGame.setCharacter(player.getCharacter());
      boolean hillGameFinished = hillGame.playGame();
      if (hillGameFinished){
        hillGame.resetGame();
        state = 0;
      }
      break;
  }
}

void mouseClicked(){
  // if on menu
  if (state == 0){
    // start game
    if (mouseX > 400 && mouseX < 800 && mouseY > 250 && mouseY < 550){
      state = 1;
    }
    // characters selection
    BeanoChar[] characters = menu.getCharacters();
    if (mouseX > 450 && mouseX < 550 && mouseY > 25 && mouseY < 125){
      player.setCharacter(characters[0]);
    }
    if (mouseX > 550 && mouseX < 650 && mouseY > 25 && mouseY < 125){
      player.setCharacter(characters[1]);
    }
    if (mouseX > 650 && mouseX < 750 && mouseY > 25 && mouseY < 125){
      player.setCharacter(characters[2]);
    }
    if (mouseX > 750 && mouseX < 850 && mouseY > 25 && mouseY < 125){
      player.setCharacter(characters[3]);
    }
  }
}

void keyPressed(){
  if (state == 2){
    int speed = hillGame.getSpeed();
    hillGame.setSpeed(speed++);
    println(hillGame.getSpeed());
  }
}
