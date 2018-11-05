class Menu{
  String[] facts;
  PImage title;
  
  void characterChoices(){
  }
  
  void startButton(){
  }
  
  void factBox(){
  }
  
}


class BeanoChar{
  String name;
  PImage icon;
  PImage sprite;
  
  void drawCharacter(){
  }
  
}


class Player{
  BeanoChar character;

}


class QuestionGame{
  String[] questions;
  String[][] rightAnswers;
  String[][] answers;
  
  String[][] getAnswers(){
    return answers;
  }
  
  String[][] getRightAnswers() {
    return rightAnswers;
  }
  
  int calculateScore() {
    int correctlyAnswered = 0;
    return correctlyAnswered;
  }
  
  void showQuestion(){
  }
  
  void endGame(){
  }
  
}


class HillGame{
  int[] startPoint1;
  int[] startPoint2;
  int[] endPoint;
  int p1Speed;
  int p2Speed;
  
  void adjustP1Speed(){
  }
  
  void adjustP2Speed(){
  }
  
}


void setup(){
}

void draw(){
}
