// 0 means menu, 1 means question game, 2 means hill game.
int state = 0;

int totalTime = 5000;
int savedTime;

PImage backgroundIMG;

Menu menu = new Menu();
Player player = new Player();
BeanoChar[] characters = menu.getCharacters();

QuestionGame qGame = new QuestionGame();

color yellow = color(253, 253, 5);
color blue = color(14, 76, 139);
color red = color(229, 0, 42);

void setup(){
  size(1200, 750);
  savedTime = millis();
  backgroundIMG = loadImage("GuiAssets/MenuBackground.jpg");
  background(backgroundIMG);
  
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
      int currentQuestion = qGame.getCurrentQuestion();
      if (currentQuestion < 5){
        qGame.showQuestion();
        if (keyPressed){
          println(key);
          if (key == '1'){
            qGame.setPlayerAnswer("1");
            delay(100);
            qGame.nextQuestion();
          } else if (key == '2'){
            qGame.setPlayerAnswer("2");
            delay(100);
            qGame.nextQuestion();
          } else if (key == '3'){
            qGame.setPlayerAnswer("3");
            delay(100);
            qGame.nextQuestion();
          }
        }
      } else {
        //qGame.showScore();
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
      redraw();
    }
  }
}
