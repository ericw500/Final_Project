class HealthBar {
  PImage fullHeart = loadImage("fullHeart.png");
  PImage halfHeart = loadImage("halfHeart.png");
  PImage emptyHeart = loadImage("emptyHeart.png");
  int hearts; 
  HealthBar(Player player) {
     hearts = int(player.health/10);
  }
  
  public void update() {
    if (player.health>100) player.health = 100;
    hearts = int(player.health/10);
      for (int i = 0;i<=9;i++) {
        if (hearts<i) {
          image(emptyHeart,60*(i-1), 0, 50, 50);
        }
        else if (i == hearts && player.health%10!=0
        ) {
            image(halfHeart, 60*(i-1),0, 50, 50);
          }
        else {
          image(fullHeart, 60*(i-1), 0, 50, 50);
        }
      }
  }
  
  
  
  
}
