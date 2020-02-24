void drawMap() {
  int mapX = 0, mapY = 0;
  int worldX = 0, worldZ = 0;

  while ( mapY < map.height ) {
    //read in a pixel
    color pixel = map.get(mapX, mapY);

    worldX = mapX * bs;
    worldZ = mapY * bs;

    if (pixel == black) {
      dirtBox(dB, worldX, 50, worldZ, bs/2);
      dirtBox(dB, worldX, -50, worldZ, bs/2);
      grassyBox(dT, dS, dB, worldX, -150, worldZ, bs/2);
    }


    mapX++;
    if (mapX > map.width) {
      mapX = 0; //go back to the start of the row
      mapY++;   //go down to the next row
    }
  }
}
