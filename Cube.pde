class Cube {
  Vertex[] vertArray;
  Line[] lineArray;
  Cube(Vertex[] vertArray) {
    this.vertArray = vertArray;
    // 12 lines out of 8 vertexes
    // clockwise arrangement from top left, first front then back
    lineArray = new Line[12];
    lineArray[0] = new Line(vertArray[0], vertArray[1]);
    lineArray[1] = new Line(vertArray[1], vertArray[2]);
    lineArray[2] = new Line(vertArray[2], vertArray[3]);
    lineArray[3] = new Line(vertArray[3], vertArray[0]);
    lineArray[4] = new Line(vertArray[0], vertArray[4]);
    lineArray[5] = new Line(vertArray[1], vertArray[5]);
    lineArray[6] = new Line(vertArray[2], vertArray[6]);
    lineArray[7] = new Line(vertArray[3], vertArray[7]);
    lineArray[8] = new Line(vertArray[4], vertArray[5]);
    lineArray[9] = new Line(vertArray[5], vertArray[6]);
    lineArray[10] = new Line(vertArray[6], vertArray[7]);
    lineArray[11] = new Line(vertArray[7], vertArray[4]);
  }
  void display() {
    for (int i=0; i<lineArray.length; i++) {
      lineArray[i].display();
    }
  }
  void transform(float[][] transfArray, Vertex[] vertArray) {
    // new vertex-array for transformed vertexes
    Vertex[] newVertArray = new Vertex[vertArray.length];
    // count rows and columns
    int transfRows = transfArray.length;
    int transfColumns = transfArray[0].length;
    int vertRows = vertArray.length;
    // check if matrix-multiplication is possible
    if (transfColumns != vertRows) {
      println("transformation Array " + transfColumns + " did not match number of Vertexes " + vertRows + ".");
    }
    for (int h=0; h<vertArray.length; h++) {
      // iterate through vertArray
      // return new vertArray
      Float[] newCoordinateArray = new Float[4];
      for (int i=0; i<4; i++) {
        // multiply each row of transfArray with current vertex
        // return new Vertex
        float newCoordinate = 0.0;
        for (int j=0; j<4; j++) {
          // iterate transfArray and multiply with Vertex
          // return newCoordinate
          newCoordinate += transfArray[j][0] * vertArray[h].x;
          newCoordinate += transfArray[j][1] * vertArray[h].y;
          newCoordinate += transfArray[j][2] * vertArray[h].z;
          newCoordinate += transfArray[j][3] * vertArray[h].t;
        }
        newCoordinateArray[i] = newCoordinate;
      }
   // asTODO aign values of newCoordinateArray to x, y, z or t
      Vertex newVertex = new Vertex(
        newCoordinateArray[0],
        newCoordinateArray[1],
        newCoordinateArray[2],
        newCoordinateArray[3]
      );
    newVertArray[h] = newVertex;
    this.vertArray = newVertArray;
    this.display();
    }
  }
}

