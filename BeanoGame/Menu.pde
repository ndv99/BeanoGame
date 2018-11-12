// class containing menu attributes
class Menu{
  
  // facts about the comics
  /*
  These facts are actually the answers to the questions, but from public testing it seems that most people don't notice the
  fact box at the bottom of the screen when they start the game, despite its size. I think I'll keep it this way because,
  being honest, it's kinda funny when you tell the player about this after they get a load of questions wrong. Maybe I'm
  a little bit mean in that regard but ah well, it's not a serious game anyway.
  */
  String[] facts = {
  "The Beano comics were first published in 1939.",
  "The comics are published by DC Thomson.",
  "The original editor was George Moonie, from 1938 to 1959.",
  "Dennis the Menace wasn't in the first Beano comic!",
  "The word 'Beano' means 'Party'."
  };
  
  int currentFact = 0; // tracks the currently displayed fact
  
  // loads characters so the icons can be displayed and enable character selection
  BeanoChar dennis = new BeanoChar("Dennis the Menace");
  BeanoChar minnie = new BeanoChar("Minnie the Minx");
  BeanoChar gnasher = new BeanoChar("Gnasher");
  BeanoChar pieface = new BeanoChar("Pie Face");
  // keeps them all in a neat little array so i don't have to remember the instance names
  BeanoChar[] characters = {
    dennis, minnie, gnasher, pieface
  };
  
  // images for the titles and start button
  PImage title;
  PImage title2;
  PImage start;
  
  //methods
  
  // displays character choices
  void characterChoices(){
    int count = 0;
    
    // displays the character icons using a for loop so i don't have to use tons of variables and lines of code
    for (BeanoChar character : characters){
      character.setCharacter();
      image(character.getIcon(), 450 + count*100, 25);
      count ++;
    }
  }
  
  // text box showing which character the player has chosen. default is dennis the menace
  void chosenCharacter(BeanoChar character){
    strokeWeight(5);
    stroke(blue);
    fill(yellow);
    rect(900, 0, 300, 40);
    textSize(30);
    fill(red);
    text(character.name, 910, 30);
  }
  
  // start button for the game
  void startButton(){
    translate(600, 350);
    start = loadImage("GuiAssets/Start.png");
    image(start, -start.width/2, -20);
  }
  
  // displays facts about the beano comics
  void factBox(){
    fill(yellow);
    strokeWeight(5);
    stroke(blue);
    rect(0, 700, 1200, 50);
    String fact = facts[currentFact];
    textSize(40);
    fill(red);
    text(fact, 10, 740);
  }
  
  // draws the titles
  void drawTitle(){
    title = loadImage("GuiAssets/title.png");
    title2 = loadImage("GuiAssets/DennisDash2.png");
    image(title, 5, 5);
    image(title2, 40.5, 120);
  }
  
  // moves onto the next fact
  void nextFact(){
    if (currentFact != 4){ // prevents an index error when you're on the final fact
      currentFact ++;
    } else {
      currentFact = 0;
    }
  }
  
  // accessor for character array
  BeanoChar[] getCharacters(){
    return characters;
  }
  
}
