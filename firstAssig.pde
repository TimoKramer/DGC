// instanciate array and object
Vertex[] vertArray;
float[][] transfArray = {   
    {1.0, 0.0, 0.0, 1.0}, 
    {0.0, 1.0, 0.0, 1.0}, 
    {0.0, 0.0, 1.0, 1.0}, 
    {0.0, 0.0, 0.0, 1.0}
};
Cube cube;
Object object;
UI UI;
int factor;
Vertex click, drag;

void setup() {
  translate(0, 0);
  background(255);
  size(800, 600, P3D);
  UI = new UI();
  stroke(#000000);
  strokeWeight(1);
  frameRate(60);
  translate(300, 200, -500);
  // create Cube-Object
  //cube = new Cube();
  // create custom Object
  //object = new Object();
  //object.display();
  click = new Vertex(0, 0, 0, 0);
  drag = new Vertex(0, 0, 0, 0);
}

void draw() {
  background(#FFFFFF);
  UI = new UI(UI.modus);
  stroke(#000000);
  // MOUSE INTERACTION
  UI.buttonChecker();
  UI.setMouseInput(click, drag);
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
  /* rotation about the z-axis
  transfArray[0][0] = cos(QUARTER_PI);
  transfArray[0][1] = -sin(QUARTER_PI);
  transfArray[1][0] = sin(QUARTER_PI);
  transfArray[1][1] = cos(QUARTER_PI);
  */
  /* rotation about the x-axis
  transfArray[1][1] = cos(QUARTER_PI);
  transfArray[1][2] = -sin(QUARTER_PI);
  transfArray[2][1] = sin(QUARTER_PI);
  transfArray[2][2] = cos(QUARTER_PI);
  */
  /* rotation about the y-axis
  transfArray[0][0] = cos(QUARTER_PI);
  transfArray[0][2] = sin(QUARTER_PI);
  transfArray[2][0] = -sin(QUARTER_PI);
  transfArray[2][2] = cos(QUARTER_PI);
  */
  //object.transform(transfArray);
  //object.display();
}

void mousePressed() {
  click.set(mouseX, mouseY, 0, 0);
  drag.set(0, 0, 0, 0);
}

void mouseDragged() {
  translate(click.x, click.y, 0);
  drag.set(mouseX, mouseY, 0, 0);
  translate(300, 200, -500);
}

void mouseReleased() {
  UI.MI.x2 = mouseX;
  UI.MI.y2 = mouseY;
}

