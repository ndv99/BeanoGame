class Player{
  
  BeanoChar character;
  
  void setCharacter(BeanoChar character){
    character.setCharacter();
    this.character = character;
  }
  
  BeanoChar getCharacter(){
    return character;
  }
}
