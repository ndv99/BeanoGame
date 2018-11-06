// 0 means menu, 1 means question game, 2 means hill game.
int state = 0;

int totalTime = 5000;
int savedTime;

PImage backgroundIMG;
Menu menu = new Menu();

color yellow = color(253, 253, 5);
color blue = color(14, 76, 139);
color red = color(229, 0, 42);

void setup(){
  size(1200, 750);
  savedTime = millis();
  backgroundIMG = loadImage("GuiAssets/MenuBackground.jpg");
  background(backgroundIMG);
}

void draw(){
  switch (state){
    case(0):
      menu.drawTitle();
      menu.characterChoices();
      menu.factBox();
      int passedTime = millis() - savedTime;
      if (passedTime > totalTime){
        menu.nextFact();
        menu.factBox();
        savedTime = millis();
      }
      break;
    case(1):
      break;
    case(2):
      break;
  }
}
