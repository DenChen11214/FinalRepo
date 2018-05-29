float x,y;
float xspeed,yspeed;
void setup(){
  size(600,600);
  x = width/2;
  y = height/2;
  xspeed = 5;
  yspeed=5;
}
void draw(){
  background(255);
  ellipse(x,y,50,50);
}
void keyPressed(){
    if(keyCode == 'W' || keyCode == 'w'){
      y-=yspeed;
    if(keyCode == 'S' || keyCode == 's'){
      y+=yspeed;
    }
    if(keyCode == 'A' || keyCode == 'a'){
      x-=xspeed;
    }
    if(keyCode == 'D' || keyCode == 'd'){
      x+=xspeed;
    }
}
