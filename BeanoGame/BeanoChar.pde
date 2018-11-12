// class to store attributes about game characters
class BeanoChar{
  
  // icon and sprie for character
  PImage icon;
  PImage sprite;
  
  // sizes for icon and sprite
  int[] iconSize = {100, 100};
  int[] spriteSize = {100, 200};
  
  // actual name of character
  String name;
  
  // constructor - forces setting of name upon initialisation
  BeanoChar (String name){
    this.name = name;
  }
  
  // sets up character attributes using the name
  void setCharacter(){
    switch(this.name){
      case("Dennis the Menace"):
        icon = loadImage("Icons/Dennis.png");
        sprite = loadImage("Sprites/Dennis.png");
        break;
      case("Minnie the Minx"):
        icon = loadImage("Icons/Minnie.png");
        sprite = loadImage("Sprites/Minnie.png");
        break;
      case("Gnasher"):
        icon = loadImage("Icons/Gnasher.png");
        sprite = loadImage("Sprites/Gnasher.png");
        break;
      case("Pie Face"):
        icon = loadImage("Icons/PieFace.png");
        sprite = loadImage("Sprites/PieFace.png");
        break;
    }
  }
  
  PImage getIcon(){
    // accessor for icon
    icon.resize(iconSize[0], iconSize[1]);
    return icon;
  }
  
  PImage getSprite(){
    // accessor for sprite
    sprite.resize(spriteSize[0], spriteSize[1]);
    return sprite;
  }
}
