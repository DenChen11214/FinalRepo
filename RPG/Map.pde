class Map {
  char[][] base;
  char[][] last;
  int px;
  int py;
  int bx;
  int by;
  int lx;
  int ly;
  PImage walls, floor, stairs, u, boss, drag;
  boolean end;
  Map() {
    lx = 10;
    ly = 2;
    String[] lines = loadStrings("Room.txt");  
    int row = lines.length;
    int col = lines[0].length();
    int  i = 0;
    String[] l = loadStrings("BossRoom.txt");
    u = loadImage("kain_sprite.png");
    u.resize(30, 30);
    walls = loadImage("stone4_b.jpg");
    walls.resize(30, 30);
    floor = loadImage("dirt.jpg");
    floor.resize(30, 30);
    stairs = loadImage("stairs.jpg");
    stairs.resize(30, 30);
    boss = loadImage("boss.jpg");
    boss.resize(30, 30);
    drag = loadImage("bahamut.jpg");
    drag.resize(120, 120);
    base = new char[row][col];
    last = new char[row][col];
    for (int r = 0; r < row; r++) {
      for (int c = 0; c < col; c++) {
        base[r][c] = lines[r].charAt(i);
        last[r][c] = l[r].charAt(i);
        if (base[r][c] == 'X') {
          px = r;
          py = c;
        }
        if (base[r][c] =='O') {
          bx = r;
          by = c;
        }
        i++;
      }
      i = 0;
    }
  }

  String toString() {
    String res = "";
    for (int i = 0; i< last.length; i++) {
      for (int j = 0; j< last[1].length; j++) {
        res += last[i][j] + " ";
      }
      res += " \n";
    }
    return res;
  }


  void display() {
    //rectMode(CENTER);
    if (!end) {
      for (int i = 0; i < base.length; i++) {
        for (int j = 0; j< base[1].length; j++) {
          if (base[i][j] == '#') {
            image(walls, 30*i, 30*j);
          } else if (base[i][j] == 'E') {
            image(stairs, 30*i, 30*j);
          } else {
            image(floor, 30*i, 30*j);
          }
        }
      }
      if (bx > 0 && by > 0 ) {
        image(boss, 30*bx, 30*by);
      }
      if (base[px][py] == 'E') {
        end = true;
      }
    }
    if(end){
      for (int i = 0; i<last.length; i++) {
        for (int j = 0; j< last[1].length; j++) {
          if (last[i][j] == '#') {
            image(walls, 30*i, 30*j);
          } else {
            image(floor, 30*i, 30*j);
            image(drag, 30*lx, 30*ly);
          }
        }
      }
    }
    image(u, 30*px, 30*py);
  }

  void update(int x, int y) {
    if (isValid(x, y)) {
      px += x;
      py += y;
    }
  }

  boolean isValid(int x, int y) {
    if (!end) {
      if (base[px+x][py+y] == '#') {
        return false;
      } else {
        return true;
      }
    } else {
      if (last[px+x][py+y] == '#') {
        return false;
      } else {
        return true;
      }
    }
  }
}
