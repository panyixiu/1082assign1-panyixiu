
PImage bg;
PImage soil;
PImage life;
PImage groundhog;
PImage robot;
PImage soldier;

int soldierSpeed,robotX,robotRandomX,floorS ,floorR;
int groundhogWidth = 40;
int soldierWidth = 40;
int laserX1, laserX2;
int laserSpeed1 = 0;
int laserSpeed2 = 0;

void setup() {
	size(640, 480, P2D);
	bg = loadImage("img/bg.jpg");
  soil = loadImage("img/soil.png");
  life = loadImage("img/life.png");
  groundhog = loadImage("img/groundhog.png");
  robot = loadImage("img/robot.png");
  soldier = loadImage("img/soldier.png");
  
  floorS = (floor(random(4))+1)*80+80; //soldier's Y position
  floorR = (floor(random(4))+1)*80+80; //robot's Y position
  //robot's X position
  robotRandomX = (floor(random(5)))*80 ; 
  robotX = 80*2;
  soldierSpeed = 0;
}

void draw() {
  
  //background
	background(bg); 

  //soil
  image ( soil ,0 ,160); 
  
  //grass
  colorMode(RGB);
  fill(124,204,25);
  noStroke();
  rect(0,145,640,15);
  
  //3 lives
  image ( life ,10 ,10);
  image ( life ,80 ,10);
  image ( life ,150 ,10);
   
  //groundhog
  image ( groundhog , 640/2 - groundhogWidth ,80);
  
  //sun
  fill(255,255,0);
  ellipse(640-50,50,130,130);  
  fill(253,184,19);
  ellipse(640-50,50,120,120);
  
  soldierSpeed += 6; // x=x+6
  soldierSpeed %= 900;
  
  //Soldier's position
  image(soldier,soldierSpeed - soldierWidth ,floorS);
 
  //laser
  strokeWeight(10);
  stroke(255,0,0);
  laserX1 = robotX+robotRandomX+25+laserSpeed1;
  laserX2 = robotX+robotRandomX+25+laserSpeed2;
  line(laserX1,floorR+37,laserX2,floorR+37);
  
  if(laserX1 > robotX+robotRandomX - 2*80){
    laserSpeed1 -= 2;
    if(laserX1 < robotX+robotRandomX +25 -30 ){
      laserSpeed2 -= 2;
    }
  }else{
    laserSpeed1 = 0;
    laserSpeed2 = 0;
  }
  
  //robot's position
  image(robot,robotX+robotRandomX,floorR);
}
