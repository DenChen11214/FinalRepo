class MiniBoss extends Monsters{
  MiniBoss(float health, float attack, float x_, float y_) {
    hp = health;
    atk = attack;
    x = x_;
    y = y_;
  }
  void attack(Classes character) {
    character.hp -=atk;
  }
  void hitAll(Classes[] players){
    for(int i =0;i< players.length;i++){
      if(players[i] != null){
        players[i].hp -= atk;
      }
    }
  }
  void dead() {
    if (hp == 0) {
      //disappear
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