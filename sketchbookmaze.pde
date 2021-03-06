ArrayList<Bullet> bullets;
ArrayList<Snow> snowflakes;
ArrayList<Ripple> ripples;

//keyboard interaction
boolean up, down, left, right;
boolean wkey, akey, skey, dkey;

//World manipulation
int bs = 100;

//camera variables
float lx = 2500, ly = height/2 - bs/2, lz = 2500;
PVector xzDirection = new PVector(0, -10); //which way we are facing
PVector xyDirection = new PVector(10, 0);  //for looking up and down
PVector strafeDir = new PVector(10, 0);
float leftRightHeadAngle = 0;
float upDownHeadAngle = 0;

//color palette
color black = #000000;
color white = #FFFFFF;

PImage map;

//textures
PImage qblock, dT, dS, dB;

void setup() {
  size(800, 800, P3D);

  dT = loadImage("dirttop.png");
  dS = loadImage("dirtside.png");
  dB = loadImage("dirtbottom.png");
  textureMode(NORMAL);

  map = loadImage("complexMapSpace.png");

  bullets = new ArrayList<Bullet>();
  snowflakes = new ArrayList<Snow>();
  ripples = new ArrayList<Ripple>();
}

void draw() {
  background(0);

  float dx = lx + xzDirection.x;
  float dy = ly + xyDirection.y;
  float dz = lz + xzDirection.y;
  camera(lx, ly, lz, dx, dy, dz, 0, 1, 0); 
  xzDirection.rotate(leftRightHeadAngle);
  xyDirection.rotate(upDownHeadAngle);
  leftRightHeadAngle = -(pmouseX - mouseX) * 0.01;
  upDownHeadAngle = (pmouseY - mouseY) * 0.01;

  //headAngle = headAngle + 0.01;
  strafeDir = xzDirection.copy();
  strafeDir.rotate(PI/2);

println (lx, ly);

  //while (pixel == white) {
  if (wkey) {
    lx = lx + xzDirection.x;
    lz = lz + xzDirection.y;
  }
  if (skey) {
    lx = lx - xzDirection.x;
    lz = lz - xzDirection.y;
  }
  if (akey) {
    lx = lx - strafeDir.x;
    lz = lz - strafeDir.y;
  }
  if (dkey) { 
    lx = lx + strafeDir.x;
    lz = lz + strafeDir.y;
  }
  //}

  drawSnow();
  drawRipple();
  //drawBullets();
  drawMap();

  bullets.add(new Bullet(lx, ly, lz, xzDirection.x, xzDirection.y));
  snowflakes.add(new Snow());
}
