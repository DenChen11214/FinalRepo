 //<>// //<>// //<>//
Map cave;
Battle scene;
float numBattles;
boolean inBattle = false;
float xOld, xNew, yOld, yNew, dis;
float stepsTaken;
boolean hasStepped;
void setup() {
  size(800, 600);
  cave = new Map();
  xOld = cave.px;
  yOld = cave.py;
  System.out.println(yOld);
  System.out.println(xOld);

}

void draw() {
  background(255);
  if (!inBattle) {
    cave.display();    
    xNew = cave.px;
    yNew = cave.py;
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
  if (hasStepped && (int)Math.random() * 13 == 0) {
    scene = new Battle();
    inBattle = true;
    hasStepped = false;
  }
  if (inBattle) {
    scene.moveBar();
    scene.display();
  }
}

void keyPressed() {
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