import java.io.*; //<>// //<>//
import java.util.*;
Map cave;
Battle scene;
float numBattles;
boolean inBattle = false;
float xOld, xNew, yOld, yNew;
float stepsTaken;
boolean hasStepped;
void setup() {
  size(800, 600);
  cave = new Map();

  scene = new Battle();
  xOld = cave.px;
  yOld = cave.py;
}

void draw() {
  background(255);
  cave.display();
  pushMatrix();
  translate(width/2, height/2);
  if (!inBattle) {
    xNew = cave.px;
    yNew = cave.py;
    if (Math.pow(xNew - xOld, 2) + Math.pow(yNew - yOld, 2) >= (Math.pow(height, 2) + Math.pow(width, 2)) / 20) {//2nd part of inequality is bound to change when I figure out the size of the player sprite
      stepsTaken++;
      hasStepped = true;
    }
  }
  if (hasStepped && (int)Math.random() * 13 == 0) {
    inBattle = true;
    hasStepped = false;
  }
  if (scene.runAway && inBattle) {
    inBattle = false;
  }
  if (inBattle) {
    scene.moveBar();
    scene.display();
  }
  popMatrix();
}

void keyPressed() {
  if (keyCode == 'W' || keyCode == 'w') {
    cave.update(0, -1);
  }
  if (keyCode == 'S' || keyCode == 's') {
    cave.update(0, 1);
  }
  if (keyCode == 'A' || keyCode == 'a') {
    cave.update(-1, 0);
  }
  if (keyCode == 'D' || keyCode == 'd') {
    cave.update(1, 0);
  }
}