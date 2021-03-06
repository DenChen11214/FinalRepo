import java.util.*;
class Battle {
  Ogre o;
  Slime s;
  Goblin g;
  FinalBoss fBoss;
  MiniBoss mBoss;
  Classes[] heroes; 
  PImage background;
  float numMonsters;
  boolean isAttacking = false;
  boolean isSpecial;
  boolean isBossFight;
  LinkedList<Classes> turnSystem = new LinkedList();
  boolean runAwayClicked = false;
  float textWR, textH, textW,textWM;
  Battle() {
    background = loadImage("battleground.png");
    background.resize(720, 720);
    isBossFight = false;
    numMonsters = (int)(Math.random() * 3) + 1;
    heroes= new Classes[3];
    heroes[0] = w;
    heroes[1] = h;
    heroes[2] = m;
    if (numMonsters ==1 ) {
      g = new Goblin(350, 30, width - 3 * width/4, height/2);
    } else if (numMonsters ==2 ) {
      s = new Slime(400, 50, width - 3 * width/4, height/ 3 + 50);
      o = new Ogre(500, 40, width - 3 * width/4, 2 * height/3);
    } else {
      g = new Goblin(350, 30, width - 3 * width/4, height/4 + 50);
      s = new Slime(400, 50, width - 3 * width/4, height/2 - 5);
      o = new Ogre(500, 40, width - 3 * width/4, height/2 + 115);
    }
    w.setTurn(true);
    h.setTurn(false);
    m.setTurn(false);
    turnSystem.add(w);
    turnSystem.add(m);
    turnSystem.add(h);
  }
  Battle(boolean firstBattle) {
    background = loadImage("battleground.png");
    background.resize(720, 720);
    isBossFight = false;
    h.display();
    m.display();
    w.display();
    heroes= new Classes[3];
    heroes[0] = w;
    heroes[1] = h;
    heroes[2] = m;
    numMonsters = 1;
    g = new Goblin(350, 30, width - 3* width/4, height/2);
    w.setTurn(true);
    h.setTurn(false);
    m.setTurn(false);
    turnSystem.add(w);
    turnSystem.add(m);
    turnSystem.add(h);
  }
  Battle(int mode) {
    background = loadImage("battleground.png");
    background.resize(720, 720);
    isBossFight = true;
    if (mode == 0) {
      mBoss = new MiniBoss(750, 80, width - 3 * width/4, height/2- 100);
      h.display();
      m.display();
      w.display();
      heroes= new Classes[3];
      heroes[0] = w;
      heroes[1] = h;
      heroes[2] = m;
    }
    if (mode == 1) {
      fBoss = new FinalBoss(1000, 120, width - 3 * width/4, height/2-150);
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
    turnSystem.add(w);
    turnSystem.add(m);
    turnSystem.add(h);
  }

  void display() {
    image(background, 0, 0);
    if (isBossFight) {
      if (mBoss != null) {
        if (mBoss.hp <= 0) {
          inBattle = false;
          cave.bx = -1;
          cave.by = -1;
        } else {
          mBoss.display();
        }
      }
      if (fBoss != null) {
        if (fBoss.hp <= 0) {
          inBattle = false;
          cave.lx = -1;
          cave.ly = -1;
        } else {
          fBoss.display();
        }
      }
    } else {
      if ((g == null || g.hp <= 0) && (o == null || o.hp <= 0) && (s == null || s.hp <= 0)) {
        inBattle = false;
        if (h.hp + 50 > h.maxHp) {
          float hp = h.maxHp - h.hp;
          h.hp += hp;
        } else {
          h.hp += 50;
        }
        if (w.hp + 50 > w.maxHp) {
          float hp = w.maxHp - w.hp;
          w.hp += hp;
        } else {
          w.hp += 50;
        }
        if (m.hp + 50 > m.maxHp) {
          float hp = m.maxHp - m.hp;
          m.hp += hp;
        } else {
          m.hp += 50;
        }
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
      gameOver = true;
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
    textAlign(CORNERS);
    if(isAttacking){
      fill(255,255,0);
    }
    text("Attack", 20, 4 * height/ 5 + 5 * height / 120);
    fill(255);
    if (w.myTurn) {
      if(isSpecial){
        fill(255,255,0);
      }
      text("Cleave" + "    Cooldown: " + (int)w.cooldown, 20, 4 * height/ 5 + 12 * height / 120);
      fill(255);
    } else if (m.myTurn) {
      if(isSpecial){
        fill(255,255,0);
      }
      text("Fireball" + "    Cooldown: " + (int)m.cooldown, 20, 4 * height/ 5 + 12 * height / 120);
      fill(255);
    } else if (h.myTurn) {
      if(isSpecial){
        fill(255,255,0);
      }
      text("Heal" + "    Cooldown: " + (int)h.cooldown, 20, 4 * height/ 5 + 12 * height / 120);
      fill(255);
    }
    text("Run Away", 20, 4 * height/ 5 + 19 * height / 120);
    if (w.myTurn && !w.isDead) {
      fill(255, 255, 0);
    } else {
      fill(255);
    }
    if (w.hp <= 0) {
      text(w.name, 15 * width / 24, 4 * height/ 5 + 5 * height / 120);
      text(0, width - width/ 6, 4 * height/ 5 + 5 * height / 120);
    } else if (w.hp > 0) {
      text(w.name, 15 * width / 24, 4 * height/ 5 + 5 * height / 120);
      text((int)w.hp, width - width/ 6, 4 * height/ 5 + 5 * height / 120);
    }
    if (m.myTurn && !m.isDead) {
      fill(255, 255, 0);
    } else {
      fill(255);
    }
    if (m.hp <= 0) {
      text(m.name, 15 * width / 24, 4 * height/ 5 + 12 * height / 120);
      text(0, width - width/ 6, 4 * height/ 5 + 12 * height / 120);
    } else if (w.hp > 0) {
      text(m.name, 15 * width / 24, 4 * height/ 5 + 12 * height / 120);
      text((int)m.hp, width - width/ 6, 4 * height/ 5 + 12 * height / 120);
    }
    if (h.myTurn && !h.isDead) {
      fill(255, 255, 0);
    } else {
      fill(255);
    }
    if (h.hp <= 0) {
      text(h.name, 15 * width / 24, 4 * height/ 5 + 19 * height / 120);
      text(0, width - width/ 6, 4 * height/ 5 + 19 * height / 120);
    } else if (h.hp > 0) {
      text(h.name, 15 * width / 24, 4 * height/ 5 + 19 * height / 120);
      text((int)h.hp, width - width/ 6, 4 * height/ 5 + 19 * height / 120);
    }
  }
  void buttons() {
    textW = textWidth("Attack");
    textWM = textWidth("Fireball");
    textWR = textWidth("Run Away");
    textH = textAscent() + textDescent();
    if (w.myTurn) {
      if (w.isDead) {
        turnSystem.getFirst().setTurn(false);
        turnSystem.addLast(turnSystem.removeFirst());
        turnSystem.getFirst().setTurn(true);
      } else {
        if (isAttacking) {
          if (chooseTarget() != null) {
            w.attack(chooseTarget());
            isAttacking = false;
            turnSystem.getFirst().setTurn(false);
            turnSystem.addLast(turnSystem.removeFirst());
            turnSystem.getFirst().setTurn(true);
          }
        } else if (isSpecial) {
          if (w.cooldown == 0) {
            if (chooseTarget() != null) {
              w.cleave(chooseTarget());
              isSpecial = false;
              turnSystem.getFirst().setTurn(false);
              turnSystem.addLast(turnSystem.removeFirst());
              turnSystem.getFirst().setTurn(true);
            }
          }
        }
      }
    } else if (m.myTurn) {
      if (m.isDead) {
        turnSystem.getFirst().setTurn(false);
        turnSystem.addLast(turnSystem.removeFirst());
        turnSystem.getFirst().setTurn(true);
      } else {
        if (isAttacking) {
          if (chooseTarget() != null) {
            m.attack(chooseTarget());
            isAttacking = false;
            turnSystem.getFirst().setTurn(false);
            turnSystem.addLast(turnSystem.removeFirst());
            turnSystem.getFirst().setTurn(true);
          }
        } else if (isSpecial) {
          if (m.cooldown == 0) {
            m.fireball(AOE());
            isSpecial = false;
            turnSystem.getFirst().setTurn(false);
            turnSystem.addLast(turnSystem.removeFirst());
            turnSystem.getFirst().setTurn(true);
          }
        }
      }
    } else if (h.myTurn) {
      if (h.isDead) {
        turnSystem.getFirst().setTurn(false);
        turnSystem.addLast(turnSystem.removeFirst());
        turnSystem.getFirst().setTurn(true);
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
        h.dead();
        m.dead();
      } else {
        if (isAttacking) {
          if (chooseTarget() != null) {
            h.attack(chooseTarget());
            isAttacking = false;
            turnSystem.getFirst().setTurn(false);
            turnSystem.addLast(turnSystem.removeFirst());
            turnSystem.getFirst().setTurn(true);
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
          }
          w.dead();
          h.dead();
          m.dead();
        } else if (isSpecial) {
          if (h.cooldown == 0) {
            if (healTarget() != null) {
            }
            if (healTarget()!= null && healTarget().hp != healTarget().maxHp) {
              h.heal(healTarget());
              isSpecial = false;
              turnSystem.getFirst().setTurn(false);
              turnSystem.addLast(turnSystem.removeFirst());
              turnSystem.getFirst().setTurn(true);
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
              h.dead();
              m.dead();
            }
          }
        }
      }
    }
  }


  Monsters chooseTarget() {
    if (g != null) {
      if (mouseX > g.x && mouseX < g.x + 75 && mouseY > g.y && mouseY < g.y + 75 && mousePressed) {
        return g;
      }
    }
    if (s != null) {
      if (mouseX > s.x && mouseX < s.x + 75 && mouseY > s.y && mouseY < s.y + 75 && mousePressed) {
        return s;
      }
    }
    if (o != null) {
      if (mouseX > o.x && mouseX < o.x + 75 && mouseY > o.y && mouseY < o.y + 75 && mousePressed) {
        return o;
      }
    }
    if (mBoss != null) {
      if (mouseX > mBoss.x && mouseX < mBoss.x + 150 && mouseY > mBoss.y && mouseY < mBoss.y + 150 && mousePressed) {
        return mBoss;
      }
    }
    if (fBoss != null) {
      if (mouseX > fBoss.x - 25 && mouseX < fBoss.x + 200 && mouseY > fBoss.y -25 && mouseY < fBoss.y + 200 && mousePressed) {
        return fBoss;
      }
    }
    return null;
  }
  Monsters[] AOE() {
    Monsters[] mobs = new Monsters[5];
    if (g != null && g.hp > 0) {
      mobs[0] = g;
    }
    if (o != null && o.hp > 0) {
      mobs[1] = o;
    }
    if (s != null && s.hp > 0) {
      mobs[2] = s;
    }
    if (mBoss != null && mBoss.hp > 0) {
      mobs[3] = mBoss;
    }
    if (fBoss != null && fBoss.hp > 0) {
      mobs[4] = fBoss;
    }
    return mobs;
  }
  Classes healTarget() {
    if (mouseX > h.x && mouseX < h.x + 75 && mouseY > h.y && mouseY < h.y + 75 && mousePressed) {
      if (h.hp > 0) {
        return h;
      }
    } else if (mouseX > m.x && mouseX < m.x + 75 && mouseY > m.y && mouseY < m.y + 75 && mousePressed) {
      if (m.hp > 0) {
        return m;
      }
    } else if (mouseX > w.x && mouseX < w.x + 75 && mouseY > w.y && mouseY < w.y + 75 && mousePressed) {
      if (w.hp > 0) {
        return w;
      }
    }
    return null;
  }
}
