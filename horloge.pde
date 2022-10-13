PShape horloge, centre, cercle, carre;
void setup() {
  println("Begin");
  size(600, 600, P3D);
  pixelDensity(displayDensity());
  horloge = creerHorloge();
  centre = creerCentre();
  cercle = creerCercle();
  carre = creerCarre();
  
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

PShape creerCarre() {
  PShape carre = createShape();
  carre.beginShape();
    //carre.noFill();
    carre.fill(38, 164, 51);
    int cote = 5;
    carre.stroke(0, 0, 0, 32);
    carre.vertex(-cote/2, -cote/2 - (width/2)+20);
    carre.vertex( cote/2, -cote/2 - (width/2)+20);
    carre.vertex( cote/2,  cote/2 - (width/2)+20);
    carre.vertex(-cote/2,  cote/2 - (width/2)+20);
  carre.endShape(CLOSE);
  
  return carre;
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

void drawCarres(int d) {
  pushMatrix();
  int cC = 0;
  float angleC = 0;
  int div = d;
  angleC+=PI/div;
  if(angleC > TWO_PI) { angleC = 0; }
  while(cC < 12) {
    int cC2 = 0;
    while(cC2 < 4) {
      //println("carre");
      pushMatrix();
        rotate(angleC);
        shape(carre);
      popMatrix();
      angleC+=PI/div;
      if(angleC > TWO_PI) { angleC = 0; }
      cC2++;  
    }
    angleC+=PI/div;
    if(angleC > TWO_PI) { angleC = 0; }
    cC++;
    
  }
  popMatrix();
}


void draw() {  
  println("draw");
  background(210);
  translate(width/2, height/2);
  shape(horloge);
  int div = 30;
  drawCercles();
  drawCarres(div);
  shape(centre);
  
}
