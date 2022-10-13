PShape horloge, centre, cercle, carre, mAiguille, sAiguille;
PShape ce, ce1, ce2, ce2_2, ce3, ce3_2;
void setup() {
  println("Begin");
  size(600, 600, P3D);
  pixelDensity(displayDensity());
  horloge = creerHorloge();
  centre = creerCentre();
  cercle = creerCercle();
  carre = creerCarre();
  mAiguille= creermAiguille();
  sAiguille = creerSAiguille();
  
  ce = createShape(ELLIPSE,-(width/4), 0, width/4, width/4);
  ce.setFill(color(139, 186, 124));
  
  ce1 = createShape(ELLIPSE,-(width/4), 0, width/6, width/6);
  ce1.setFill(color(89, 151, 70));
  
  
  ce2 = createShape(ELLIPSE,(width/4), 0, width/4, width/4);
  ce2.setFill(color(139, 186, 124));
  
  ce2_2 = createShape(ELLIPSE,(width/4), 0, width/6, width/6);
  ce2_2.setFill(color(89, 151, 70));
  
  ce3 = createShape(ELLIPSE, 0, (width/4), width/4, width/4);
  ce3.setFill(color(139, 186, 124));
  
  ce3_2 = createShape(ELLIPSE,0, (width/4), width/6, width/6);
  ce3_2.setFill(color(89, 151, 70));

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

PShape creermAiguille() {
    PShape hAiguille = createShape();
    hAiguille.setFill(color(0,0,0));
    hAiguille.beginShape(TRIANGLES);
    //mAiguille.noFill();
    hAiguille.stroke(0, 0,0);
    
      hAiguille.vertex(-10, 10);
      hAiguille.vertex(10, 10);
      hAiguille.vertex(0, -(width/2)+20);
   hAiguille.endShape(CLOSE);
  return hAiguille;
}
PShape creerSAiguille() {
    PShape sAiguille = createShape();
    sAiguille.setFill(color(102,102,102));
    sAiguille.beginShape();
    sAiguille.stroke(0, 0, 0);
    sAiguille.vertex(-10, 10);
    sAiguille.vertex(10, 10);
    sAiguille.vertex(2, -(width/2)+10);
    sAiguille.vertex(-2, -(width/2)+10);
    sAiguille.vertex(-10, 10);
    sAiguille.endShape(CLOSE);
  return sAiguille;
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

void drawMinutes(int div){ 
  float angleMAiguille = (PI/div)*minute();
    pushMatrix();
      rotate(angleMAiguille);
      shape(mAiguille);
   popMatrix();
}
void drawSeconds(int div){
  float angleSAiguille = (PI/div)*second();
   pushMatrix();
      rotate(angleSAiguille);
      shape(sAiguille);
    popMatrix();
}

void draw() {  
  println("draw");
  background(210);
  translate(width/2, height/2);
  shape(horloge);
  
  shape(ce);
  shape(ce1);
  shape(ce2);
  shape(ce2_2);
  shape(ce3);
  shape(ce3_2);
  
  textSize(50);
  text("ROLEX", -(width/8), -(width/2)+120); 
  fill(40, 132, 12);
  int div = 30;
  drawCercles();
  drawCarres(div);
  drawMinutes(div);
  drawSeconds(div);
  shape(centre);
}
