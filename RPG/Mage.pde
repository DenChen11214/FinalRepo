
class Mage extends Classes {
  PImage Palom;
  Mage() {
    atk = 100;
    hp = 400;
    maxHp = 400;
    cooldown = 0;
    isDead = false;
    myTurn = false;
    name = "Palom";
    x = width - width / 4.0;
    y = height / 2.0 - 5;
    Palom = loadImage("Palom.png");
    Palom.resize(75,75);
  }
  void attack(Monsters monster) {
    //should trigger the attack animation
    monster.hp -=atk;
    if (cooldown > 0) {
      cooldown --;
    }
  }

  void fireball(Monsters[] monsters) {
    for (int i = 0; i< monsters.length; i++) {
      if (monsters[i] != null) {
        monsters[i].hp -= atk;
      }
    }
    cooldown = 3;
  }

  void dead() {
    if (hp <= 0) {
      isDead = true;
      hp = 0;
    }
  }

  void display() {
    //testing
    image(Palom,x,y);
    fill(0);
    text("" + hp, x, y);
  }
}
