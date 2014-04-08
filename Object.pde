class Object {
  private Vertex[] vertArray = new Vertex[]{
      new Vertex(0.0, 0.0, 0.0, 1.0),
      new Vertex(50.0, 50.0, 0.0, 1.0),
      new Vertex(70.0, 100.0, 0.0, 1.0),
      new Vertex(80.0, 150.0, 0.0, 1.0),
      new Vertex(70.0, 200.0, 0.0, 1.0),
      new Vertex(50.0, 250.0, 0.0, 1.0),
      new Vertex(20.0, 300.0, 0.0, 1.0),
  };
  private Line[] lineArray;
  private float[][] transfArray;
  private Line[] newLineArray;
  
  Object() {
   this.setVertArray(this.vertArray);
   this.setLineArray(this.lineArray);
  }
  
  void setVertArray(Vertex[] vertArray) {
    Vertex[] newVertArray = new Vertex[vertArray.length * 8];
    arrayCopy(vertArray, newVertArray);
    // take Vertexes as Input and rotate them 7 times to form Object
    for (int j=1; j<8; j++) {
      float[][] transfArray = {   
        {1.0, 0.0, 0.0, 0.0}, 
        {0.0, 1.0, 0.0, 0.0}, 
        {0.0, 0.0, 1.0, 0.0}, 
        {0.0, 0.0, 0.0, 1.0}
      };
      float mySin = sin(j*QUARTER_PI);
      float myCos = cos(j*QUARTER_PI);
      transfArray[0][0] = myCos;
      transfArray[0][2] = mySin;
      transfArray[2][0] = -mySin;
      transfArray[2][2] = myCos;
      // multiply each Vertex from vertArray with transfArray
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
        append(newVertArray, newVertex);
      }
    }
    this.vertArray = newVertArray;
    print(this.vertArray);
  }
  
  void setLineArray(Line[] lineArray) {
    this.lineArray = lineArray;
  }
  
  void setTransfArray(float[][] transfArray) {
    this.transfArray = transfArray;   
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
  
  /*
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
  */
}
