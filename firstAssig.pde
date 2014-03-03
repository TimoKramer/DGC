TVertex tv1, tv2, tv3;

void setup() {
  size(800, 800, P3D);
  stroke(#00FF00);
  strokeWeight(10);
  tv1 = new TVertex(444.0, 111.0, 0.0, 0.0);
  tv2 = new TVertex(555.0, 222.0, 0.0, 0.0);
  tv3 = new TVertex(666.0, 333.0, 0.0, 0.0);
}

void draw() {
  background(255);
  translate(50, 50, 0);
  beginShape();
  vertex(10,10,10);
  tv1.display();
  tv2.display();
  tv3.display();
  vertex(20,20,20);
  endShape();
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
