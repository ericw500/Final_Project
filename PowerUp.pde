class PowerUp{
    PImage strength = loadImage("strength.png");
    PImage speed = loadImage("speed.png");
    PImage health = loadImage("health.png");
    PImage reload = loadImage("reload.png");
    PImage jump = loadImage("jump.png");

    PVector powerUp;
    int timer = second();
    int pUpTimer = 0;
    int pDuration = 600;
    int pInterval = 1500;
    int pWidth = 50;
    int pHeight = 50;
    int type = int(random(5));
    boolean playerTouched = false;
    
    PowerUp(){
       powerUp = new PVector(int(random(width/2)), height - 50 - int(random(100))); 
       pWidth = 50;
       pHeight = 50;
    }

    void update(){
        if (isTouching(player, this)){
            switch(type){
            case 0:
                if (player.isPowered == false) {
                    player.jumpForce -= 5;
                }
                player.isPowered = true;
                playerTouched = true;
                break;
            case 1:
                if (player.isPowered == false) {
                    player.speed += 5;
                }
                player.isPowered=true;
                playerTouched = true;
                break;
            case 2:
                if (player.isPowered == false) {
                    player.attack += 10;
                }
                player.isPowered=true;
                playerTouched = true;
                break;
            case 3:
                if (player.isPowered == false) {
                    rldRate -= 7.5;
                }
                player.isPowered=true;
                playerTouched = true;
                break;
            case 4:
                if (player.isPowered == false && player.health + 10 <= 100) {
                    player.health+=10;
                }
                else if (player.health == 95 && player.isPowered == false){
                    player.health+=5;
                }
                player.isPowered = true;
                playerTouched = true;
                break;
            }
        }
        else {
            if (playerTouched == false){
                drawPowerUp();
            }
            else {
                if (playerTouched){
                    pUpTimer++;
                    if (pUpTimer == pDuration){
                        switch(type){
                            case 0:
                                player.jumpForce += 5;
                                break;
                            case 1:
                                player.speed-=5;
                                break;
                            case 2:
                                player.attack -= 10;
                                break;
                            case 3:
                                rldRate += 7.5;
                                break;
                        }
                    }
                    if (pUpTimer >= pInterval){
                        pUpTimer = 0;
                        playerTouched = false;
                        newPowerUp();
                        player.isPowered = false;
                    }
                }
            }
        }
    }

    void newPowerUp(){
        powerUp = new PVector(int(random(width/2)), height - 50 - int(random(100)));
        type = int(random(5));
    }

    void drawPowerUp(){
        switch(type){
          case 0:
            image(jump,powerUp.x,powerUp.y,75,75);
            break;
          case 1:
            image(speed,powerUp.x,powerUp.y,75,75);
            break;
          case 2:
            image(strength,powerUp.x,powerUp.y,75,75);
            break;
          case 3:
            image(reload,powerUp.x,powerUp.y,75,75);
            break;
          case 4:
            image(health,powerUp.x,powerUp.y,75,75);
            break;
        }
    }

    boolean isTouching(Player player, PowerUp powers) {
     if (player.x + player.size >= powers.powerUp.x &&    // r1 right edge past r2 left
      player.x <= powers.powerUp.x + powers.pWidth &&    // r1 left edge past r2 right
      player.y + player.size >= powers.powerUp.y &&    // r1 top edge past r2 bottom
      player.y <= powers.powerUp.y + powers.pHeight) {    // r1 bottom edge past r2 top
      return true;
    }
    return false;
    }
}
