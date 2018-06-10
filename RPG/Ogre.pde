class Ogre extends Monsters{
  PImage ogre; 
  Ogre(float health, float attack, float x_, float y_) {
    hp = health;
    atk = attack;
    x = x_;
    y = y_;
    ogre = loadImage("MadOgre.png");
    ogre.resize(75,75);
  }
  void attack(Classes character) {
    character.hp -=atk;
  }
  boolean dead() {
    if (hp <= 0) {
      return true;
    }
    return false;
  }
  void display() {
    //testing
    image(ogre,x,y);
    fill(0);
    text("" + hp,x,y);
  }
}
