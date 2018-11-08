class BeanoChar{
  PImage icon;
  PImage sprite;
  String name;
  
  
  BeanoChar (String name){
    this.name = name;
  }
  
  void setCharacter(){
    switch(name){
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
    icon.resize(100, 100);
    return icon;
  }
  
  PImage getSprite(){
    sprite.resize(100,200);
    return sprite;
  }
}
