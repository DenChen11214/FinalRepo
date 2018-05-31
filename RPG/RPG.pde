Player p;
Battle scene;
float numBattles;
void setup() {
  size(900, 600);
  p = new Player();
}
void draw() {
  background(255);
  p.update();
  p.display();

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
void keyReleased() {
  if (keyCode == 'W' || keyCode == 'w') {
    p.keysPressed[0] = false;
  }
  if (keyCode == 'S' || keyCode == 's') {
    p.keysPressed[1] = false;
  }
  if (keyCode == 'A' || keyCode == 'a') {
    p.keysPressed[2] = false;
  }
  if (keyCode == 'D' || keyCode == 'd') {
    p.keysPressed[3] = false;
  }
}