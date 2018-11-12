// class containing attributes and methods for the question game
class QuestionGame{
  
  // fields
  
  // questions that the player is asked
  String[] questions = {
  "When were the Beano comics first published?",
  "Who originally published the Beano comics?",
  "Who was the original editor of the Beano comics?",
  "Who was on the cover of the first Beano?",
  "What does 'Beano' mean?"
  };
  
  // the correct answers (pls dont cheat k thx)
  String[] rightAnswers = {
    "1", "3", "3", "1", "2"
  };
  
  // possible answers
  String[][] answers = {
  {"[1] 1939", "[2] 1980", "[3] 2005"}, 
  {"[1] AB Johnson", "[2] BP Canister", "[3] DC Thomson"}, 
  {"[1] Lauren Baker", "[2] Brian Johnson", "[3] George Moonie"}, 
  {"[1] Big Eggo", "[2] Dennis the Menace", "[3] Gnasher"}, 
  {"[1] Full of beans", "[2] Party", "[3] A woolly hat"}
  };
  
  // array that contains what the player has answered
  String[] playerAnswers = {
  "", "", "", "", ""
  };
  
  // tracks the current question
  int currentQuestion = 0;
  
  // methods
  
  // accessor for the correct answers
  String[] getRightAnswers() {
    return rightAnswers;
  }
  
  // accessor for the current question
  int getCurrentQuestion(){
    return currentQuestion;
  }
  
  // sets the player's answer for the current question
  void setPlayerAnswer(String answer){
    playerAnswers[this.currentQuestion] = answer;
  }
  
  // shows instructions on how to answer the questions
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
  
  // goes to the next question
  void nextQuestion(){
    currentQuestion ++;
  }
  
  // shows the current question and the possible answers
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
  
  // shows the score at the end of the game
  int showScore(){
    int correctAnswers = 0;
    for (int i = 0; i < playerAnswers.length; i++){
      if (playerAnswers[i].equals(rightAnswers[i])){ // compares the player's answers with the corect answers
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
  
  // container method for gameplay
  boolean playGame(){
    boolean finished = false;
    instructionBox(); // shows the instruction box
    if (this.currentQuestion < 5){ // prevents the game trying to go to questions that don't exist
        qGame.showQuestion();
        
        // handles keyboard input for question answers
        /*
        If the player presses any key other than 1, 2, or 3, they're just ignored. The game will not move on to the next question until
        they press one of these three keys. You play by the rules or you don't play at all. Simple.
        */
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
            /*
            You'll see that I've set a delay of 150 milliseconds every time a question is answered. This is because when keyboard inputs are
            read, holding down a key for too long makes Processing think it's being repeatedly pressed (which allows for a nice little cheat
            in the hill run). This means that players may accidentally answer multiple questions without intending to. 150ms is a nice number
            because it keeps the game running fairly snappily (is that a word?) without allowing them to accidentally mess themselves up.
            */
          }
        }
      } else {
        finished = true;
      }
  return finished;
  }
  
  // game is reset when you finish so it doesn't break if you want to play it again.
  void resetGame(){
    currentQuestion = 0;
    playerAnswers = new String[] {"", "", "", "", ""};
  }
  
}
