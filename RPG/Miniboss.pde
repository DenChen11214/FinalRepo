
class MiniBoss extends Monsters {
  MiniBoss(float health, float attack, float x_, float y_) {
    hp = health;
    atk = attack;
    x = x_;
    y = y_;
    a = loadImage("Scarmiglione2.png");
    a.resize(100, 100);
  }

  void attack(Classes character) {//in battle, make it so that theres a half chance that it does hitAll and half chance it hits a random mob
    Classes[] players = {h, m, w};
    if ((int)(Math.random() * 2) == 1) {
      character.hp -=atk;
    } else {
      hitAll(players);
    }
  }
  void hitAll(Classes[] players) {
    for (int i =0; i< players.length; i++) {
      if (players[i] != null) {
        players[i].hp -= atk;
      }
    }
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
