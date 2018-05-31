import java.io.*;
import java.util.*;
class Map {
  private char[][] base;
  private float[][] map;
  Map(String filename){
    File f = new File(filename);
    Scanner s = new Scanner(f);
    String str = "";
    int cols = 0;
    int rows = 0;
    while ( s.hasNextLine()) {
      String m = s.nextLine();
      cols = m.length();
      str += m ;
      rows ++;
    }
    s.close();
    base = new char[rows][cols];
    map = new float[rows][cols];
    int start = 0;
    int end = 0;
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
          map[r][c] = 150;
        } else {
          map[r][c] = 0;
        }
      }
    }
  }





  public void display() {
    for (int i = 0; i < map.length; i++) {
      for (int j = 0; j< map[1].length; j++) {
        fill(map[i][j]);
        rect(25*i, 25*j, 25, 25);
      }
    }
  }
}