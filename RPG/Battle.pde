class Battle {
  Healer h;
  Mage m;
  Warrior w;
  Ogre o;
  Slime s;
  Goblin g;
  FinalBoss fBoss;
  MiniBoss mBoss;
  float numMonsters;
  boolean isAttacking = false;
  boolean isSpecial;
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
    w.setTurn(true);
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
  Battle(int mode) {
    if (mode == 0) {
      mBoss = new MiniBoss(1000, 120, width - width/4, height/2);
      h = new Healer();
      m = new Mage();
      w = new Warrior();
      h.display();
      m.display();
      w.display();
    }
    if (mode == 1) {
      fBoss = new FinalBoss(1500, 160, width - width/4, height/2);
      h = new Healer();
      m = new Mage();
      w = new Warrior();
      h.display();
      m.display();
      w.display();
    }
  }

  void display() {
    background(255);
    if ((g == null || g.hp <= 0) && (o == null || o.hp <= 0) && (s == null || s.hp <= 0)) {
      inBattle = false;
    }
    if (numMonsters ==1 ) {
      if (!g.dead()) {        
        g.display();
      }
    } else if (numMonsters ==2 ) {
      if (!o.dead()) {    
        o.display();
      }
      if (!s.dead()) {
        s.display();
      }
    } else {
      if (!o.dead()) {    
        o.display();
      }
      if (!s.dead()) {
        s.display();
      }
      if (!g.dead()) {
        g.display();
      }
    }
    h.display();
    w.display();
    m.display();
    moveBar();
    buttons();
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
    } else if (m.myTurn) {
      text("Fireball", 20, 4 * height/ 5 + 12 * height / 120);
    } else if (h.myTurn) {
      text("Heal", 20, 4 * height/ 5 + 12 * height / 120);
    }
    text("Run Away", 20, 4 * height/ 5 + 19 * height / 120);
    if (w.myTurn) {
      fill(255, 255, 0);
    } else {
      fill(255);
    }
    text(w.name + "          " + (int)w.hp, 15 * width / 24, 4 * height/ 5 + 5 * height / 120);
    if (m.myTurn) {
      fill(255, 255, 0);
    } else {
      fill(255);
    }
    text(m.name + "          " + (int)m.hp, 15 * width / 24, 4 * height/ 5 + 12 * height / 120);
    if (h.myTurn) {
      fill(255, 255, 0);
    } else {
      fill(255);
    }
    text(h.name + "          " + (int)h.hp, 15 * width / 24, 4 * height/ 5 + 19 * height / 120);
  }
  void buttons() { //makes it so that if attack is clicked, you can select a target and that target will lost hp, run away and the special moves don't work for now
    float textW = textWidth("Attack");
    float textWM = textWidth("Fireball");
    float textWR = textWidth("Run Away");
    float textH = textAscent() + textDescent();
    if ((mouseX > (20 - textW / 2))&& (mouseX < (20 + textW)) && mousePressed && (mouseY > 4 * height/ 5 + 5 * height / 120 - textH / 2) && (mouseY < 4 * height/ 5 + 5 * height / 120 + textH / 2)) {
      isAttacking = true;
    }
    if (isAttacking) {
      if (w.myTurn) {
        if (chooseTarget() != null) {
          w.attack(chooseTarget());
          isAttacking = false;
          w.setTurn(false);
          m.setTurn(true);
        }
      } else if (m.myTurn) {
        if (chooseTarget() != null) {
          m.attack(chooseTarget());
          isAttacking = false;
          m.setTurn(false);
          h.setTurn(true);
        }
      } else if (h.myTurn) {
        if (chooseTarget() != null) {
          h.attack(chooseTarget());
          isAttacking = false;
          h.setTurn(false);
          for (Monsters a : AOE()) {
            int target = (int)(Math.random() * 3) + 1;
            if (a != null) {
              if(target == 1 && !w.isDead){
                a.attack(w);
              }
              if(target == 2 && !m.isDead){
                a.attack(m);
              }
              if(target == 3 && !h.isDead){
                a.attack(h);
              }
            }
          }  
          w.setTurn(true);
        }
      }
      if ((mouseX > (20 - textWM / 2))&& (mouseX < (20 + textWM)) && mousePressed && (mouseY > 4 * height/ 5 + 12 * height / 120 - textH / 2) && (mouseY < 4 * height/ 5 + 12 * height / 120 + textH / 2)) {
        isSpecial = true;
      }
      if (isSpecial) {
        if (w.myTurn) {
          if (w.cooldown == 0) {
            if (chooseTarget() != null) {
              w.cleave(chooseTarget());
              isSpecial = false;
            }
          }
        }
        if (m.myTurn) {
          if (m.cooldown == 0) {
            m.fireball(AOE());
            isSpecial = false;
          }
        }
        if (h.myTurn) {
          if (h.cooldown == 0) {
            if (healTarget() != null) {
              h.heal(healTarget());
              isSpecial = false;
            }
          }
        }
      }
      if ((mouseX > (20 - textWR / 2))&& (mouseX < (20 + textWR)) && mousePressed && (mouseY > 4 * height/ 5 + 19 * height / 120 - textH / 2) && (mouseY < 4 * height/ 5 + 19 * height / 120 + textH / 2)) {
        inBattle = false;
      }
    }
  }
  Monsters chooseTarget() {
    if (g != null) {
      if (mouseX > g.x - 25 && mouseX < g.x + 25 && mouseY > g.y - 25 && mouseY < g.y + 25 && mousePressed) {
        return g;
      }
    }
    if (s != null) {
      if (mouseX > s.x - 25 && mouseX < s.x + 25 && mouseY > s.y - 25 && mouseY < s.y + 25 && mousePressed) {
        return s;
      }
    }
    if (o != null) {
      if (mouseX > o.x - 25 && mouseX < o.x + 25 && mouseY > o.y - 25 && mouseY < o.y + 25 && mousePressed) {
        return o;
      }
    }
    return null;
  }
  Monsters[] AOE() {
    Monsters[] mobs = new Monsters[3];
    if (g != null) {
      mobs[0] = g;
    }
    if (o != null) {
      mobs[1] = o;
    }
    if (s != null) {
      mobs[2] = s;
    }
    return mobs;
  }
  Classes healTarget() {
    if (mouseX > h.x - 25 && mouseX < h.x + 25 && mouseY > h.y - 25 && mouseY < h.y + 25 && mousePressed) {
      return h;
    }
    if (mouseX > m.x - 25 && mouseX < m.x + 25 && mouseY > m.y - 25 && mouseY < m.y + 25 && mousePressed) {
      return m;
    }
    if (mouseX > w.x - 25 && mouseX < w.x + 25 && mouseY > w.y - 25 && mouseY < w.y + 25 && mousePressed) {
      return w;
    }
    return null;
  }
}
