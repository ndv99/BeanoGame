// 0 means menu, 1 means question game, 2 means hill game.
int state = 0;

PImage backgroundIMG;
Menu menu = new Menu();

void setup(){
  size(1200, 750);
  backgroundIMG = loadImage("GuiAssets/MenuBackground.jpg");
  background(backgroundIMG);
}

void draw(){
  menu.drawTitle();
  menu.characterChoices();
}
