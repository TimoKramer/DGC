TVertex tv1, tv2, tv3, tv4;

void setup() {
  size(800, 800, P3D);
  stroke(#000000);
  strokeWeight(1);
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
}

// creating class for transformable vertexes
class TVertex {
  float x, y, z, t; // t is transformation 
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

/* creating class for transformable 3DCUBE
class 3DTCube {
  float[] tv8Array = new float[8];
  float[] tv4Array = new float[4];
  // cube with four verteces
  TCube() {
    this.tv1 = tv1;
    this.tv2 = tv2;
    this.tv3 = tv3;
    this.tv4 = tv4;
  }
  // cube with eight verteces
  TCube() {
    this.tv1 = tv1;
    this.tv2 = tv2;
    this.tv3 = tv3;
    this.tv4 = tv4;
    this.tv5 = tv5;
    this.tv6 = tv6;
    this.tv7 = tv7;
    this.tv8 = tv8;
  }
  void display() {
    beginShape(POINTS);
    tv1.display();
    tv2.display();
    tv3.display();
    tv4.display();
    endShape(CLOSE);
  }
}
*/
