class Snow {

  PVector location;
  float size;
  int hp =1;
  float n;

  float x, y, z, vy;

  Snow() {
    location = new PVector (random (bs*50), -2000, random (bs*50));
    size = random (1, 3);
  }

  void show() {

    pushMatrix();
    translate(location.x, location.y, location.z);
    fill(164, 242, 231);
    box(3, 30, 3);
    popMatrix();
  }

  void act() {
    location.y = location.y + 30;
  }
}

/////////////////////////////

void drawSnow() {
  int i = 0;
  while (i < snowflakes.size()) {
    Snow b = snowflakes.get(i);
    b.act();
    b.show();
    if (b.location.y >= 100) {
      snowflakes.remove(i);

      ripples.add(new Ripple(b.location.x, b.location.z));
    } else i++;
  }
}
