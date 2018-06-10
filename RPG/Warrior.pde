class Warrior extends Classes {
  PImage kain;
  Warrior() {
    atk = 75;
    hp = 500;
    maxHp = 500;
    cooldown = 0;
    isDead = false;
    myTurn = true;
    name = "Kain";
    x = width / 4.0;
    y = height / 4.0 + 50;
    kain = loadImage("kain_sprite.png");
    kain.resize(75,75);
  }
  void attack(Monsters monster) {
    //should trigger the attack animation
    monster.hp -= atk;
    if (cooldown > 0) {
      cooldown --;
    }
  }
  void cleave(Monsters monster) {
    monster.hp -=2 * atk;
    cooldown = 2;
  }

  void dead() {
    if (hp <= 0) {
      isDead = true;
      hp = 0;
    }
  }
  void display() {
    //testing
    image(kain,x,y);
    fill(0);
    text("" + hp,x,y);
  }
}
