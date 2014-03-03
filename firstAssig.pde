TVertex tv1, tv2;

// creating class for transformable vertexes
class TVertex {
  float x, y, z, t;
  TVertex(float tx, float ty, float tz, float tt) {
    x = tx;
    y = ty;
    z = tz;
    t = tt;
  }  
  void display() {
    vertex(x, y, z);
  }
}

void setup() {
  size(640, 320, P3D);
  stroke(#00FF00);
  strokeWeight(10);
  tv1 = new TVertex(50.0, 50.0, 50.0, 0.0);
  tv2 = new TVertex(100.0, 100.0, 100.0, 0.0);
}

void draw() {
  background(255);
  beginShape(LINES);
  tv1.display();
  tv2.display();
  endShape(CLOSE);
  rect(50, 50, 55, 55);
}
