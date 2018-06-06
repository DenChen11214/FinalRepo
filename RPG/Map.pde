class Map {
  char[][] base;
  int px;
  int py;


  Map() {
    String[] lines = loadStrings("Room.txt");  
    int row = lines.length;
    int col = lines[0].length();
    int  i = 0;
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
          fill(80);
        } else {
          fill(0);
        }
        rect(50* i, 50*j, 50, 50);
      }
    }
    fill(255);
    rect(50*px, 50*py, 50, 50);

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