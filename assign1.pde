PImage bg, groundhog, soil, life, soldier, robot;

//laser
float laserX, laserY, laserLength;

//soldier
float soldierX;
float soldierFloor;

//robot
float robotX;
float robotFloor;

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
  groundhog = loadImage("img/groundhog.png");
  image(groundhog,280,80);
  
  //draw soil
  soil = loadImage("img/soil.png");

  
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
    soldierFloor = int(random(0,4))*80+160;
    
  //input robot
  robot = loadImage("img/robot.png");
    robotX= int(random(25,480));
    robotFloor = int(random(0,4))*80+160;
    
  //decide laser movement
  laserX=robotX;
  laserY=robotFloor;
 
}

void draw() {
  
  //cover soldier's previous frame
    image(soil,0,160);
  
  //let soldier walk
  soldierX +=3;
  soldierX%=720;
  image(soldier,soldierX-80,soldierFloor);
  
  //draw laser
  stroke(255, 0, 0);
  strokeWeight(10);
  image(robot, robotX, robotFloor);
  line(laserX, laserY+37, laserX+laserLength, laserY+37);
  
  //shoot laser
  if(laserX >= robotX-160){
    laserX -= 2;
    laserLength += 2;
    if(laserLength >= 40){
      laserLength = 40;
    }
  }
  else{
    laserX = robotX+25;
    laserLength = 0;
  }
}
