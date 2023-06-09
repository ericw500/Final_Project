class Platform{
    float x;
    float y;
    float width;
    float height;
    PImage img;

    Platform(PImage img, float x, float y, float width, float height) {
        this.x = x;
        this.y = y;
        this.width = width;
        this.height = height;
        this.img = img;
    }

    void drawPlatform(){
        image(img,x, y, width, height);
    }
}
