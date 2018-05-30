class Warrior extends Classes{
  Warrior(){
    atk = 50;
    hp = 300;
    cooldown = 0;
    isDead = false;
    myTurn = true;
    name = "Kain";
    
  }
   void attack(Monsters monster){
     //should trigger the attack animation
     monster.hp -=atk;
   }
  
   void infernalSlash(Monsters monster){
     monster.hp -=2 * atk;
   }
  
   void dead(){
     if(hp == 0){
       isDead = true;
     }
   }
}
