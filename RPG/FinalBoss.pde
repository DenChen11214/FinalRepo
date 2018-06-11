
class FinalBoss extends Monsters{
  FinalBoss(float health, float attack, float x_, float y_) {
    hp = health;
    atk = attack;
    x = x_;
    y = y_;
     a = loadImage("Zemus.png");
    a.resize(200,200);
  }

  void attack(Classes character) {// do the same thing you did in Miniboss here
    Classes[] players = {h,m,w};
    if((int)(Math.random() * 2) == 1){
      character.hp -=atk;
    }
    else{
      hitAll(players);
    }
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
    image(a,x,y);
    fill(255,255,0);
    text("" + hp,x,y);
  }
}
