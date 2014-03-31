// instanciate array and object
Vertex[] vertArray;
Cube cube;
float[][] transfArray = {   
  {1.0, 0.0, 0.0, 0.0}, 
  {0.0, 1.0, 0.0, 0.0}, 
  {0.0, 0.0, 1.0, 0.0}, 
  {0.0, 0.0, 0.0, 1.0}
};
int factor;

void setup() {
  background(255);
  size(800, 600, P2D);
  stroke(#000000);
  strokeWeight(1);
  frameRate(1);
  // create Cube-Object
  cube = new Cube();
}

void draw() {
  /* translation along y-axis
  //transfArray[0][3] += 10.0;
  */
  /* scaling
  transfArray[0][0] += 1.0;
  transfArray[1][1] += 1.0;
  transfArray[2][2] += 1.0;
  */
  // rotation about the z-axis
  factor += 1;
  float mySin = sin(factor*QUARTER_PI);
  float myCos = cos(factor*QUARTER_PI);
  transfArray[1][1] = myCos;
  transfArray[1][2] = -mySin;
  transfArray[2][1] = mySin;
  transfArray[2][2] = myCos;
  //print(transfArray[1][1]);
  //print(transfArray[1][2]);
  //print(transfArray[2][1]);
  //print(transfArray[2][2]);

  translate(300, 300);
  cube.display();
  cube.setTransfArray(transfArray);
  cube.transform();
}
