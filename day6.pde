import java.util.Calendar;

void setup() {
  size(640, 640);
  
  drawGraphics();
}
 
void draw() {

}
 void mousePressed(){
  drawGraphics();
 }
 
void drawGraphics(){
  background(0);
  smooth();
  noStroke();
  float size = random(100, width / 2);
  
  for (int i = 0; i <= width; i++)
  {
    fill(i % 200 + noise(width), width % 20, i % 200, i % 255);
    ellipse(random(width) + sin(i % 255), i + random(-5, 5), size, size);
  }  
}
 
void keyPressed() {
  if (key == 's') {
    saveHiRes(5);
    println("image saved");
  }
}
 
void saveHiRes(int scaleFactor) {
  PGraphics hires = createGraphics(width*scaleFactor, height*scaleFactor, JAVA2D);
  beginRecord(hires);
  hires.scale(scaleFactor);
  drawGraphics();
  endRecord();
  hires.save("hires" + timestamp() + ".png");
}

// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}
