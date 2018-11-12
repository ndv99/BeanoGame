// class containing player information
class Player{
  
  BeanoChar character; // chosen character
  
  // sets the character to whichever one the player chooses in the menu
  void setCharacter(BeanoChar character){
    character.setCharacter(); // makes sure the icon and sprite load properly
    this.character = character;
  }
  
  // accessor for chosen character
  BeanoChar getCharacter(){
    return character;
  }
}
