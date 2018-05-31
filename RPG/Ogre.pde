class Ogre extends Monsters{
  float hp, atk;
  float x, y;
  boolean myTurn;
  Ogre(float health, float attack, float x_, float y_) {
    hp = health;
    atk = attack;
    x = x_;
    y = y_;
  }
  void attack(Classes character) {
    character.hp -=atk;
  }
  void dead() {
    if (hp == 0) {
      //disappear
    }
  }
  void display() {
    //testing
    ellipse(x,y,50,50);
  }
}