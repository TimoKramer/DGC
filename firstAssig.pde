// TVertex tv1, tv2, tv3, tv4, tv5, tv6, tv7, tv8;
TVertex[] tvArray = new TVertex[8]; 

void setup() {
  size(400, 400, P3D);
  stroke(#000000);
  strokeWeight(1);
  tvArray[0] = new TVertex(50.0, 50.0, 0.0, 0.0);
  tvArray[1] = new TVertex(150.0, 50.0, 0.0, 0.0);
  tvArray[2] = new TVertex(150.0, 150.0, 0.0, 0.0);
  tvArray[3] = new TVertex(50.0, 150.0, 0.0, 0.0);
  tvArray[4] = new TVertex(50.0, 50.0, -100.0, 0.0);
  tvArray[5] = new TVertex(150.0, 50.0, -100.0, 0.0);
  tvArray[6] = new TVertex(150.0, 150.0, -100.0, 0.0);
  tvArray[7] = new TVertex(50.0, 150.0, -100.0, 0.0);
  
}

void draw() {
  background(255);
  translate(50, 50, 0);
  beginShape();
  tvArray[0].display();
  tvArray[1].display();
  tvArray[2].display();
  tvArray[3].display();
  endShape(CLOSE);
  translate(100, 100, 0);
  beginShape();
  tvArray[4].display();
  tvArray[5].display();
  tvArray[6].display();
  tvArray[7].display();
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
  TVertex[] tvArray;
  // cube with verteces
  TCube(tvArray[]) {
    this.tvArray[] = tvArray[];      
  }
  void display() {
    beginShape(POINTS);
    for(int i = 0; i < tvArray.length; i++) {
      tvArray[i].display();
    endShape(CLOSE);
  }
}*/
