import java.util.Map;
Player p;
Healer h;
Mage m;
Warrior w;
Ogre o;
Slime s;
Goblin g;
Map cave;

void setup() {
  size(900, 600);
  p = new Player();
  o = new Ogre(500,40,width - (width/4.0), height / 4.0);
  s = new Slime(500,40,width - (width/4.0), height / 2.0);
  g = new Goblin(500,40,width - (width/4.0), 3 * height / 4.0);
  h = new Healer();
  m = new Mage();
  w = new Warrior();
  cave = new Map("Room.txt");
 
}
void draw() {
  cave.display();
  p.update();
  p.display();
  h.display();
  m.display();
  w.display();
  o.display();
  s.display();
  g.display();
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