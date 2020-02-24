class Ripple {

  PVector location;
  float size, sizebig, sizegiant;
  float a;
  float lives;

  Ripple() {
    lives = 1;
    a = 255;
    location = new PVector (random(0, width), random(0, height));
  }

  Ripple(float x, float z) {
    lives = 1;
    a = 255;
    size = random (1, 7);
    sizebig = size + 20;
    sizegiant = sizebig + 20;
    location = new PVector (x, 100, z);
  }

  void show() { 

    pushMatrix();
    translate(location.x, location.y, location.z);
    rotateX(PI/2);
    noFill();

    stroke (164, 242, 231, a);
    ellipse(0, 0, size, size);

    stroke (164, 242, 231, (a - 50));
    ellipse(0, 0, sizebig, sizebig);

    stroke (164, 242, 231, (a - 100));
    ellipse(0, 0, sizegiant, sizegiant);

    popMatrix();
  }

  void act() {

    sizegiant = sizegiant + 3;
    sizebig = sizebig + 2;
    size = size + 1;
    a = a - 4;

    if (a <= 0) {
      lives = 0;
    }
  }
}

/////////////////////////////

void drawRipple() {
  int i = 0;
  while (i < ripples.size()) {
    Ripple b = ripples.get(i);
    b.act();
    b.show();
    if (b.lives <= 0) {
      ripples.remove(i);
    } else i++;
  }
}
