float x,y;
float xspeed,yspeed;
boolean[] keysPressed = new boolean[4];
void setup(){
  size(600,600);
  x = width/2;
  y = height/2;
  xspeed = 5;
  yspeed=5;
  for(int i = 0; i < 4;i++){
    keysPressed[i] = false;
  }
}
void draw(){
  background(255);
      if(keysPressed[0]){
        y-= yspeed;
      }
      if(keysPressed[1]){
        y+= yspeed;
      }
      if(keysPressed[2]){
        x-= xspeed;
      }
      if(keysPressed[3]){
        x+= xspeed;
      }
  ellipse(x,y,50,50);
}
void keyPressed(){
    if(keyCode == 'W' || keyCode == 'w'){
      keysPressed[0] = true;
    }
    if(keyCode == 'S' || keyCode == 's'){
      keysPressed[1] = true;
    }
    if(keyCode == 'A' || keyCode == 'a'){
      keysPressed[2] = true;
    }
    if(keyCode == 'D' || keyCode == 'd'){
      keysPressed[3] = true;
    }
}
void keyReleased(){
  if(keyCode == 'W' || keyCode == 'w'){
      keysPressed[0] = false;
    }
    if(keyCode == 'S' || keyCode == 's'){
      keysPressed[1] = false;
    }
    if(keyCode == 'A' || keyCode == 'a'){
      keysPressed[2] = false;
    }
    if(keyCode == 'D' || keyCode == 'd'){
      keysPressed[3] = false;
    }
}
    
