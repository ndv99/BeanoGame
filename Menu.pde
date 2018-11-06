class Menu{
  String[] facts = {
  "The Beano comics were first published in 1939.",
  "The comics are published by DC Thomson.",
  "The original editor was George Moonie, from 1938 to 1959.",
  "Dennis the Menace wasn't in the first Beano comic!",
  "The word 'Beano' means 'Party'."
  };
  int currentFact = 2;
  BeanoChar dennis = new BeanoChar("Dennis the Menace");
  BeanoChar minnie = new BeanoChar("Minnie the Minx");
  BeanoChar gnasher = new BeanoChar("Gnasher");
  BeanoChar roger = new BeanoChar("Roger the Dodger");
  BeanoChar[] characters = {
    dennis, minnie, gnasher, roger
  };
  
  PImage title;
  
  void characterChoices(){    
    int count = 0;
    for (BeanoChar character : characters){
      character.setCharacter();
      image(character.getIcon(), 450 + count*100, 25);
      count ++;
    }
  }
  
  void startButton(){
  }
  
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
  
  void drawTitle(){
    title = loadImage("GuiAssets/title.png");
    image(title, 25, 25);
  }
  
  void nextFact(){
    if (currentFact != 3){
      currentFact ++;
    } else {
      currentFact = 0;
    }
  }
  
  BeanoChar[] getCharacters(){
    return characters;
  }
  
}
