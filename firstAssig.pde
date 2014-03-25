// instanciate array and object
Vertex[] vertArray;
Cube cube;
Float[][] transfArray = {   
  {1.0, 0.0, 0.0, 0.0}, 
  {0.0, 1.0, 0.0, 0.0}, 
  {0.0, 0.0, 1.0, 0.0}, 
  {0.0, 0.0, 0.0, 1.0}
};

void setup() {
  background(255);
  size(1000, 1000, P3D);
  stroke(#000000);
  strokeWeight(1);
  frameRate(1);
  // create Cube-Object
  cube = new Cube();
  cube.display();
}

void draw() {
  translate(50, 50, 0);
  transfArray[0][3] += 10.0;
  cube.setTransfArray(transfArray);
  cube.transform();
  cube.display();
}
