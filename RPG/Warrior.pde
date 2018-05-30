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
     
   }
  
   void specialMove(Monsters monster){
     
   }
  
   void dead(){
     if(hp == 0){
       isDead = true;
     }
   }
}