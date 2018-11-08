class HillGame{
  float[] startPoint = {0, 750};
  float[] endPoint = {900, 300};
  float[] position = {0, 750};
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
  
  void autoSlow(){
    int passedTime = savedTime - millis();
    if (passedTime > 50){
      speed --;
    }
  }
  
  void setSpeed(int speed){
    this.speed = speed;
  }
  
  int getSpeed(){
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
    //autoSlow();
    movePlayer();
    if (position[0] >= endPoint[0] | position[1] <= endPoint[1]){
      finished = true;
    }
    return finished;
  }
  
  void setNewPosition(float newX, float newY){
    position = new float[] {newX, newY};
  }
  
  void movePlayer(){
    image(bgImage, 0, 0);
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
  
}
