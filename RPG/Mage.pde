class Mage extends Classes{
  Mage(){
    atk = 75;
    hp = 200;
    cooldown = 0;
    isDead = false;
    myTurn = true;
    name = "Chiaki";
    
  }
   void attack(Monsters monster){
     //should trigger the attack animation
     monster.hp -=atk;
   }
  
   void fireball(Monsters monster){
     monster.hp -= 2*atk;
   }
  
   void dead(){
     if(hp == 0){
       isDead = true;
     }
   }
}
