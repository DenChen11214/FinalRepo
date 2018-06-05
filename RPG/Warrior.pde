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
  }
  void cleave(Monsters monster) {
    monster.hp -=2 * atk;
    cooldown = 4;
  }

  void dead() {
    if (hp == 0) {
      isDead = true;
    }
  }
  void display() {
    //testing
    fill(255);
    ellipse(x,y,50,50);
    fill(0);
    text("" + hp,x,y);  
  }
}
