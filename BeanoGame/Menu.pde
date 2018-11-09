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
  PImage title2;
  PImage start;
  
  //methods
  
  void characterChoices(){
    int count = 0;
    for (BeanoChar character : characters){
      character.setCharacter();
      image(character.getIcon(), 450 + count*100, 25);
      count ++;
    }
  }
  
  void chosenCharacter(BeanoChar character){
    strokeWeight(5);
    stroke(blue);
    fill(yellow);
    rect(900, 0, 300, 40);
    textSize(30);
    fill(red);
    text(character.name, 910, 30);
  }
  
  void startButton(){
    translate(600, 350);
    start = loadImage("GuiAssets/Start.png");
    image(start, -start.width/2, -20);
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
    title2 = loadImage("GuiAssets/DennisDash2.png");
    image(title, 5, 5);
    image(title2, 40.5, 120);
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
