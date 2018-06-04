import java.util.Map;
Player p;
Map cave;
Battle scene;
float numBattles;
boolean inBattle = false;
float xOld, xNew, yOld, yNew;
float stepsTaken;
boolean hasStepped;
void setup() {
  size(800, 600);
  p = new Player();
  scene = new Battle();
  xOld = p.x;
  yOld = p.y;
  cave = new Map();
}

void draw() {
  background(255);
  cave.display();
  if (!inBattle) {
    p.update();
    p.display();
    xNew = p.x;
    yNew = p.y;
    if (Math.pow(xNew - xOld, 2) + Math.pow(yNew - yOld, 2) >= (Math.pow(height, 2) + Math.pow(width, 2)) / 20) {//2nd part of inequality is bound to change when I figure out the size of the player sprite
      stepsTaken++;
      hasStepped = true;
    }
  }
  if (hasStepped && (int)Math.random() * 13 == 0) {
    inBattle = true;
    hasStepped = false;
  }
  if (scene.runAway && inBattle) {
    inBattle = false;
  }
  if (inBattle) {
    scene.moveBar();
    scene.display();
  }
  //<>//
}
void keyPressed() {
  if (keyCode == 'W' || keyCode == 'w') {
    p.keysPressed[0] = true;
  }
  if (keyCode == 'S' || keyCode == 's') {
    p.keysPressed[1] = true;
  }
  if (keyCode == 'A' || keyCode == 'a') {
    p.keysPressed[2] = true;
  }
  if (keyCode == 'D' || keyCode == 'd') {
    p.keysPressed[3] = true;
  }
}