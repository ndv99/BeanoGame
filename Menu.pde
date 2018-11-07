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
  BeanoChar pieface = new BeanoChar("Pie Face");
  BeanoChar[] characters = {
    dennis, minnie, gnasher, pieface
  };
  
  PImage title;
  
  //methods
  
  void characterChoices(){
    int count = 0;
    for (BeanoChar character : characters){
      character.setCharacter();
      image(character.getIcon(), 450 + count*100, 25);
      count ++;
    }
  }
  
  void startButton(){
    translate(600, 350);
    fill(yellow);
    strokeWeight(5);
    stroke(blue);
    rect(-200, -100, 400, 200);
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
