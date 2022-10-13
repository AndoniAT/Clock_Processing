PShape horloge, centre, cercle;
void setup() {
  println("Begin");
  size(600, 600, P3D);
  pixelDensity(displayDensity());
  horloge = creerHorloge();
  centre = creerCentre();
  cercle = creerCercle();
  
}

PShape creerHorloge() {
  PShape horloge = createShape(ELLIPSE, 0, 0,width, width);
  horloge.setFill(color(174, 193, 168));
  return horloge;
}

PShape creerCentre() {
  PShape centre = createShape(ELLIPSE, 0, 0,6, 6);
  centre.setFill(color(255,255, 255));
  return centre;
}

PShape creerCercle() {
  PShape cercle = createShape(ELLIPSE, 0, -(width/2)+20, 15, 15);
  cercle.setFill(color(247,247, 113));
  return cercle;
}

void drawCercles() {
  textSize(20);
  pushMatrix();
  int c = 0;
  float angle = 0;
  while(c < 12) {  
    //println("cercle");
    pushMatrix();
      fill(0, 0, 0);
      rotate(angle);
      shape(cercle);
    popMatrix();
    angle+=PI/6;
    if(angle > TWO_PI) { angle = 0; }
    c++;
  }
  popMatrix();
}

void draw() {  
  println("draw");
  background(210);
  translate(width/2, height/2);
  shape(horloge);
  drawCercles();
  shape(centre);
  
}
