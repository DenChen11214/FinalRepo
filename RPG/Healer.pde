class Healer extends Classes{
  Healer(){
    atk = 25;
    hp = 250;
    cooldown = 0;
    isDead = false;
    myTurn = true;
    name = "Cyril";
    
  }
   void attack(Monsters monster){
     //should trigger the attack animation
     monster.hp -=atk;
   }
  
   void heal(Classes character){
     character.hp += 150;
   }
  
   void dead(){
     if(hp == 0){
       isDead = true;
     }
   }
}
