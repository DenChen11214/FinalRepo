class Slime extends Monsters{
  PImage slime;
  Slime(float health, float attack, float x_, float y_) {
    hp = health;
    atk = attack;
    x = x_;
    y = y_;
    slime = loadImage("flan.png");
    slime.resize(75,75);
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
    fill(255);
    image(slime,x,y);
    fill(0);
    text("" + hp,x,y);
  }
}
