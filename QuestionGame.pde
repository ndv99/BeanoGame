class QuestionGame{
  
  //fields
  
  String[] questions = {
  "When were the Beano comics first published?",
  "Who originally published the Beano comics?",
  "Who was the original editor of the Beano comics?",
  "Who was on the cover of the first Beano?",
  "What does 'Beano' mean?"
  };
  
  String[] rightAnswers = {
    "1", "3", "3", "1", "2"
  };
  String[][] answers = {
  {"[1] 1939", "[2] 1980", "[3] 2005"}, 
  {"[1] AB Johnson", "[2] BP Canister", "[3] DC Thomson"}, 
  {"[1] Lauren Baker", "[2] Brian Johnson", "[3] George Moonie"}, 
  {"[1] Big Eggo", "[2] Dennis the Menace", "[3] Gnasher"}, 
  {"[1] Full of beans", "[2] Party", "[3] A woolly hat"}
  };
  String[] playerAnswers = {
  "", "", "", "", ""
  };
  
  int currentQuestion = 0;
  
  //methods
  
  String[] getRightAnswers() {
    return rightAnswers;
  }
  
  int getCurrentQuestion(){
    return currentQuestion;
  }
  
  void setPlayerAnswer(String answer){
    playerAnswers[this.currentQuestion] = answer;
  }
  
  int calculateScore() {
    int correctlyAnswered = 0;
    return correctlyAnswered;
  }
  
  void instructionBox(){
    fill(yellow);
    strokeWeight(5);
    stroke(blue);
    rect(0, 100, 1200, 50);
    String howTo = "Press 1, 2, or 3 on the keyboard to answer.";
    textSize(40);
    fill(red);
    text(howTo, 10, 140);
  }
  
  void nextQuestion(){
    currentQuestion ++;
  }
  
  void showQuestion(){
    fill(yellow);
    strokeWeight(5);
    stroke(blue);
    rect(0, 250, 1200, 150);
    String question = questions[currentQuestion];
    String answer1 = answers[currentQuestion][0];
    String answer2 = answers[currentQuestion][1];
    String answer3 = answers[currentQuestion][2];
    textSize(40);
    fill(red);
    text(question, 10, 300);
    
    textSize(20);
    text(answer1, 10, 340);
    text(answer2, 10, 360);
    text(answer3, 10, 380);
  }
  
  int showScore(){
    int correctAnswers = 0;
    for (int i = 0; i < playerAnswers.length; i++){
      if (playerAnswers[i].equals(rightAnswers[i])){
        correctAnswers ++;
      }
    }
    fill(yellow);
    strokeWeight(5);
    stroke(blue);
    rect(0, 250, 1200, 150);
    fill(red);
    textSize(90);
    text("You got " + correctAnswers + " questions right!", 10, 340);
    return correctAnswers;
  }
  
  boolean playGame(){
    boolean finished = false;
    instructionBox();
    if (this.currentQuestion < 5){
        qGame.showQuestion();
        if (keyPressed){
          if (key == '1'){
            setPlayerAnswer("1");
            delay(150);
            nextQuestion();
          } else if (key == '2'){
            setPlayerAnswer("2");
            delay(150);
            nextQuestion();
          } else if (key == '3'){
            setPlayerAnswer("3");
            delay(150);
            nextQuestion();
          }
        }
      } else {
        finished = true;
      }
  return finished;
  }
  
  void resetGame(){
    currentQuestion = 0;
  }
  
}
