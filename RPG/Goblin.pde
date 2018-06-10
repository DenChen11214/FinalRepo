class Goblin extends Monsters{
  PImage goblin;
  Goblin(float health, float attack, float x_, float y_) {
    hp = health;
    atk = attack;
    x = x_;
    y = y_;
    goblin = loadImage("goblin.png");
    goblin.resize(75,75);
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
    image(goblin,x,y);
    text("" + hp,x,y);  
  }  
}
