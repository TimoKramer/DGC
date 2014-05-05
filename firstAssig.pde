// instanciate array and object
Vertex[] vertArray;
float[][] transfArray = {   
    {1.0, 0.0, 0.0, 0.0}, 
    {0.0, 1.0, 0.0, 0.0}, 
    {0.0, 0.0, 1.0, 0.0}, 
    {0.0, 0.0, 0.0, 1.0}
};
//Cube cube;
Object object;
UI UI;
int factor;

void setup() {
  translate(0, 0);
  background(255);
  size(800, 600, P3D);
  UI = new UI();
  stroke(#000000);
  strokeWeight(1);
  frameRate(1);
  // create Cube-Object
  // cube = new Cube();
  // create custom Object
  translate(300, 200, -500);
  object = new Object();
  object.display();
}

void draw() {
  translate(300, 200, -500);
  stroke(#000000);
  // CUBE 
  /* translation along y-axis
  //transfArray[0][3] += 10.0;
  */
  /* scaling
  transfArray[0][0] += 1.0;
  transfArray[1][1] += 1.0;
  transfArray[2][2] += 1.0;
  */
  /* rotation about the z-axis
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
  cube.display();
  cube.setTransfArray(transfArray);
  cube.transform();
  */
  
  // OBJECT
  // translation along y-axis
  //transfArray[1][3] += 20.0;
  
  // scaling
  /*
  transfArray[0][0] += 1.0;
  transfArray[1][1] += 1.0;
  transfArray[2][2] += 1.0;
  */
  // rotation about the z-axis
  factor += 1;
  float mySin = sin(factor*QUARTER_PI);
  float myCos = cos(factor*QUARTER_PI);
  transfArray[0][0] = myCos;
  transfArray[0][1] = -mySin;
  transfArray[1][0] = mySin;
  transfArray[1][1] = myCos;
  object.transform(transfArray);
  object.display();
  
  // MOUSE INTERACTION
  UI.mouseClickChecker();
}

void mousePressed() {
  UI.MI.x1 = mouseX;
  UI.MI.x1 = mouseY;
}

void mouseReleased() {
  UI.MI.x2 = mouseX;
  UI.MI.y2 = mouseY;
}

