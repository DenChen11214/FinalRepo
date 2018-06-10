class Healer extends Classes {
  Healer() {
    atk = 50;
    hp = 350;
    maxHp = 350;
    cooldown = 0;
    isDead = false;
    myTurn = false;
    name = "Cyril";
    x = width / 4;
    y = 3 * height / 4.0;
  }
  void attack(Monsters monster) {
    //should trigger the attack animation
    monster.hp -=atk;
    if (cooldown > 0) {
      cooldown --;
    }
  }

  void heal(Classes character) {
    if(character.hp + 150 > character.maxHp){
      float h = character.maxHp - character.hp;
      character.hp += h;
    }
    else{
      character.hp += 150;
    }
    cooldown = 3;
  }

  void dead() {
    if(hp <= 0){
      isDead =true;
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
