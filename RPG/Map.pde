import java.io.*;
import java.util.*;
class Map {
  char[][] base;
  float[][] map;
  int rows;
  int cols;
  String str;

  Map(String filename) {
    try {
      File f = new File(filename);
      Scanner s = new Scanner(f);
      while ( s.hasNextLine()) {
        String m = s.nextLine();
        cols = m.length();
        str += m ;
        rows ++;
      }
      s.close();
    }
    catch(FileNotFoundException e) {
    }
    base = new char[rows][cols];
    map = new float[rows][cols];
    int i = 0;
    for (int r = 0; r < rows; r++) {
      for (int c = 0; c <cols; c++) {
        base[r][c] = str.charAt(i);
        i++;
      }
    }
    for (int  r = 0; r < base.length; r++) {
      for (int c = 0; c < base[0].length; c++) {
        if (base[r][c] == '#') {
          map[r][c] = 50;
        } else {
          map[r][c] = 0;
        }
      }
    }
  }






  void display() {
    for (int i = 0; i < map.length; i++) {
      for (int j = 0; j< map[1].length; j++) {
        fill(0);
        rect(25*i, 25*j, 25, 25);
      }
    }
  }
}