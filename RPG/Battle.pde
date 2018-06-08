class Battle {
  Ogre o;
  Slime s;
  Goblin g;
  FinalBoss fBoss;
  MiniBoss mBoss;
  Classes[] heroes; 
  float numMonsters;
  boolean isAttacking = false;
  boolean isSpecial;
  boolean validHeal = true;
  Battle() {
    numMonsters = (int)(Math.random() * 3) + 1;
    heroes= new Classes[3];
    heroes[0] = w;
    heroes[1] = h;
    heroes[2] = m;
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
    h.setTurn(false);
    m.setTurn(false);
  }
  Battle(float monsters) {
    numMonsters = monsters;
    h.display();
    m.display();
    w.display();
    heroes= new Classes[3];
    heroes[0] = w;
    heroes[1] = h;
    heroes[2] = m;
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
    h.setTurn(false);
    m.setTurn(false);
  }
  Battle(int mode) {
    if (mode == 0) {
      mBoss = new MiniBoss(1000, 120, width - width/4, height/2);
      h.display();
      m.display();
      w.display();
      heroes= new Classes[3];
      heroes[0] = w;
      heroes[1] = h;
      heroes[2] = m;
    }
    if (mode == 1) {
      fBoss = new FinalBoss(1500, 160, width - width/4, height/2);
      h.display();
      m.display();
      w.display();
      heroes= new Classes[3];
      heroes[0] = w;
      heroes[1] = h;
      heroes[2] = m;
    }
    w.setTurn(true);
    h.setTurn(false);
    m.setTurn(false);
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
    if (!h.isDead) {
      h.display();
    }
    if (!w.isDead) {
      w.display();
    }
    if (!m.isDead) {
      m.display();
    }
    if (h.isDead && m.isDead && w.isDead) {
      inBattle = false;
    }
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
    if (w.myTurn && !w.isDead) {
      fill(255, 255, 0);
    } else {
      fill(255);
    }
    if (w.hp <= 0) {
      text(w.name + "          " + 0, 15 * width / 24, 4 * height/ 5 + 5 * height / 120);
    } else if (w.hp > 0) {
      text(w.name + "          " + (int)w.hp, 15 * width / 24, 4 * height/ 5 + 5 * height / 120);
    }
    if (m.myTurn && !m.isDead) {
      fill(255, 255, 0);
    } else {
      fill(255);
    }
    if (m.hp <= 0) {
      text(m.name + "          " + 0, 15 * width / 24, 4 * height/ 5 + 12 * height / 120);
    } else if (w.hp > 0) {
      text(m.name + "          " + (int)m.hp, 15 * width / 24, 4 * height/ 5 + 12 * height / 120);
    }
    if (h.myTurn && !h.isDead) {
      fill(255, 255, 0);
    } else {
      fill(255);
    }
    if (h.hp <= 0) {
      text(h.name + "          " + 0, 15 * width / 24, 4 * height/ 5 + 19 * height / 120);
    } else if (h.hp > 0) {
      text(h.name + "          " + (int)h.hp, 15 * width / 24, 4 * height/ 5 + 19 * height / 120);
    }
  }
  void buttons() {
    float textW = textWidth("Attack");
    float textWM = textWidth("Fireball");
    float textWR = textWidth("Run Away");
    float textH = textAscent() + textDescent();
    if (w.myTurn && !w.isDead) {
      if ((mouseX > (20))&& (mouseX < (20 + textW)) && mousePressed && (mouseY > 4 * height/ 5 + 5 * height / 120 - textH) && (mouseY < 4 * height/ 5 + 5 * height / 120)) {
        isAttacking = true;
      } else if ((mouseX > (20))&& (mouseX < (20 + textWM)) && mousePressed && (mouseY > 4 * height/ 5 + 12 * height / 120 - textH) && (mouseY < 4 * height/ 5 + 12 * height / 120)) {
        isSpecial = true;
      }
      if (isAttacking) {
        if (chooseTarget() != null) {
          w.attack(chooseTarget());
          isAttacking = false;
          w.setTurn(false);
          if (!m.isDead) {
            m.setTurn(true);
          } else if (!h.isDead) {
            h.setTurn(true);
          } else {
            for (Monsters a : AOE()) {
              if (a != null) {
                boolean lowHp = false;
                int target = (int)(Math.random() * 3);
                for (int i = 0; i< 3; i++) { 
                  if (a.atk > heroes[i].hp && !heroes[i].isDead) {
                    target = i;
                    lowHp = true;
                  }
                }
                if (lowHp) {
                  a.attack(heroes[target]);
                } else {
                  while (heroes[target].hp <= 0) {
                    target = (int)(Math.random() * 3);
                  }
                  a.attack(heroes[target]);
                }
              }
            }
            w.dead();
            m.dead();
            h.dead();
            w.setTurn(true);
          }
        }
      } else if (isSpecial) {
        if (w.cooldown == 0) {
          if (chooseTarget() != null) {
            w.cleave(chooseTarget());
            isSpecial = false;
            w.setTurn(false);
            if (!m.isDead) {
              m.setTurn(true);
            } else if (!h.isDead) {
              h.setTurn(true);
            } else {
              for (Monsters a : AOE()) {
                if (a != null) {
                  boolean lowHp = false;
                  int target = (int)(Math.random() * 3);
                  for (int i = 0; i< 3; i++) { 
                    if (a.atk > heroes[i].hp && !heroes[i].isDead) {
                      target = i;
                      lowHp = true;
                    }
                  }
                  if (lowHp) {
                    a.attack(heroes[target]);
                  } else {
                    while (heroes[target].hp <= 0) {
                      target = (int)(Math.random() * 3);
                    }
                    a.attack(heroes[target]);
                  }
                }
              }
              w.dead();
              m.dead();
              h.dead();
              w.setTurn(true);
            }
          }
        }
      }
    } else if (m.myTurn && !m.isDead) {
      if ((mouseX > (20))&& (mouseX < (20 + textW)) && mousePressed && (mouseY > 4 * height/ 5 + 5 * height / 120 - textH) && (mouseY < 4 * height/ 5 + 5 * height / 120)) {
        isAttacking = true;
      } else if ((mouseX > (20))&& (mouseX < (20 + textWM)) && mousePressed && (mouseY > 4 * height/ 5 + 12 * height / 120 - textH) && (mouseY < 4 * height/ 5 + 12 * height / 120)) {
        isSpecial = true;
      }
      if (isAttacking) {
        if (chooseTarget() != null) {
          m.attack(chooseTarget());
          isAttacking = false;
          m.setTurn(false);
          if (h.isDead) {
            for (Monsters a : AOE()) {
              if (a != null) {
                boolean lowHp = false;
                int target = (int)(Math.random() * 3);
                for (int i = 0; i< 3; i++) { 
                  if (a.atk > heroes[i].hp && !heroes[i].isDead) {
                    target = i;
                    lowHp = true;
                  }
                }
                if (lowHp) {
                  a.attack(heroes[target]);
                } else {
                  while (heroes[target].hp <= 0) {
                    target = (int)(Math.random() * 3);
                  }
                  a.attack(heroes[target]);
                }
              }
            }
            w.dead();
            m.dead();
            h.dead();
          }
          if (!h.isDead) {
            h.setTurn(true);
          } else if (!w.isDead) {
            w.setTurn(true);
          } else {
            m.setTurn(true);
          }
        }
      } else if (isSpecial) {
        if (m.cooldown == 0) {
          m.fireball(AOE());
          isSpecial = false;
          m.setTurn(false);
          if (h.isDead) {
            for (Monsters a : AOE()) {
              if (a != null) {
                boolean lowHp = false;
                int target = (int)(Math.random() * 3);
                for (int i = 0; i< 3; i++) { 
                  if (a.atk > heroes[i].hp && !heroes[i].isDead) {
                    target = i;
                    lowHp = true;
                  }
                }
                if (lowHp) {
                  a.attack(heroes[target]);
                } else {
                  while (heroes[target].hp <= 0) {
                    target = (int)(Math.random() * 3);
                  }
                  a.attack(heroes[target]);
                }
              }
            }
            w.dead();
            m.dead();
            h.dead();
          } else if (!h.isDead) {
            h.setTurn(true);
          } else if (!w.isDead) {
            w.setTurn(true);
          } else {
            m.setTurn(true);
          }
        }
      }
    } else if (h.myTurn && !h.isDead) {
      if ((mouseX > (20))&& (mouseX < (20 + textW)) && mousePressed && (mouseY > 4 * height/ 5 + 5 * height / 120 - textH) && (mouseY < 4 * height/ 5 + 5 * height / 120)) {
        isAttacking = true;
      } else if ((mouseX > (20))&& (mouseX < (20 + textWM)) && mousePressed && (mouseY > 4 * height/ 5 + 12 * height / 120 - textH) && (mouseY < 4 * height/ 5 + 12 * height / 120)) {
        isSpecial = true;
      }
      if (isAttacking) {
        if (chooseTarget() != null) {
          h.attack(chooseTarget());
          isAttacking = false;
          h.setTurn(false);
          for (Monsters a : AOE()) {
            if (a != null) {
              boolean lowHp = false;
              int target = (int)(Math.random() * 3);
              for (int i = 0; i< 3; i++) { 
                if (a.atk > heroes[i].hp && !heroes[i].isDead) {
                  target = i;
                  lowHp = true;
                }
              }
              if (lowHp) {
                a.attack(heroes[target]);
              } else {
                while (heroes[target].hp <= 0) {
                  target = (int)(Math.random() * 3);
                }
                a.attack(heroes[target]);
              }
            }
          }
          w.dead();
          m.dead();
          h.dead();
          if (!w.isDead) {
            w.setTurn(true);
          } else if (!m.isDead) {
            m.setTurn(true);
          } else {
            h.setTurn(true);
          }
        }
      } else if (isSpecial) {
        if (h.cooldown == 0) {
          if (healTarget() != null) {
            h.heal(healTarget());
            isSpecial = false;
            if (validHeal) {
              h.setTurn(false);
              for (Monsters a : AOE()) {
                if (a != null) {
                  boolean lowHp = false;
                  int target = (int)(Math.random() * 3);
                  for (int i = 0; i< 3; i++) { 
                    if (a.atk > heroes[i].hp && !heroes[i].isDead) {
                      target = i;
                      lowHp = true;
                    }
                  }
                  if (lowHp) {
                    a.attack(heroes[target]);
                  } else {
                    while (heroes[target].hp <= 0) {
                      target = (int)(Math.random() * 3);
                    }
                    a.attack(heroes[target]);
                  }
                }
              }
              w.dead();
              m.dead();
              h.dead();
              if (!w.isDead) {
                w.setTurn(true);
              } else if (!m.isDead) {
                m.setTurn(true);
              } else {
                h.setTurn(true);
              }
            }
          }
        }
      }
    }
    if ((mouseX > (20))&& (mouseX < (20 + textWR)) && mousePressed && (mouseY > 4 * height/ 5 + 19 * height / 120 - textH) && (mouseY < 4 * height/ 5 + 19 * height / 120)) {
      inBattle = false;
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
      if (h.hp == h.maxHp) {
        validHeal = false;
      }
      else{
        validHeal = true;
      }
      return h;
    }
    else if (mouseX > m.x - 25 && mouseX < m.x + 25 && mouseY > m.y - 25 && mouseY < m.y + 25 && mousePressed) {
      if (m.hp == m.maxHp) {
        validHeal = false;
      }
      else{
        validHeal = true;
      }
      return m;
    }
    else if (mouseX > w.x - 25 && mouseX < w.x + 25 && mouseY > w.y - 25 && mouseY < w.y + 25 && mousePressed) {
      if (w.hp == w.maxHp) {
        validHeal = false;
      }
      else{
        validHeal = true;
      }
      return w;
    }
    return null;
  }
}