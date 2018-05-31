import java.io.*;
import java.util.*;
class Map {
  private char[][] base;
  private color[][] map
  Map(String filename)throw FileNotFoundException {
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
    map = new color[row][cols];
    int start = 0;
    int end = 0;
    int i = 0;
    for (int r = 0; r < rows; r++) {
      for (int c = 0; c <cols; c++) {
        base[r][c] = str.charAt(i);
        i++;
      }
    }
  }

  public void display() {
    for (int  i =0; i < base.length; i++) {
      for (int j = 0; j < base[0].length; j++) {
        if (base[i][j] == '#') {
        }
      }
    }
  }
}