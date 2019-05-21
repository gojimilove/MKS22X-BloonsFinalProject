void setup() {
  size(900, 600);
  background(255);
}

void draw() {
  int x = 0;
  int y = 0;
  for (int i = 0; i < width; i+=50) {
    x = i;
    for (int j = 0; j < height; j+=50) {
      y = j;
      rect(x, y, 50, 50);
    }
  }
}
