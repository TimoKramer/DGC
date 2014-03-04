// instanciate array and object
TVertex[] tvArray;
TCube cube;

void setup() {
  size(400, 400, P3D);
  stroke(#000000);
  strokeWeight(1);
  // create Vertex-Array
  tvArray = new TVertex[8];
  tvArray[0] = new TVertex(50.0, 50.0, 0.0, 0.0);
  tvArray[1] = new TVertex(150.0, 50.0, 0.0, 0.0);
  tvArray[2] = new TVertex(150.0, 150.0, 0.0, 0.0);
  tvArray[3] = new TVertex(50.0, 150.0, 0.0, 0.0);
  tvArray[4] = new TVertex(50.0, 50.0, -100.0, 0.0);
  tvArray[5] = new TVertex(150.0, 50.0, -100.0, 0.0);
  tvArray[6] = new TVertex(150.0, 150.0, -100.0, 0.0);
  tvArray[7] = new TVertex(50.0, 150.0, -100.0, 0.0);
  // create Cube-Object with tvArray
  cube = new TCube(tvArray);
}

void draw() {
  background(255);
  translate(50, 50, 0);
  /*
  //draw Vertexes
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
  */
  // draw Object with Array-Argument
  cube.display();
}

class TVertex {
  float x, y, z, t; // t is for transformation
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

class TCube {
  TVertex[] tvArray;
  TCube(TVertex[] tvArray) {
    this.tvArray = tvArray;      
  }
  void display() {
    beginShape();
    for(int i = 0; i < tvArray.length-4; i++) {
      tvArray[i].display();
    endShape(CLOSE);
    }
  }
}
