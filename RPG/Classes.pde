abstract class Classes{
  float hp, atk, cooldown;
  boolean isDead;
  boolean myTurn;
  String name;
  float x,y;
  void runAway(){
  }
  abstract void attack(Monsters monster);
  abstract void specialMove(Monsters monster);
  abstract void dead();
}