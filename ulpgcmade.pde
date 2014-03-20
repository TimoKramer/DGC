// instanciate array and object
Vertex[] vertArray;
Cube cube;

void setup() {
  size(400, 400, P3D);
  stroke(#000000);
  strokeWeight(1);
  frameRate(30);
  // create Cube-Object with array-argument
  cube = new Cube();
}

void draw() {
  background(255);
  translate(50, 50, 0);
  cube.createLineArray();
  cube.display();
  cube.createTransfArray();
  cube.transform();  
  cube.transfArray[0][3] += 10.0;
  //print(transfArray[0][3]);
}
