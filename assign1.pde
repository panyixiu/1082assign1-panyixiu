PImage bg;
PImage soil;
PImage life;
PImage groundHog;
PImage robot;
PImage soldier;

int soldierSpeed,robotSpeed,n,floor1 ,floor2;

void setup() {
	size(640, 480, P2D);
	bg = loadImage("img/bg.jpg");
  soil = loadImage("img/soil.png");
  life = loadImage("img/life.png");
  groundHog = loadImage("img/groundhog.png");
  robot = loadImage("img/robot.png");
  soldier = loadImage("img/soldier.png");
  
  floor1 = (floor(random(3))+1);
  floor2 = (floor(random(3))+1);
  n = (floor(random(3)));
  soldierSpeed = 0;
  robotSpeed = 160;
}

void draw() {
  
  //background
	background(bg); 

  //soil
  image ( soil ,0 ,160); 
  
  //grss
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
  
  soldierSpeed += 7; // x=x+7 
  soldierSpeed %= 750;
  
  //Soldier's position
  image(soldier,soldierSpeed,floor1*80+80);
 
  //robot's position
  robotSpeed += 7;
  image(robot,robotSpeed,floor2*80+80);

}
