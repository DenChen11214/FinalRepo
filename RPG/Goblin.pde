class Goblin extends Monsters{
  Goblin(float health, float attack, float x_, float y_) {
    hp = health;
    atk = attack;
    x = x_;
    y = y_;
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
    ellipse(x,y,50,50);
    fill(0);
    text("" + hp,x,y);  
  }  
}