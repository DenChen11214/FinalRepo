import java.io.*;
import java.util.*;
class Map {
  char[][] base;
  float[][] map;
  int rows;
  int cols;

  Map(String filename) {

  }

  String toString() {
    String res = "";
    for (int i = 0; i<map.length; i++) {
      for (int j = 0; j<map[1].length; j++) {
        res += map[i][j] + " ";
      }
    }
    return res;
  }


  void display() {
    for (int i = 0; i < map.length; i++) {
      for (int j = 0; j< map[1].length; j++) {
        fill(0);
        rect(25*i, 25*j, 25, 25);
      }
    }
    textSize(20);
    text(map.toString(), 10, 10);
  }
}