TVertex tv1, tv2, tv3, tv4;

void setup() {
  size(800, 800, P3D);
  stroke(#00FF00);
  strokeWeight(10);
  tv1 = new TVertex(150.0, 150.0, 0.0, 0.0);
  tv2 = new TVertex(550.0, 150.0, 0.0, 0.0);
  tv3 = new TVertex(550.0, 550.0, 0.0, 0.0);
  tv4 = new TVertex(150.0, 550.0, 0.0, 0.0);
}

void draw() {
  background(255);
  translate(50, 50, 0);
  beginShape();
  tv1.display();
  tv2.display();
  tv3.display();
  tv4.display();
  endShape(CLOSE);
  //rect(50, 50, 55, 55);
}

// creating class for transformable vertexes
class TVertex {
  float x, y, z, t;
  
  TVertex(float x, float y, float z, float t) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.t = t;
  }  
  void display() {
    vertex(x, y, z);
  }
}
