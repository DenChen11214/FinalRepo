//<>// //<>//
Map cave;
Battle scene;
float numBattles;
boolean inBattle = false;
float xOld, xNew, yOld, yNew, dis;
float stepsTaken;
boolean hasStepped;
boolean start;
Healer h;
Mage m;
Warrior w;
void setup() {
  size(720, 720);
  cave = new Map();
  h = new Healer();
  m = new Mage();
  w = new Warrior();
  xOld = cave.px;
  yOld = cave.py;
  System.out.println(yOld);
  System.out.println(xOld);
  start = false;
  background(0);
  textSize(32);
  text("BUDGETED BOOTLEGGED FINAL FANTASY", 50, height/2-100);
  fill(255);
  rect(250,height / 2,200,70);
  fill(0);
  textSize(32);
  text("Start",width/2-45,height/2 + 50);
  
}

void draw() {
  if (start) {
    if (!inBattle) {
      cave.display();    
      xNew = cave.px;
      yNew = cave.py;
      if (xNew == cave.bx && yNew == cave.by) {
        scene = new Battle(1);
        inBattle = true;
        hasStepped = false;
      }
      if (Math.pow(xNew - xOld, 2) + Math.pow(yNew - yOld, 2) >= 13) {//2nd part of inequality is bound to change when I figure out the size of the player sprite
        stepsTaken++;
        hasStepped = true;
        xOld = xNew;
        yOld = yNew;
      }
    } else if (inBattle) {
      scene.moveBar();
      scene.display();
    }
    if (hasStepped && (int)(Math.random() * 100) == 0) {
      scene = new Battle();
      inBattle = true;
      hasStepped = false;
    }
    if (inBattle) {
      scene.moveBar();
      scene.display();
    }
  }
}

void keyPressed() {
  if (!inBattle) {
    if (keyCode == 'W' || keyCode == 'w') {
      cave.update(0, -1);
    }
    if (keyCode == 'S' || keyCode == 's') {
      cave.update(0, 1);
    }
    if (keyCode == 'A' || keyCode == 'a') {
      cave.update(-1, 0);
    }
    if (keyCode == 'D' || keyCode == 'd') {
      cave.update(1, 0);
    }
  }
}
