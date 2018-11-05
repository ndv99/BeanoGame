class Menu{
  String[] facts = {
  "The Beano comics were first published in 1939.",
  "The comics are published by DC Thomson.",
  "The original editor was George Moonie, from 1938 to 1959.",
  "Dennis the Menace wasn't in the first Beano comic!",
  "The word 'Beano' means 'Party'."
  };
  
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
  String[] questions = {
  "When were the Beano comics first published?",
  "Who originally published the Beano comics?",
  "Who was the original editor of the Beano comics?",
  "Was Dennis the Menace in the first Beano comic?",
  "What does 'Beano' mean?"
  };
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
