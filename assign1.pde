PImage bg, groundhog, soil, life, soldier, robot;

//laser
float laserX, laserY;

//soldier
float soldierX;
float soldierFloor;
int a ;

//robot
float robotX;
float robotFloor;
int b ;

void setup() {
  
  size(640, 480);
  
  //imput background
  bg = loadImage("img/bg.jpg");
  image(bg,0,0);
  
  //draw sun
  noStroke();
  fill(124,204,25);
  rectMode(CORNERS);
  rect(0,145,640,160);

  //input groundhog
  groundhog = loadImage("groundhog.png");
  image(groundhog,280,80);
  
  //draw soil
  soil = loadImage("soil.png");

  
  //input life
  life = loadImage("img/life.png");
  image(life,10,10);
  image(life,81,10);
  image(life,152,10);
  
  //draw sun
  fill(253,184,19);
  stroke(255,255,0);
  strokeWeight(5);
  ellipse(590,50,120,120);
  
  //input soldier
  soldier = loadImage("img/soldier.png");
    //decide soldierY
    a = int(random(0,4));
    soldierFloor = a*80+160;
    
  //input robot
  robot = loadImage("robot.png");
    robotX= int(random(25,640));
    b = int(random(0,4));
    robotFloor = b*80+160;
    
  //decide laser movement
  laserX=robotX;
  laserY=robotFloor;
 
}

void draw() {
  
  //cover soldier's previous frame
    image(soil,0,160);
  
  //let soldier walk
  soldierX +=5;
  soldierX%=640;
  image(soldier,soldierX,soldierFloor);
  
  //draw laser
  noStroke();
  fill(255,0,0);
  ellipse(laserX+25,laserY+37,10,10);
  rectMode(CORNERS);
  rect(laserX-5,laserY+32,laserX+25,laserY+42);
  ellipse(laserX-5,laserY+37,10,10);
  
  //shoot laser
  laserX-=2;
  if(laserX+40<0){
    laserX=robotX;
  }
  
  //place the robot
  image(robot,robotX,robotFloor);
  
}
