class Warrior extends Classes {
  Warrior() {
    atk = 50;
    hp = 300;
    cooldown = 0;
    isDead = false;
    myTurn = true;
    name = "Kain";
    x = width / 4.0;
    y = height / 4.0;
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
    }
  }
  void display() {
    //testing
    fill(255);
<<<<<<< HEAD
    ellipse(x, y, 50, 50);
=======
    ellipse(x,y,50,50);
    fill(0);
    text("" + hp,x,y);  
>>>>>>> master
  }
}
