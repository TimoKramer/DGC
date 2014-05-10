private static int rotations = 8; 

class Object {
  private Vertex[] originalPointArray = new Vertex[] {
    new Vertex(0.0, -150.0, 0.0, 1.0), 
    new Vertex(50.0, -100.0, 0.0, 1.0), 
    new Vertex(70.0, -50.0, 0.0, 1.0), 
    new Vertex(80.0, 0.0, 0.0, 1.0), 
    new Vertex(70.0, 50.0, 0.0, 1.0), 
    new Vertex(50.0, 100.0, 0.0, 1.0), 
    new Vertex(20.0, 150.0, 0.0, 1.0),
  };
  private float[][] transfArray = {   
    {1.0, 0.0, 0.0, 0.0}, 
    {0.0, 1.0, 0.0, 0.0}, 
    {0.0, 0.0, 1.0, 0.0}, 
    {0.0, 0.0, 0.0, 1.0}
  };
  private Line[] lineArray;
  private Vertex[][] pointsForRevolutionObject;

  Object() {
    this.setPointsForRevolutionObject(this.originalPointArray);
    this.createLineArray(this.pointsForRevolutionObject);
    this.setLineArray(this.lineArray);
  }

  void setOriginalPointArray(Vertex[] originalPointArray) {
    this.originalPointArray = originalPointArray;
  }

  Vertex[] getOriginalPointArray() {
    return this.originalPointArray;
  }

  void setTransfArray(float[][] transfArray) {
    this.transfArray = transfArray;
  }

  float[][] getTransfArray() {
    return this.transfArray;
  }

  void setPointsForRevolutionObject(Vertex[] pointArray) {
    pointsForRevolutionObject = new Vertex[rotations][pointArray.length];
    pointsForRevolutionObject[0] = pointArray;
    for (int j=1; j<rotations; j++) {
      /*
       *  take user-defined Vertexes and rotate them 7 times to form Object
       */
      float[][] rotationTransformationArray = {   
        {cos(j*QUARTER_PI), 0.0, sin(j*QUARTER_PI), 0.0}, 
        {0.0, 1.0, 0.0, 0.0}, 
        {-sin(j*QUARTER_PI), 0.0, cos(j*QUARTER_PI), 0.0}, 
        {0.0, 0.0, 0.0, 1.0}
      };
      Vertex[] newRotationArray = new Vertex[pointArray.length];
      /*
       *  iterate through pointArray
       */
      for (int h=0; h<pointArray.length; h++) {
        float[] newCoordinateArray = new float[4];
        /*
         *  iterate through each row of rotationTransformationArray
         *  create newCoordinateArray
         */
        for (int i=0; i<rotationTransformationArray.length; i++) {
          float newCoordinate = 0.0;
          /* 
           *  multiply each value of rotTransformationArray-Row with
           *  corresponding Vertex-value and add to newCoordinate
           */
          newCoordinate += (rotationTransformationArray[i][0] * pointArray[h].x);
          newCoordinate += (rotationTransformationArray[i][1] * pointArray[h].y);
          newCoordinate += (rotationTransformationArray[i][2] * pointArray[h].z);
          newCoordinate += (rotationTransformationArray[i][3] * pointArray[h].t);
          //print(newCoordinate);
          newCoordinateArray[i] = newCoordinate;
          //printArray(newCoordinateArray);
        }
        // asign values of newCoordinateArray to x, y, z or t
        Vertex newVertex = new Vertex(
        newCoordinateArray[0], // assign to x
        newCoordinateArray[1], // assign to y
        newCoordinateArray[2], // assign to z
        newCoordinateArray[3]  // assign to t
        );
        newRotationArray[h] = newVertex;
        /*
        println();
        println("rotation: " + j);
        print(" x:" + newVertex.x);
        print(" y:" + newVertex.y);
        print(" z:" + newVertex.z);
        print(" t:" + newVertex.t);
        */
      }
      // create multidimensional array full with rotated Vertexes
      pointsForRevolutionObject[j] = newRotationArray;
    }
  }

  Vertex[][] getPointsForRevolutionObject() {
    return this.pointsForRevolutionObject;
  }

  void setLineArray(Line[] lineArray) {
    this.lineArray = lineArray;
  }

  Line[] getLineArray() {
    return this.lineArray;
  }

  void createLineArray(Vertex[][] pointsForRevolutionObject) {
    int lastEl = pointsForRevolutionObject[0].length-1;
    Line[] newLineArray;
    newLineArray = new Line[0];
    for (int j=0; j<pointsForRevolutionObject.length; j++) {
      if (j!=7) {
        for (int i=0; i<pointsForRevolutionObject[0].length-1; i++) {
          Line line1 = new Line(pointsForRevolutionObject[j][i], pointsForRevolutionObject[j+1][i]);
          newLineArray = (Line[]) append(newLineArray, line1);
          Line line2 = new Line(pointsForRevolutionObject[j][i], pointsForRevolutionObject[j+1][i+1]);
          newLineArray = (Line[]) append(newLineArray, line2); 
          Line line3 = new Line(pointsForRevolutionObject[j][i], pointsForRevolutionObject[j][i+1]);
          newLineArray = (Line[]) append(newLineArray, line3);
        }
        Line lowLine = new Line(pointsForRevolutionObject[j][lastEl], pointsForRevolutionObject[j+1][lastEl]);
        newLineArray = (Line[]) append(newLineArray, lowLine);
      } 
      else {
        for (int i=0; i<pointsForRevolutionObject[0].length-1; i++) {
          Line line1 = new Line(pointsForRevolutionObject[j][i], pointsForRevolutionObject[0][i]);
          newLineArray = (Line[]) append(newLineArray, line1);
          Line line2 = new Line(pointsForRevolutionObject[j][i], pointsForRevolutionObject[0][i+1]);
          newLineArray = (Line[]) append(newLineArray, line2); 
          Line line3 = new Line(pointsForRevolutionObject[j][i], pointsForRevolutionObject[j][i+1]);
          newLineArray = (Line[]) append(newLineArray, line3);
        }
        Line lowLine = new Line(pointsForRevolutionObject[j][lastEl], pointsForRevolutionObject[0][lastEl]);
        newLineArray = (Line[]) append(newLineArray, lowLine);
      }
    }
    //printArray(newLineArray);
    setLineArray(newLineArray);
  }

  void display() {
    for (int i=0; i<lineArray.length; i++) {
      this.lineArray[i].display2D();
    }
  }

  void transform(float[][] transfArray) {
    setTransfArray(transfArray);
    // new vertex-array for transformed vertexes
    Vertex[][] newPointsForRevolutionObject = new Vertex[pointsForRevolutionObject.length][pointsForRevolutionObject[0].length];
    // count rows of transformation matrix
    int transfColumns = this.transfArray[0].length;
    // check if matrix-multiplication is possible
    if (transfColumns != 4) {
      println("transformation Array " + transfColumns + " did not match homogenous coordinate.");
    }
    for (int h=0; h<pointsForRevolutionObject.length; h++) {
      for (int j=0; j<pointsForRevolutionObject[0].length; j++) {
        // iterate through vertArray
        // return new vertArray
        float[] newCoordinateArray = new float[4];
        for (int i=0; i<transfArray.length; i++) {
          // iterate through each row of transfArray
          // return new Vertex
          float newCoordinate = 0.0;
          // iterate through each value of transfArray-Row 
          // and multiply with Vertex, add to newCoordinate
          newCoordinate += (transfArray[i][0] * pointsForRevolutionObject[h][j].x);
          newCoordinate += (transfArray[i][1] * pointsForRevolutionObject[h][j].y);
          newCoordinate += (transfArray[i][2] * pointsForRevolutionObject[h][j].z);
          newCoordinate += (transfArray[i][3] * pointsForRevolutionObject[h][j].t);
          newCoordinateArray[i] = newCoordinate;
        }
        // asign values of newCoordinateArray to x, y, z or t
        Vertex newVertex = new Vertex(
        newCoordinateArray[0], // assign to x
        newCoordinateArray[1], // assign to y
        newCoordinateArray[2], // assign to z
        newCoordinateArray[3]  // assign to t
        );
        /** Printing Transformation
        println();
        println("old Point " );
        print(" " + pointsForRevolutionObject[h][j].x);
        print(" " + pointsForRevolutionObject[h][j].y);
        print(" " + pointsForRevolutionObject[h][j].z);
        print(" " + pointsForRevolutionObject[h][j].t);
        println();
        pointsForRevolutionObject[h][j] = newVertex;
        println("new Point ");
        print(" " + pointsForRevolutionObject[h][j].x);
        print(" " + pointsForRevolutionObject[h][j].y);
        print(" " + pointsForRevolutionObject[h][j].z);
        print(" " + pointsForRevolutionObject[h][j].t);
        println();
        **/
      }
    }
    //setOriginalPointArray(newVertArray);
    //setPointsForRevolutionObject(newVertArray);
    createLineArray(getPointsForRevolutionObject());
    display();
  }
}

