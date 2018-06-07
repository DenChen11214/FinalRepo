class MiniBoss extends Monsters{
  MiniBoss(float health, float attack, float x_, float y_) {
    hp = health;
    atk = attack;
    x = x_;
    y = y_;
  }
  void attack(Classes character) {//in battle, make it so that theres a half chance that it does hitAll and half chance it hits a random mob
    character.hp -=atk;
  }
  void hitAll(Classes[] players){
    for(int i =0;i< players.length;i++){
      if(players[i] != null){
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
    fill(255);
    ellipse(x,y,50,50);
    fill(0);
    text("" + hp,x,y);
  }
}