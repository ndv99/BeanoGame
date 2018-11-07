// 0 means menu, 1 means question game, 2 means hill game.
int state = 0;

int totalTime = 5000;
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
  backgroundIMG = loadImage("GuiAssets/MenuBackground.jpg");
  background(backgroundIMG);
  
  menu = new Menu();
  qGame = new QuestionGame();
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
      menu.drawTitle();
      menu.characterChoices();
      menu.factBox();
      menu.startButton();
      
      int passedTime = millis() - savedTime;
      if (passedTime > totalTime){
        menu.nextFact();
        menu.factBox();
        savedTime = millis();
      }
      break;
    case(1):
      boolean finished = qGame.playGame();
      if (finished){
        delay(2500);
        state = 2;
      }
      
      break;
    case(2):
      
      break;
  }
}

void mouseClicked(){
  if(state == 0){
    if (mouseX > 400 && mouseX < 800 && mouseY > 250 && mouseY < 550){
      state = 1;
    }
  }
}
