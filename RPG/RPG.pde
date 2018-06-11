import java.util.*; //<>// //<>// //<>// //<>// //<>//
Map cave;
Battle scene;
float numBattles;
boolean inBattle = false;
float xOld, xNew, yOld, yNew, dis;
float stepsTaken;
boolean hasStepped;
boolean start;
boolean gameOver;
boolean howToPlay;
boolean won;
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
  won = false;
  System.out.println(yOld);
  System.out.println(xOld);
  start = false;
  gameOver = false;
  howToPlay = false;
  background(0);
  textSize(32);
  textAlign(CENTER);
  rectMode(CENTER);
  fill(255);
  text("BUDGETED BOOTLEGGED FINAL FANTASY", width / 2, height/4);
  fill(255);
  rect(width / 2, height / 2 - 10, 200, 100);
  rect(width / 2, 3 * height / 4 - 10, 200 ,100);
  fill(0);
  textSize(32);
  text("Start", width/2, height /2);
  text("How to Play", width / 2, 3 * height / 4);
  textAlign(CORNER);
  rectMode(CORNER);
}

void draw() {
  if (cave.lx < 0 && cave.ly < 0){
    start = false;
    background(0);
    fill(255);
    textSize(32);
    textAlign(CENTER);
    rectMode(CENTER);
    text("Game Cleared!!", width / 2, height / 3);
  }
  if (gameOver) {
    delay(3000);
    background(0);
    fill(255);
    textSize(32);
    textAlign(CENTER);
    rectMode(CENTER);
    text("The Party Has Fallen", width / 2, height / 3);
    rect(width / 2, 2 * height/3 - 10, 200, 100);
    fill(0);
    text("Try Again?", width/2, 2 *height / 3);
    fill(255);
  } else {
    if (howToPlay){
      textAlign(CENTER);
      background(0);
      fill(255);
      text("Goal: Make it through the maze \n and fight the miniboss and finalboss \n in order to escape \n \n How to Play \n WASD keys to move \n Attack and Cleave need you \n to target a monster \n Fireball hits all enemies \n Heal needs you to target a party member \n Run Away has a 1/3 chance of working",width / 2, 40);
      rectMode(CENTER);
      rect(width/ 2, height - 50, 200, 100);
      fill(0);
      text("Go Back", width / 2, height  - 40);
  }
    if (start) {
      if (!inBattle) {
        cave.display();    
        xNew = cave.px;
        yNew = cave.py;
        if (xNew == cave.bx && yNew == cave.by && !cave.end) {
          scene = new Battle(0);
          inBattle = true;
          hasStepped = false;
        }
        if(xNew - cave.lx<=  4 && yNew - cave.ly <= 4 && cave.end){
          scene = new Battle(1);
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
      if (hasStepped && (int)(Math.random() * 50) == 0) {
        if (numBattles == 0) {
          scene = new Battle(true);
          numBattles++;
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
  if (mouseX > width / 2 - 100 && mouseX < width / 2 + 100 && mouseY > 3 * height / 4 - 60 && mouseY < 3 * height / 4 + 40) {
    howToPlay = true;
  }
  if(mouseX > width / 2 - 100 && mouseX < width / 2 + 100 && mouseY > height - 100 && mouseY < height && howToPlay){
    howToPlay = false;
    setup();
    
  }
  if (gameOver && mouseX > width / 2 - 100 && mouseX < width / 2 + 100 && mouseY > 2 * height / 3 - 60 && mouseY < 2 * height / 3 + 40) {
    setup();
  }
  if (inBattle) {
    if ((mouseX > (20))&& (mouseX < (20 + scene.textW)) && (mouseY > 4 * height/ 5 + 5 * height / 120 - scene.textH) && (mouseY < 4 * height/ 5 + 5 * height / 120)) {
      scene.isAttacking = true;
      scene.isSpecial = false;
      System.out.println("HI");
    } else if ((mouseX > (20))&& (mouseX < (20 + scene.textWM)) && (mouseY > 4 * height/ 5 + 12 * height / 120 - scene.textH) && (mouseY < 4 * height/ 5 + 12 * height / 120)) {
      scene.isSpecial = true;
      scene.isAttacking = false;
    }
    
    if ((mouseX > (20))&& (mouseX < (20 + scene.textWR)) && (mouseY > 4 * height/ 5 + 19 * height / 120 - scene.textH) && (mouseY < 4 * height/ 5 + 19 * height / 120)) {
      scene.isSpecial =false;
      scene.isAttacking =false;
      if ((int)(Math.random() * 3) == 1) {
        inBattle = false;
      } else {
        scene.turnSystem.getFirst().setTurn(false);
        scene.turnSystem.addLast(scene.turnSystem.removeFirst());
        scene.turnSystem.getFirst().setTurn(true);
      }
    }
  }
}
