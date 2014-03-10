class Cube {
  Vertex[] vertArray;
  Vector[] vectArray;
  Cube(Vertex[] vertArray) {
    this.vertArray = vertArray;
    // 12 vectors out of 8 vertexes
    // clockwise arrangement from top left, first front then back
    vectArray = new Vector[12];
    vectArray[0] = new Vector(vertArray[0], vertArray[1]);
    vectArray[1] = new Vector(vertArray[1], vertArray[2]);
    vectArray[2] = new Vector(vertArray[2], vertArray[3]);
    vectArray[3] = new Vector(vertArray[3], vertArray[0]);
    vectArray[4] = new Vector(vertArray[0], vertArray[4]);
    vectArray[5] = new Vector(vertArray[1], vertArray[5]);
    vectArray[6] = new Vector(vertArray[2], vertArray[6]);
    vectArray[7] = new Vector(vertArray[3], vertArray[7]);
    vectArray[8] = new Vector(vertArray[4], vertArray[5]);
    vectArray[9] = new Vector(vertArray[5], vertArray[6]);
    vectArray[10] = new Vector(vertArray[6], vertArray[7]);
    vectArray[11] = new Vector(vertArray[7], vertArray[4]);    
  }
  void display() {
    for(int i=0; i<vectArray.length; i++) {
      vectArray[i].display();
    }
  }
  void transform(float[][] transfArray, Vertex[] vertArray) {
    this.transfArray = transfArray;
    this.vertArray = vertArray;
    // count rows and columns
    int transfRows = transfArray.length;
    int transfColumns = transfArray[0].length;
    int vertRows = vertArray.length;
    // check if matrix-multiplication is possible
    if (transfColumns != vertRows) {
            throw new IllegalArgumentException("transformation Array " + transfColumns + " did not match number of Vertexes " + vertRows + ".");
    }
    // new vertex-array for transformed vertex
    Vertex[] newVertArray;

    for(int j=0; j<vertArray.length; j++) {
      float newCoordinateArray[] = {0.0, 0.0, 0.0, 1.0};
      for(int i=0; i<4; i++) {
        float newCoordinate = 0.0;
        newCoordinate += transfArray[i][0] * vertArray[i].x;
        newCoordinate += transfArray[i][1] * vertArray[i].y;
        newCoordinate += transfArray[i][2] * vertArray[i].z;
        newCoordinate += transfArray[i][3] * vertArray[i].t;
        return newCoordinate;
      }
      newCoordinateArray[j] = newCoordinate;
    }
    // TODO assign values of newCoordinateArray to x, y, z or t
    newVertArray[j] = new Vertex(float x, float y, float z, float t);
  }
}
