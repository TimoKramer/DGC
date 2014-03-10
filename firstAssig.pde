// instanciate array and object
Vertex[] vertArray;
Cube cube;
float[][] transfArray = {   {1.0, 0, 0, 10.0},
                            {0, 1.0, 0, 10.0},
                            {0, 0, 1.0, 10.0},
                            {0, 0, 0, 1}  };

void setup() {
  size(400, 400, P3D);
  stroke(#000000);
  strokeWeight(1);
  // create 8 vertexes for cube
  vertArray = new Vertex[8];
  vertArray[0] = new Vertex(50.0, 50.0, 0.0, 1.0);
  vertArray[1] = new Vertex(150.0, 50.0, 0.0, 1.0);
  vertArray[2] = new Vertex(150.0, 150.0, 0.0, 1.0);
  vertArray[3] = new Vertex(50.0, 150.0, 0.0, 1.0);
  vertArray[4] = new Vertex(50.0, 50.0, -100.0, 1.0);
  vertArray[5] = new Vertex(150.0, 50.0, -100.0, 1.0);
  vertArray[6] = new Vertex(150.0, 150.0, -100.0, 1.0);
  vertArray[7] = new Vertex(50.0, 150.0, -100.0, 1.0);
  // create Cube-Object with array-argument
  cube = new Cube(vertArray);
}

void draw() {
  background(255);
  translate(50, 50, 0);
  cube.display();
  cube.transform(transfArray);
}
