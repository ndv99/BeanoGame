class QuestionGame{
  String[] questions = {
  "When were the Beano comics first published?",
  "Who originally published the Beano comics?",
  "Who was the original editor of the Beano comics?",
  "Was Dennis the Menace in the first Beano comic?",
  "What does 'Beano' mean?"
  };
  String[][] rightAnswers;
  String[][] answers = {
  {"[1] 1939", "[2] 1980", "[3] 2005"}, 
  {"[1] AB Johnson", "[2] BP Canister", "[3] DC Thomson"}, 
  {"[1] Lauren Baker", "[2] Brian Johnson", "[3] George Moonie"}, 
  {"[1] Yes", "[2] No"}, 
  {"[1] Full of beans", "[2] Party", "[3] A woolly hat"}
  };
  
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
