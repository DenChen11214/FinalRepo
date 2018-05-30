class Player {
  float x, y;
  float xspeed, yspeed;
  boolean[] keysPressed = new boolean[4];
  Player() {
    x = width/2;
    y = height/2;
    xspeed = 5;
    yspeed=5;
    for (int i = 0; i < 4; i++) {
      keysPressed[i] = false;
    }
  }
  void display() {
    ellipse(x, y, 50, 50);
  }
  void update() {
    if (p.keysPressed[0]) {
      p.y-= p.yspeed;
    }
    if (p.keysPressed[1]) {
      p.y+= p.yspeed;
    }
    if (p.keysPressed[2]) {
      p.x-= p.xspeed;
    }
    if (p.keysPressed[3]) {
      p.x+= p.xspeed;
    }
  }
}
