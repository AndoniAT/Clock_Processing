PShape horloge;
void setup() {
  println("Begin");
  size(600, 600, P3D);
  pixelDensity(displayDensity());
  horloge = creerHorloge();
}

PShape creerHorloge() {
  PShape horloge = createShape(ELLIPSE, 0, 0,width, width);
  horloge.setFill(color(174, 193, 168));
  return horloge;
}

void draw() {  
  println("draw");
  background(210);
  translate(width/2, height/2);
  shape(horloge);
}
