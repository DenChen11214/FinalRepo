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
    } else if (numMonsters ==2 ) {
      s = new Slime(500, 60, width - width/4, height/ 3);
      o = new Ogre(600, 50, width - width/4, 2 * height/3);
    } else {
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
    } else if (numMonsters ==2 ) {
      s = new Slime(500, 60, width - width/4, height/ 3);
      o = new Ogre(600, 50, width - width/4, 2 * height/3);
    } else {
      g = new Goblin(400, 70, width - width/4, height/4);
      s = new Slime(500, 60, width - width/4, height/2);
      o = new Ogre(600, 50, width - width/4, 3 * height/4);
    }
  }
  void display() {
    if (numMonsters ==1 ) {
      g.display();
    } else if (numMonsters ==2 ) {
      o.display();
      s.display();
    } else {
      o.display();
      s.display();
      g.display();
    }
    h.display();
    w.display();
    m.display();
  }
  void moveBar() {
    fill(80, 80, 255);
    rectMode(CORNERS);
    rect(0, height, 7 * width / 12, 4 * height / 5);
    rect(7 * width / 12, height, width, 4 * height / 5);
    fill(255);
    textSize(height / 30);
    text("Attack", 20, 4 * height/ 5 + 5 * height / 120);
    if (w.myTurn) {
      text("Cleave", 20, 4 * height/ 5 + 12 * height / 120);
    }
    else if (m.myTurn) {
      text("Fireball", 20, 4 * height/ 5 + 12 * height / 120);
    }
    else if (h.myTurn) {
      text("Heal", 20, 4 * height/ 5 + 12 * height / 120);
    }
    text("Run Away", 20, 4 * height/ 5 + 19 * height / 120);
    if (w.myTurn){
      fill(255,255,0);
    }
    else{
      fill(255);
    }
    text(w.name + "          " + (int)w.hp, 15 * width / 24, 4 * height/ 5 + 5 * height / 120);
    if (m.myTurn){
      fill(255,255,0);
    }
    else{
      fill(255);
    }
    text(m.name + "          " + (int)m.hp, 15 * width / 24, 4 * height/ 5 + 12 * height / 120);
    if (h.myTurn){
      fill(255,255,0);
    }
    else{
      fill(255);
    }
    text(h.name + "          " + (int)h.hp, 15 * width / 24, 4 * height/ 5 + 19 * height / 120);
  }
}
