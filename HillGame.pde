class HillGame{
  float[] startPoint = {0, 750};
  float[] endPoint = {900, 300};
  float[] position = {0, 750};
  float speed = 1;
  boolean finished = false;
  
  BeanoChar character;
  PImage sprite;
  
  int savedTime = millis();
  int characterMoveInterval = 10;
  
  void setCharacter(BeanoChar characterChoice){
    this.character = characterChoice;
    sprite = characterChoice.getSprite();
  }
  
  void autoSlow(){
      if (speed > 1){
        speed = speed / 1.01;
      }
  }
  
  void setSpeed(int speed){
    this.speed = speed;
  }
  
  float getSpeed(){
    return speed;
  }
  
  void drawHill(){
    strokeWeight(0);
    stroke(0, 200, 0);
    fill(0, 200, 0);
    triangle(0, 750, 1000, 750, 1000, 300);
    rect(1000, 300, 200, 450);
  }
  
  boolean playGame(){
    autoSlow();
    movePlayer();
    if (keyPressed){
      speed = speed * 1.1;
    }
    if (position[0] >= endPoint[0] | position[1] <= endPoint[1]){
      finished = true;
    }
    return finished;
  }
  
  void setNewPosition(float newX, float newY){
    position = new float[] {newX, newY};
  }
  
  void movePlayer(){
    image(backgroundIMG, 0, 0);
    drawHill();
    image(sprite, position[0], position[1] - 200, 100, 200);
    float newX = position[0] + speed;
    float newY = position[1] - speed*0.45;
    setNewPosition(newX, newY); 
  }
  
  void resetGame(){
    setNewPosition(startPoint[0], startPoint[1]);
    setSpeed(1);
    finished = false;
  }
  
  void showTime(int startTime, int timeTaken){
    image(backgroundIMG, 0, 0);
    fill(yellow);
    strokeWeight(5);
    stroke(blue);
    rect(0, 250, 1200, 150);
    fill(red);
    textSize(75);
    text("You did it in " + (timeTaken - startTime) + " milliseconds!", 10, 340);
  }
  
}
