class Battle {
  Healer h;
  Mage m;
  Warrior w;
  Ogre o;
  Slime s;
  Goblin g;
  float numMonsters;
  Battle() {
    numMonsters = (int)(Math.random() * 3) + 1;
    h = new Healer();
    m = new Mage();
    w = new Warrior();
    if (numMonsters ==1 ) {
      g = new Goblin(400, 70, width - width/4, height/2);
    }
    else if (numMonsters ==2 ) {
      s = new Slime(500, 60, width - width/4, height/ 3);
      o = new Ogre(600, 50, width - width/4, 2 * height/3);
    }
    else{
      g = new Goblin(400, 70, width - width/4, height/4);
      s = new Slime(500, 60, width - width/4, height/2);
      o = new Ogre(600, 50, width - width/4, 3 * height/4);
    }
  }
  Battle(float monsters) {
    numMonsters = monsters;
    h = new Healer();
    m = new Mage();
    w = new Warrior();
    h.display();
    m.display();
    w.display();
    if (numMonsters ==1 ) {
      g = new Goblin(400, 70, width - width/4, height/2);
    }
    else if (numMonsters ==2 ) {
      s = new Slime(500, 60, width - width/4, height/ 3);
      o = new Ogre(600, 50, width - width/4, 2 * height/3);
    }
    else{
      g = new Goblin(400, 70, width - width/4, height/4);
      s = new Slime(500, 60, width - width/4, height/2);
      o = new Ogre(600, 50, width - width/4, 3 * height/4);
    }
  }
  void display() {
    if (numMonsters ==1 ) {
      g.display();
    }
    else if (numMonsters ==2 ) {
      o.display();
      s.display();
    }
    else{
      o.display();
      s.display();
      g.display();
    }
    h.display();
    w.display();
    m.display();
  }
}