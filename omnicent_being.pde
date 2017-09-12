//- VARIABLES --
//Outside Tentacles
float TentaLExt = 70; // Length Large Tentacles
float TentaLExtShort = 70; // Length o Tentacles
float circleExtSize; 
float TentaNb; // Number Tentacles // 360/x tentacles (0+n tentacles = 360/n)
 
//Internal Tentacles 
float TentaLInt = 10; // Length of Internal Tentacles
float circleIntSize; // Circle Size
 int eye= 10;
// Other variables
float x;
float y;
float x2;
float y2;
float angle;
// -----------------
 
void setup() {
  fullScreen();
  //size(1080, 1080);
  TentaNb=360; // base value for the number of tentacles 
  circleIntSize = 50; // base value for the size of the internal circle of tentacles
  circleExtSize = 70; //base value for the size of the external circle of tentacles
}
 
void draw() {
  strokeWeight(5);
  background(25); // Background Color
  rectMode(CENTER);
  rect(width/2, height/2, 500, 500);
 
  // -- EXTERNAL CIRCLE OF TENTACLES --
 
  pushMatrix();
  translate(mouseX, mouseY); // Center on the mouse
  rotate(frameCount * 0.005); // Circle Rotation
 
  // Circles
  for (int i = 0; i < 360; i+=TentaNb) {
    float x = sin(radians(i)) * 50; // Circle Formation X
    float y = cos(radians(i)) * 50; // Circle Formation Y
 
    // Creation of the Tentacles
    for (int j = 0; j < TentaLExt; j+=3) {
 
      // Ripple and Angle movement
      float angle = cos(radians(TentaLExt-j+frameCount)) * (j);
      float x2 = sin(radians(i-angle))*(j*3);
      float y2 = cos(radians(i-angle))*(j*3);
 
 ellipse(mouseX, mouseY+0, eye, eye);
  ellipse(mouseX-40, mouseY-130, eye, eye);
  ellipse(mouseX+40, mouseY-130, eye, eye);
 
 //text
fill(255,145,145);
textSize(20);
text("Gaze Into The Iris",275,310);



 
noStroke();
spotLight(51, 102, 126, 80, 20, 40, -1, 0, 0, PI/2, 2);
translate(20, 50, 0);
sphere(30);
 
 
 
      //Large Tentacles
      stroke(#FFD700);
      fill(250, 0+j*4, 250-j*4, 80+j*3);
      ellipseMode(CENTER);
      ellipse(x+x2, y+y2, (TentaLExt-j)/1.5, (TentaLExt-j)/1.5); // Edit Ellipse Size
      fill(245, 0+j*4, 250-j*4, 175+j*20);
      ellipse(x+x2, y+y2, (TentaLExt-j)/3, (TentaLExt-j)/3); // Edit Ellipse Size
      fill(250, 0+j*4, 255-j*4, 80+j*3);
      stroke(250, 0+j*4, 255-j*4, 80+j*3); 
 
      // Fines Tentacles
      ellipse(x2, y2, (TentaLExtShort-j)/4, (TentaLExtShort-j)/4); //Edit Ellipse Size
      noStroke();
    }
  }
  popMatrix();
  // ----------------------------------
 
  // -- INTERNAL CIRCLE OF TENTACLES --
  pushMatrix();
  translate(mouseX, mouseY); // Center on the mouse
  rotate(frameCount * 0.01); // Circle Rotate
 
  // Creation of the Circle 
  for (int k = 0; k < 360; k+=30) {
    x = sin(radians(k)) * circleIntSize; // Circle Formation X
    y = cos(radians(k)) * circleIntSize; // Circle Formation Y
 
    // Creation of the Tentacles
    for (int l = 0; l < TentaLInt; l+=2) {
 
      // Vibration/Pulse (Angle Deformation)
      float disturb = random(5, 6);  
 
      // Ripple and Angle movement
      angle = cos(radians(TentaLInt-k+frameCount/1.2)) * l*(disturb*0.5) ;
      x2 = sin(radians(k-angle))*(l*3);
      y2 = cos(radians(k-angle))*(l*3);
 
      // Disturbed Tentacles
      fill(250, 0+l*10, 255-l*10, 80+l*3);
      //fill(250, 0+l*12, 255-l*12, 90+l*3);
      ellipseMode(CENTER);
      ellipse(x+x2, y+y2, (TentaLInt-l)/1.2, (TentaLInt-l)/1.2); // Edit Ellipse Size
    }
  }
  popMatrix();
  // ----------------------------------
 
  // --- Central Core --
  fill(255, 0, 255, 80);
  ellipse(mouseX, mouseY, 25, 25);
  fill(200, 0, 200, 80);
  ellipse(mouseX, mouseY, 10, 10);
  // -------------------
 
  // -- Sound Circle --
  //Purple Circle
  beginShape();
  noFill();
  strokeWeight(2);
  for (int i=0; i<80; i++)
  {
    float phi = map(i, 0, 80, 0, TWO_PI);
    float median = 200;
    float deviation = 10;
    float radius = ((randomGaussian() * deviation) + median)/8;
    //float radius = random(200, 200);
    float x = width/2 + cos(phi) * radius;
    float y = height/2 + sin(phi) * radius;
    stroke(#FFD700);
    vertex(x, y);
  }
  endShape(CLOSE);
 
  //Orange Circle
  beginShape();
  noFill();
  strokeWeight(2);
  for (int i=0; i<80; i++)
  {
    float phi = map(i, 0, 80, 0, TWO_PI);
    float median = 200;
    float deviation = 15;
    float radius = ((randomGaussian() * deviation) + median)/7;
    //float radius = random(200, 200);
    float x = width/2 + cos(phi) * radius;
    float y = height/2 + sin(phi) * radius;
    stroke(#FFD700, 100);
    vertex(x, y);
  }
  endShape(CLOSE);
  // ------------------
}
 
// ADD TENTACLES
void keyPressed() {
 
  if (key=='a') { //1 Tentacle
    TentaNb=360;
  }
 
  if (key=='z') { //2 Tentacles
    alpha(0);
    TentaNb=180;
  }
  if (key=='e') { //3 Tentacles
    TentaNb=120;
  }
  if (key=='r') { //4 Tentacles
    TentaNb=90;
  }
  if (key=='t') { //5 Tentacles
    TentaNb=72;
  }
  if (key=='y') { //6 Tentacles
    TentaNb=60;
  }
}