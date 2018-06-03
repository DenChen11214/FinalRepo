class Mage extends Classes {
  Mage() {
    atk = 75;
    hp = 200;
    cooldown = 0;
    isDead = false;
    myTurn = false;
    name = "Chiaki";
    x = width / 4.0;
    y = height / 2.0;  
}
  void attack(Monsters monster) {
    //should trigger the attack animation
    monster.hp -=atk;
  }

  void fireball(Monsters monster) {
    monster.hp -= 2*atk;
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
  }
}