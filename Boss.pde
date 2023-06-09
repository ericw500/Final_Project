class Boss {
    int health;
    int attack;
    float eWidth;
    float eHeight;
    int x,y;
    int bossTimer = 0;
    int bossTimerWhileI = 0;
    int invulnerableInterval;
    boolean invulnerable = false; 
    int spawnTimer = 300;
    int attackTimer = 300;
    boolean switch1 = false;
    int displayRate = 10;
    BossBullet bulletUp = new BossBullet(this, "ver");
    BossBullet bulletDown = new BossBullet(this, "hor");

    Boss(int hp, int atk){
        this.health = hp;
        this.attack = atk;
        eWidth = 40;
        eHeight = 50;
        x = width/2;
        y = height/2;
    }
    
    void update(){
        imageMode(CENTER);
        
        if (invulnerable){
            tint(255, 150);
        }
        image(boss[frameCount%20], x, y);
        noTint();

        if (bossTimer >= 300){
            invulnerable = true;
            if (bossTimerWhileI == 900) {
                invulnerable = false;
                bossTimer = 0;
            }
            bossTimerWhileI++;
        }
        if (invulnerable){
            spawnTimer++;
            attackTimer++;
            if (spawnTimer%100 == 0){
                for (int i = 0;i<3;i++) {
                    Alien alien = new Alien(random(0,width-94), height/2, 50, 5, 5, 95, 95);
                    enemies.add(alien);
                }
            }
            for (int i = 0;i<enemies.size();i++) {
                enemies.get(i).update();
                }
            if (attackTimer>=300) {
                if (switch1 == false) {            
                    BossBullet bulletUp = new BossBullet(this, "hor");
                    switch1 = true; }
                else {
                    BossBullet bulletUp = new BossBullet(this, "ver");
                    switch1 = false;
                }
                bulletUp.update(this);
                bulletDown.update(this);
                if (isTouching(bulletUp,player)){
                    player.health -= attack;
                }
                if (isTouching(bulletDown,player)){
                    player.health -= attack;
                }
            }
        }
        else { 
            noTint();
            for (int i = 0;i < bullets.size();i++) {
                Bullet bullet = bullets.get(i);
            if (bullet.firstTouch && isTouching(bullet, this)) {
                health-=player.attack;
            }
            }
            if (health <= 0){
              victory = true;
              victoryScreen();
            }
        }
        bossTimer++;
        imageMode(CORNER);
        
    }

    boolean isTouching(Bullet bullet, Boss boss) {
     if (bullet.pos.x + bullet.bWidth >= boss.x - 65 &&    // r1 right edge past r2 left
        bullet.pos.x <= boss.x + boss.eWidth   &&    // r1 left edge past r2 right
        bullet.pos.y + bullet.bHeight >= boss.y - 60 &&    // r1 top edge past r2 bottom
        bullet.pos.y <= boss.y + boss.eHeight - 30) {    // r1 bottom edge past r2 top
        bullet.firstTouch = false;
        return true;
    }
    return false;
    }

    boolean isTouching(BossBullet bBullet, Player player) {
    if (player.x + player.size >= bBullet.pos.x &&    // r1 right edge past r2 left
      player.x <= bBullet.pos.x + bBullet.bWidth &&    // r1 left edge past r2 right
      player.y + player.size >= bBullet.pos.y &&    // r1 top edge past r2 bottom
      player.y <= bBullet.pos.y + bBullet.bHeight) {    // r1 bottom edge past r2 top
        return true;
    }
    return false;
  }
}
