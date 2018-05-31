class Battle{
  Healer h;
  Mage m;
  Warrior w;
  Ogre o;
  Slime s;
  Goblin g;
  float numMonsters;
  Battle(){
    numMonsters = (int)(Math.random() * 3) + 1;
    h = new Healer();
    m = new Mage();
    w = new Warrior();
    h.display();
    m.display();
    w.display();
    if(numMonsters ==1 ){
    }
    if(numMonsters ==2 ){
    }
    if(numMonsters ==3 ){
    }
  }
  Battle(float monsters){
    numMonsters = monsters;
    h = new Healer();
    m = new Mage();
    w = new Warrior();
  }
}