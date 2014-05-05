class Cube {
  private Vertex[] vertArray = new Vertex[]{
    // create 8 vertexes for cube
    new Vertex(50.0, 50.0, -100.0, 1.0),
    new Vertex(150.0, 50.0, -100.0, 1.0),
    new Vertex(150.0, 150.0, -100.0, 1.0),
    new Vertex(50.0, 150.0, -100.0, 1.0),
    new Vertex(50.0, 50.0, 0.0, 1.0),
    new Vertex(150.0, 50.0, 0.0, 1.0),
    new Vertex(150.0, 150.0, 0.0, 1.0),
    new Vertex(50.0, 150.0, 0.0, 1.0)
  };
  private Line[] lineArray = new Line[]{
    // 12 lines out of 8 vertexes
    // clockwise arrangement from top left, first front then back
    new Line(vertArray[0], vertArray[1]),
    new Line(vertArray[1], vertArray[2]),
    new Line(vertArray[2], vertArray[3]),
    new Line(vertArray[3], vertArray[0]),
    new Line(vertArray[0], vertArray[4]),
    new Line(vertArray[1], vertArray[5]),
    new Line(vertArray[2], vertArray[6]),
    new Line(vertArray[3], vertArray[7]),
    new Line(vertArray[4], vertArray[5]),
    new Line(vertArray[5], vertArray[6]),
    new Line(vertArray[6], vertArray[7]),
    new Line(vertArray[7], vertArray[4])
  };
  private float[][] transfArray;
  private Vertex[] newVertArray;
  private Line[] newLineArray;
  
  Cube() {
   this.setVertArray(this.vertArray);
  	this.setLineArray(this.lineArray);
  }
  
  void createArrayFromMouseInput(float x1, float y1, float x2, float y2) {
    vertArray[0] = new Vertex(x1, y1, 0.0, 1.0);
    vertArray[1] = new Vertex(x2, y1, 0.0, 1.0);
    vertArray[2] = new Vertex(x2, y2, 0.0, 1.0);
    vertArray[3] = new Vertex(x1, y2, 0.0, 1.0);
    vertArray[4] = new Vertex(x1, y1, 0.0, 1.0);
    vertArray[5] = new Vertex(x2, y1, 0.0, 1.0);
    vertArray[6] = new Vertex(x2, y2, 0.0, 1.0);
    vertArray[7] = new Vertex(x1, y2, 0.0, 1.0);
  }
  
  void setVertArray(Vertex[] vertArray) {
  	this.vertArray = vertArray;
  }
  
  void setLineArray(Line[] lineArray) {
  	this.lineArray = lineArray;
  }
  
  void setTransfArray(float[][] transfArray) {
    this.transfArray = transfArray;   
  }
  
  void createLineArray(){
    newLineArray = new Line[12];
    newLineArray[0] = new Line(vertArray[0], vertArray[1]);
    newLineArray[1] = new Line(vertArray[1], vertArray[2]);
    newLineArray[2] = new Line(vertArray[2], vertArray[3]);
    newLineArray[3] = new Line(vertArray[3], vertArray[0]);
    newLineArray[4] = new Line(vertArray[0], vertArray[4]);
    newLineArray[5] = new Line(vertArray[1], vertArray[5]);
    newLineArray[6] = new Line(vertArray[2], vertArray[6]);
    newLineArray[7] = new Line(vertArray[3], vertArray[7]);
    newLineArray[8] = new Line(vertArray[4], vertArray[5]);
    newLineArray[9] = new Line(vertArray[5], vertArray[6]);
    newLineArray[10] = new Line(vertArray[6], vertArray[7]);
    newLineArray[11] = new Line(vertArray[7], vertArray[4]);
    setLineArray(newLineArray);
    printArray(newLineArray);
  }
  
  void createLineArray(Vertex[] newVertArray) {
    newLineArray = new Line[12];
    newLineArray[0] = new Line(newVertArray[0], newVertArray[1]);
    newLineArray[1] = new Line(newVertArray[1], newVertArray[2]);
    newLineArray[2] = new Line(newVertArray[2], newVertArray[3]);
    newLineArray[3] = new Line(newVertArray[3], newVertArray[0]);
    newLineArray[4] = new Line(newVertArray[0], newVertArray[4]);
    newLineArray[5] = new Line(newVertArray[1], newVertArray[5]);
    newLineArray[6] = new Line(newVertArray[2], newVertArray[6]);
    newLineArray[7] = new Line(newVertArray[3], newVertArray[7]);
    newLineArray[8] = new Line(newVertArray[4], newVertArray[5]);
    newLineArray[9] = new Line(newVertArray[5], newVertArray[6]);
    newLineArray[10] = new Line(newVertArray[6], newVertArray[7]);
    newLineArray[11] = new Line(newVertArray[7], newVertArray[4]);
    setLineArray(newLineArray);
  }
  
  void display() {
    for (int i=0; i<lineArray.length; i++) {
      lineArray[i].display2D();
    }
  }
  
  void display(Vertex[] newVertArray) {
    for (int i=0; i<lineArray.length; i++) {
      lineArray[i].display2D();
    }
  }
  
  void transform() {
    // new vertex-array for transformed vertexes
    newVertArray = new Vertex[vertArray.length];
    // count rows of transformation matrix
    int transfColumns = this.transfArray[0].length;
    // check if matrix-multiplication is possible
    if (transfColumns != 4) {
      println("transformation Array " + transfColumns + " did not match homogenous coordinate.");
    }
    for (int h=0; h<vertArray.length; h++) {
      // iterate through vertArray
      // return new vertArray
      float[] newCoordinateArray = new float[4];
      for (int i=0; i<transfArray.length; i++) {
        // iterate through each row of transfArray
        // return new Vertex
        float newCoordinate = 0.0;
        // iterate through each value of transfArray-Row 
        // and multiply with Vertex, add to newCoordinate
        newCoordinate += (transfArray[i][0] * vertArray[h].x);
        newCoordinate += (transfArray[i][1] * vertArray[h].y);
        newCoordinate += (transfArray[i][2] * vertArray[h].z);
        newCoordinate += (transfArray[i][3] * vertArray[h].t);
        newCoordinateArray[i] = newCoordinate;
      }
      // asign values of newCoordinateArray to x, y, z or t
      Vertex newVertex = new Vertex(
        newCoordinateArray[0], // assign to x
        newCoordinateArray[1], // assign to y
        newCoordinateArray[2], // assign to z
        newCoordinateArray[3]  // assign to t
      );
      newVertArray[h] = newVertex;
    }
    createLineArray(newVertArray);
  }
}
