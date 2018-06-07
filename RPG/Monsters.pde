abstract class Monsters {
  float hp, atk;
  float x, y;
  boolean myTurn;
  abstract void attack(Classes character);//attack animation
  abstract boolean dead();//death animation/disappears
  abstract void display();
  String toString(){
    return "" + hp;
  }
   void setTurn(boolean a){
    myTurn = a ;
  }
}
