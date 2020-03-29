
PImage bg;
PImage soil;
PImage life;
PImage groundHog;
PImage robot;
PImage soldier;

int soldierSpeed,robotX,robotRandomX,floorS ,floorR,laserSpeed,laserLength,laserMaxLength;

void setup() {
	size(640, 480, P2D);
	bg = loadImage("img/bg.jpg");
  soil = loadImage("img/soil.png");
  life = loadImage("img/life.png");
  groundHog = loadImage("img/groundhog.png");
  robot = loadImage("img/robot.png");
  soldier = loadImage("img/soldier.png");
  
  floorS = (floor(random(4))+1)*80+80; //soldier's Y position
  floorR = (floor(random(4))+1)*80+80; //robot's Y position
  //robot's X position
  robotRandomX = (floor(random(5)))*80 ; 
  robotX = 80*2;
  soldierSpeed = 0;
  laserSpeed =0;
  laserMaxLength = 40;
  laserLength = 0;
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
  image ( groundHog , 640/2 ,80);
  
  //sun
  fill(255,255,0);
  ellipse(640-50,50,130,130);  
  fill(253,184,19);
  ellipse(640-50,50,120,120);
  
  soldierSpeed += 6; // x=x+6
  soldierSpeed %= 750;
  
  //Soldier's position
  image(soldier,soldierSpeed,floorS);
 
  //laser
  strokeWeight(10);
  stroke(255,0,0);
  line(robotX+robotRandomX+25-laserSpeed,floorR+37,robotX+robotRandomX+25-laserSpeed-laserLength,floorR+37);
  laserSpeed += 2;
  
  //laser maximum lenth
  if(laserLength==40){
    laserLength=40;
  }else{
    laserLength += 2;
  }
  
  //laser range
  if(robotX+robotRandomX+25-laserSpeed-laserLength ==robotX+robotRandomX-(160+25)){
    laserLength -=2;
  }
  
  if(robotX+robotRandomX+25-laserSpeed ==robotX+robotRandomX-(160+25)){
    laserSpeed = 0;
    laserLength = 0;
  }
  
  //robot's position
  image(robot,robotX+robotRandomX,floorR);
}
