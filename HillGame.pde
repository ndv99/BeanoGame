class HillGame{
  float[] startPoint = {750, 0};
  float[] endPoint = {1000, 300};
  float[] position = {0, 0};
  int speed = 1;
  boolean finished = false;
  
  BeanoChar character;
  PImage sprite;
  PImage bgImage = loadImage("GUIAssets/MenuBackground.jpg");
  
  int savedTime = millis();
  int characterMoveInterval = 10;
  
  void setCharacter(BeanoChar character){
    this.character = character;
    sprite = character.getSprite();
  }
  
  void adjustSpeed(){
    if (keyPressed){
      speed++;
    }
    int passedTime = savedTime - millis();
    if (passedTime > 50){
      speed --;
    }
  }
  
  void drawHill(){
    strokeWeight(0);
    stroke(0, 200, 0);
    fill(0, 200, 0);
    triangle(0, 750, 1000, 750, 1000, 300);
    rect(1000, 300, 200, 450);
  }
  
  boolean playGame(){
    adjustSpeed();
    movePlayer();
    if (position == endPoint){
      finished = true;
    }
    return finished;
  }
  
  void setNewPosition(float newX, float newY){
    position = new float[] {newX, newY};
  }
  
  void movePlayer(){
    int passedTime = savedTime - millis();
    if (passedTime > characterMoveInterval){
      image(bgImage, 0, 0);
      drawHill();
      image(sprite, position[0], position[1] + 200, 100, 200);
      float newX = position[0] + speed*10;
      float newY = position[1] + speed*4.5;
      setNewPosition(newX, newY);
    }
    
  }
  
}
