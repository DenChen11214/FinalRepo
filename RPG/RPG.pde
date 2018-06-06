import java.io.*; //<>//
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
  xOld = cave.x;
  yOld = cave.y;
}

void draw() {
  background(255);
  /*
  if (!inBattle) {
   cave.update();
   xNew = cave.x;
   yNew = cave.y;
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
   */
}
/*
void keyPressed() {
 if (keyCode == 'W' || keyCode == 'w') {
 cave.keysPressed[0] = true;
 }
 if (keyCode == 'S' || keyCode == 's') {
 cave.keysPressed[1] = true;
 }
 if (keyCode == 'A' || keyCode == 'a') {
 cave.keysPressed[2] = true;
 }
 if (keyCode == 'D' || keyCode == 'd') {
 cave.keysPressed[3] = true;
 }
 }
 */
