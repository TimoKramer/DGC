TVertex tv1, tv2, tv3, tv4;

void setup() {
  size(640, 320);
  fill(255, 204);
  noStroke();
  tv1 = new TVertex();
  tv2 = new TVertex();
  tv3 = new TVertex();
  tv4 = new TVertex();
}

void draw() {
  background(0);
  
  tv1.display();
  tv2.display();
  tv3.display();
  tv4.display();
}

// creating class for transformable vertexes
class TVertex() {
  
