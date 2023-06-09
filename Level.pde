class Level {
  int lvl;
  int numAliens;
  int numUFOs;
  Level(int level) {
    lvl = level;
    numAliens = int(random(lvl,1+lvl));
    numUFOs = int(random(lvl,1+lvl));
  }
  
  void runLevel() {
    if (lvl<4){
      for (int i = 0;i<numAliens;i++) {
        Alien alien = new Alien(random(0,width-94), height/2, 50+5*int(random(lvl-1,lvl+lvl/2)), 10+5*int(random(lvl-1,lvl+lvl/2)), 4+int(random(lvl-1,lvl+lvl/2)), 95, 95);
        enemies.add(alien);
      }
      
      for (int j = 0;j<numUFOs;j++) {
        UFO ufo = new UFO(random(0,width-94), 0, 50+5*int(random(lvl-1,lvl+1)), 10+5*int(random(lvl-1,lvl+1)), 5+int(random(lvl-1,lvl+1)), 150, 95);
        enemies.add(ufo);
      }
    }
  }
}
