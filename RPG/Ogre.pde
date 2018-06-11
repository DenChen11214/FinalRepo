
class Ogre extends Monsters {

  Ogre(float health, float attack, float x_, float y_) {
    hp = health;
    atk = attack;
    x = x_;
    y = y_;
    a = loadImage(Ogre.png");
    a.resize(75, 75);
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
    image(a, x, y);
    fill(0);
    text("" + hp, x, y);
  }
}
