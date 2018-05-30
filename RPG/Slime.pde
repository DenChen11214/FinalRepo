class Ogre{
  float hp,atk;
  float x,y;
  boolean myTurn;
  Ogre(float health, float attack){
    hp = health;
    atk = attack;
  }
  void attack(Classes character){
    character.hp -=atk;
  }
  void dead(){
    if(hp == 0){
      //disappear
    }
  }
}
