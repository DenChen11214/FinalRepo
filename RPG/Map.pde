import java.io.*;
import java.util.*;
class Map {
  char[][] base;
  float x;
  float y;
  boolean[] keysPressed = new boolean[4];

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
          x = r;
          y = c;
        }
        i++;
      }
      i = 0;
    }
    for (int j = 0; j < 4; i++) {
      keysPressed[j] = false;
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
    rectMode(CENTER);
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
    ellipse(50*x, 50*y, 50, 50);
  }
/*
  void update() {
    if (cave.keysPressed[0]) {
      y -= 1;
    }
    if (cave.keysPressed[1]) {
      y += 1;
    }
    if (cave.keysPressed[2]) {
      x -= 1;
    }
    if (cave.keysPressed[3]) {
      x += 1;
    }
    
  }
  */
}
