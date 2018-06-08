abstract class Classes {
  float hp, atk, cooldown,maxHp;
  boolean isDead;
  boolean myTurn;
  String name;
  float x, y;
  void runAway() {
  }
   void setTurn(boolean a){
    myTurn = a ;
  }
  abstract void attack(Monsters monster);//triggers attack animation
  abstract void dead();//makes character lie on floor/disappear
}