class Map {
  char[][] base;
  int px;
  int py;
  PImage walls,floor,stairs;
  
  Map() {
    String[] lines = loadStrings("Room.txt");  
    int row = lines.length;
    int col = lines[0].length();
    int  i = 0;
    walls = loadImage("stone4_b.jpg");
    walls.resize(30,30);
    floor = loadImage("dirt.jpg");
    floor.resize(30,30);
    stairs = loadImage("stairs.jpg");
    stairs.resize(30,30);
    base = new char[row][col];
    for (int r = 0; r < row; r++) {
      for (int c = 0; c < col; c++) {
        base[r][c] = lines[r].charAt(i);
        if (base[r][c] == 'X') {
          px = r;
          py = c;
        }
        i++;
      }
      i = 0;
    }
  }

  String toString() {
    String res = "";
    for (int i = 0; i< base.length; i++) {
      for (int j = 0; j< base[1].length; j++) {
        res += base[i][j] + " ";
      }
    }
    return res;
  }


  void display() {
    //rectMode(CENTER);
    for (int i = 0; i < base.length; i++) {
      for (int j = 0; j< base[1].length; j++) {
        if (base[i][j] == '#') {
          image(walls,30*i,30*j);
        } 
        else if(base[i][j] == 'E'){
          image(stairs,30*i,30*j);
        }
          else {
          image(floor,30*i,30*j);
        }
      }
    }
    fill(255);
    rect(30*px, 30*py, 30, 30);

  }

  void update(int x, int y) {
    if (isValid(x, y)) {
      px += x;
      py += y;
    }
  }

  boolean isValid(int x, int y) {
    if (base[px+x][py+y] == '#') {
      return false;
    } else {
      return true;
    }
  }
}
