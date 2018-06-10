class Mage extends Classes {
  Mage() {
    atk = 100;
    hp = 400;
    maxHp = 400;
    cooldown = 0;
    isDead = false;
    myTurn = false;
    name = "Palom";
    x = width / 4.0;
    y = height / 2.0 - 5;
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
    fill(255);
    ellipse(x, y, 50, 50);
    fill(0);
    text("" + hp, x, y);
  }
}
