class Player {
  // Player position
  float x, y;
  
  // Player velocity
  float vx, vy;
  
  // Player size
  float size;
  
  // Jump variables
  boolean isJumping;
  boolean isFalling;
  float jumpForce;
  float fallForce;
  float groundLevel;
  int timer;
  
  //Player stats
  float health;
  float attack;
  float speed;

  boolean touchingPlatform = false;
  boolean isPowered = false;
  
  boolean isTouching(Player player, Platform platform) {
     if (player.x + player.size >= platform.x &&    // r1 right edge past r2 left
      player.x <= platform.x + platform.width &&    // r1 left edge past r2 right
      player.y + player.size >= platform.y+45 &&    // r1 top edge past r2 bottom
      player.y <= platform.y + platform.height) {    // r1 bottom edge past r2 top
        return true;
  }
  return false;
  }
  
  Player(float x, float y, float health, float attack, float speed, float jumpForce) {
    this.x = x;
    this.y = y;
    this.health = health;
    this.attack = attack;
    this.speed = speed;
    this.jumpForce = jumpForce; // Adjust this value to control the jump height
    size = 50;
    vx = 0;
    vy = 0;
    isJumping = false;
    isFalling = false;
    timer = 5;
    fallForce = 0.5; // Adjust this value to control the fall speed
    groundLevel = height - size;
  }
  
  void update() {
    if (player.health <= 0) {
    }
    else {
      boolean touchingPlatform = false;
      //Checking if it's at borders
      if (x + vx < -1) {
        x = 0;
      }
      else if (x+size + vx > width) {
        x = width-size;
      }
      else {
      x += vx;
      }
      y += vy;
      
      for (int i = 0; i < platforms.size(); i++) {
        Platform platform = platforms.get(i);
      if (isTouching(this, platform)) {
        // Colliding with a platform
        if (vy >= 0 && y + vy + player.size >= platform.y) {
          // Collision from above
          timer = 5;
          y = platform.y-player.size+45;
          vy = 0;
          isJumping = false;
          isFalling = false;
          touchingPlatform = true;
        }  else if (vy < 0 &&  y + vy <= platform.y + platform.height) {
          // Collision from below
          vy = 0;
          timer = 0;
          y = platform.y + platform.height+.01;
          isJumping = false;
          isFalling = true;
          touchingPlatform = false;
        }
        else if (vx > 0 && x + vx <= platform.x + platform.width && x + vx + size >= platform.x) {
          // Collision from the left
          // x = platform.x - size;
        } else if (vx < 0 && x + vx + size >= platform.x && x + vx < platform.x + platform.width) {
          // Collision from the right
          // x = platform.x + platform.width;
        }
      }
    }
      
      if (isJumping) {
        timer--;
      }
      // Apply gravity
      if (!touchingPlatform && (y < groundLevel || timer<1)) {
        vy += fallForce; // Adjust this value to control the fall speed
      }
      
      // Check if player hits the ground
      if (y >= groundLevel) {
        timer = 5;
        y = groundLevel;
        vy = 0;
        isJumping = false;
        isFalling = false;
      } else {
        if (!touchingPlatform) {isFalling = true;}
        
      }
      
      // Display the player
      fill(255,0,0);
      rect(x, y, 50, 50);
    
  }
  }
  
  void moveLeft() {
      
      vx = -speed; // Adjust this value to control the left movement speed

  }
  
  void moveRight() {
      vx = speed; // Adjust this value to control the right movement speed
  }
  
  void stopMoving() {
    vx = 0;
  }
  
  void jump() {
    if (!isJumping && !isFalling) {
      vy = jumpForce;
      isJumping = true;
          }
  }
}
