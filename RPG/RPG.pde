import java.util.*; //<>// //<>// //<>//
Map cave;
Battle scene;
float numBattles;
boolean inBattle = false;
float xOld, xNew, yOld, yNew, dis;
float stepsTaken;
boolean hasStepped;
boolean start;
boolean gameOver;
Healer h;
Mage m;
Warrior w;
void setup() {
  size(720, 690);
  cave = new Map();
  h = new Healer();
  m = new Mage();
  w = new Warrior();
  xOld = cave.px;
  yOld = cave.py;
  System.out.println(yOld);
  System.out.println(xOld);
  start = false;
  gameOver = false;
  background(0);
  textSize(32);
  textAlign(CENTER);
  rectMode(CENTER);
  text("BUDGETED BOOTLEGGED FINAL FANTASY", width / 2, height/4);
  fill(255);
  rect(width / 2, height / 2 - 10, 200, 100);
  fill(0);
  textSize(32);
  text("Start", width/2, height /2);
  textAlign(CORNER);
  rectMode(CORNER);
}

void draw() {
  if (gameOver) {
    delay(3000);
    background(0);
    fill(255);
    textSize(32);
    textAlign(CENTER);
    rectMode(CENTER);
    text("GAME OVER", width / 2, height / 3);
    rect(width / 2, 2 * height/3 - 10, 200, 100);
    fill(0);
    text("Play Again?", width/2, 2 *height / 3);
    fill(255);
  } else {
    if (start) {
      if (!inBattle) {
        cave.display();    
        xNew = cave.px;
        yNew = cave.py;
        if (xNew == cave.bx && yNew == cave.by) {
          scene = new Battle(0);
          inBattle = true;
          hasStepped = false;
        }
        if (xNew == cave.lx + 4  && yNew == cave.ly +4  && xNew == cave.lx - 4 && yNew == cave.ly - 4 && cave.end) {
          scene = new Battle(1);
          inBattle = true;
          hasStepped = false;
        }
        if (Math.pow(xNew - xOld, 2) + Math.pow(yNew - yOld, 2) >= 13) {
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
        if (numBattles == 0) {
          scene = new Battle(true);
        } else {
          scene = new Battle();
        }
        inBattle = true;
        hasStepped = false;
      }
      if (inBattle) {
        scene.moveBar();
        scene.display();
      }
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

void mouseClicked() {
  if (mouseX > width / 2 - 100 && mouseX < width / 2 + 100 && mouseY > height / 4 - 60 && mouseY < height / 2 + 40 && !start) {
    start = true;
  }
  if (gameOver && mouseX > width / 2 - 100 && mouseX < width / 2 + 100 && mouseY > 2 * height / 3 - 60 && mouseY < 2 * height / 3 + 40) {
    setup();
  }
}
