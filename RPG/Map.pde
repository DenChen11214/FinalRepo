import java.io.*;
import java.util.*;
class Map {
  char[][] base;
  int rows;
  int cols;

  Map() {
    String[] lines = loadStrings("Room.txt");  
    int row = lines.length;
    int col = lines[0].length();
    int  i = 0;
    base = new char[row][col];
    for (int r = 0; r < row; r++) {
      for (int c = 0; c < col; c++) {

        base[r][c] = lines[r].charAt(i);
        i++;
      }
      i = 0;
    }
  }

  String toString() {
    String res = "";
    for (int i = 0; i< base.length; i++) {
      for (int j = 0; j<base[1].length; j++) {
        res += base[i][j] + " ";
      }
    }
    return res;
  }


  void display() {
    for (int i = 0; i < base.length; i++) {
      for (int j = 0; j< base[1].length; j++) {
        if (base[i][j] == '#') {
          fill(255);
        } else {
          fill(0);
        }
        rect(25*i, 25*j, 25, 25);
      }
    }
    textSize(20);
    text(base.toString(), 10, 10);
  }
}