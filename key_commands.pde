void keyPressed() {
  if (keyCode == UP)    up = true;
  if (keyCode == DOWN)  down = true;
  if (keyCode == LEFT)  left = true;
  if (keyCode == RIGHT) right = true;

  if (key == 'w' || key == 'W') wkey = true;
  if (key == 'a' || key == 'A') akey = true;
  if (key == 's' || key == 'S') skey = true;
  if (key == 'd' || key == 'D') dkey = true;
}

void keyReleased() {
  if (keyCode == UP)    up = false;
  if (keyCode == DOWN)  down = false;
  if (keyCode == LEFT)  left = false;
  if (keyCode == RIGHT) right = false;

  if (key == 'w' || key == 'W') wkey = false;
  if (key == 'a' || key == 'A') akey = false;
  if (key == 's' || key == 'S') skey = false;
  if (key == 'd' || key == 'D') dkey = false;
}

void mouseDragged() {

  //  rotx = rotx + (pmouseY - mouseY) * 0.01;
  //  roty = roty - (pmouseX - mouseX) * 0.01;
}
