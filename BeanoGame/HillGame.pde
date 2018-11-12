// class containing methods and attribute for the hill run game
class HillGame{
  // co-ordinates for key points 
  float[] startPoint = {0, 750};
  float[] endPoint = {900, 300};
  float[] position = {0, 750}; // tracks the player's position
  
  // speed variable
  float speed = 1;
  boolean finished = false; // set to true when finished
  
  // needes to know the character so the sprite can be loaded
  BeanoChar character;
  
  // character sprite and game title
  PImage sprite;
  PImage title;
  
  // sets the game character
  void setCharacter(BeanoChar characterChoice){
    this.character = characterChoice;
    sprite = characterChoice.getSprite();
  }
  
  // automatically slows the character if the player isn't tapping
  void autoSlow(){
    if (speed > 1){
      speed = speed / 1.01;
    }
  }
  
  // sets the speed when the player taps
  void setSpeed(float speed){
    if (speed >= 1) { // cant be less than 1 - anti-zero
      this.speed = speed;
    }
  }
  
  // accessor for speed
  float getSpeed(){
    return speed;
  }
  
  // draws the hill (Law)
  void drawHill(){
    strokeWeight(0);
    stroke(0, 200, 0);
    fill(0, 200, 0);
    triangle(0, 750, 1000, 750, 1000, 300);
    rect(1000, 300, 200, 450);
  }
  
  // container method for playing the game
  boolean playGame(){
    autoSlow(); // autoslow is always running
    movePlayer(); // moves player at speed
    if (keyPressed){ // increases speed when any key is pressed - SIMPLE
      speed = speed * 1.1;
    }
    if (position[0] >= endPoint[0] | position[1] <= endPoint[1]){ // end condition (player has reached/exceeded end point)
      finished = true;
    }
    return finished;
  }
  
  // sets the new position of the player
  void setNewPosition(float newX, float newY){
    position = new float[] {newX, newY};
  }
  
  // moves the player in proportion to their speed 
  void movePlayer(){
    // everything has to be redrawn - this is just due to how processing works.
    image(backgroundIMG, 0, 0);
    // these methods are useful for holding everything to draw a specific item
    titleBox();
    instructionBox();
    drawHill();
    
    // draws sprite at specified position
    image(sprite, position[0], position[1] - 200, 100, 200);
    
    // generates new position accoriding to speed
    float newX = position[0] + speed;
    float newY = position[1] - speed*0.45; // 0.45 is so that player moves at the gradient of the hill
    setNewPosition(newX, newY); 
  }
  
  // resets game when you've finished so that it doesn't break when you try to play it a second time.
  void resetGame(){
    setNewPosition(startPoint[0], startPoint[1]);
    setSpeed(1);
    finished = false;
  }
  
  void showTime(int startTime, int timeTaken){
    // shows the player how quick they completed the game.
    /* 
    This is arbitray if I'm honest with you, but generally you'll find a group of people playing it at a time, so they can each compare their scores.
    */
    image(backgroundIMG, 0, 0); // makes sure no leftovers from the game are there
    fill(yellow);
    strokeWeight(5);
    stroke(blue);
    rect(0, 250, 1200, 150);
    fill(red);
    textSize(75);
    text("You did it in " + ((float)(timeTaken - startTime) / 1000) + " seconds!", 10, 340);
  }
  
  void instructionBox(){
    // displays instruction on how to play the game.
    fill(yellow);
    strokeWeight(5);
    stroke(blue);
    rect(0, 0, 1200, 50);
    textSize(40);
    fill(red);
    text("Keep tapping a key to run faster!", 10, 40);
  }
  
  // displays game title. why? because i want it to and i think it looks better than just a big ol' blank space.
  void titleBox(){
    title = loadImage("GuiAssets/DennisDash.png");
    image(title, 10, 60);
  }
  
}
