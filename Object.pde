private static int rotations = 8; 

class Object {
  private Vertex[] vertArray = new Vertex[] {
    new Vertex(0.0, 0.0, 0.0, 1.0), 
    new Vertex(50.0, 50.0, 0.0, 1.0), 
    new Vertex(70.0, 100.0, 0.0, 1.0), 
    new Vertex(80.0, 150.0, 0.0, 1.0), 
    new Vertex(70.0, 200.0, 0.0, 1.0), 
    new Vertex(50.0, 250.0, 0.0, 1.0), 
    new Vertex(20.0, 300.0, 0.0, 1.0),
  };
  private Line[] lineArray;
  private Vertex[][] rotationArray;

  Object() {
    this.setVertArray(this.vertArray);
    this.createLineArray(this.rotationArray);
    this.setLineArray(this.lineArray);
  }

  void setVertArray(Vertex[] vertArray) {
    rotationArray = new Vertex[rotations][vertArray.length];
    rotationArray[0] = vertArray;
    for (int j=1; j<rotations; j++) {
      /*
    *  take user-defined Vertexes and rotate them 7 times to form Object
       */
      float[][] transfArray = {   
        {
          cos(j*QUARTER_PI), 0.0, sin(j*QUARTER_PI), 0.0
        }
        , 
        {
          0.0, 1.0, 0.0, 0.0
        }
        , 
        {
          -sin(j*QUARTER_PI), 0.0, cos(j*QUARTER_PI), 0.0
        }
        , 
        {
          0.0, 0.0, 0.0, 1.0
        }
      };
      Vertex[] newRotationArray = new Vertex[vertArray.length];
      /*
      *  iterate through vertArray
       */
      for (int h=0; h<vertArray.length; h++) {
        float[] newCoordinateArray = new float[4];
        /*
        *  iterate through each row of transfArray
         *  create newCoordinateArray
         */
        for (int i=0; i<transfArray.length; i++) {
          float newCoordinate = 0.0;
          /* 
           *  multiply each value of transfArray-Row with
           *  corresponding Vertex-value and add to newCoordinate
           */
          newCoordinate += (transfArray[i][0] * vertArray[h].x);
          newCoordinate += (transfArray[i][1] * vertArray[h].y);
          newCoordinate += (transfArray[i][2] * vertArray[h].z);
          newCoordinate += (transfArray[i][3] * vertArray[h].t);
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
      }
      // create multidimensional array full with rotated Vertexes
      rotationArray[j] = newRotationArray;
    }
  }

  void setLineArray(Line[] lineArray) {
    this.lineArray = lineArray;
  }

  void createLineArray(Vertex[][] rotationArray) {
    int lastEl = rotationArray[0].length-1;
    Line[] newLineArray;
    newLineArray = new Line[0];
    for (int j=0; j<rotationArray.length; j++) {
      if (j!=7){
        for (int i=0; i<rotationArray[0].length-1; i++) {
          Line line1 = new Line(rotationArray[j][i], rotationArray[j+1][i]);
          newLineArray = (Line[]) append(newLineArray, line1);
          Line line2 = new Line(rotationArray[j][i], rotationArray[j+1][i+1]);
          newLineArray = (Line[]) append(newLineArray, line2); 
          Line line3 = new Line(rotationArray[j][i], rotationArray[j][i+1]);
          newLineArray = (Line[]) append(newLineArray, line3);
        }
        Line lowLine = new Line(rotationArray[j][lastEl], rotationArray[j+1][lastEl]);
        newLineArray = (Line[]) append(newLineArray, lowLine);
      } else {
        for (int i=0; i<rotationArray[0].length-1; i++) {
          Line line1 = new Line(rotationArray[j][i], rotationArray[0][i]);
          newLineArray = (Line[]) append(newLineArray, line1);
          Line line2 = new Line(rotationArray[j][i], rotationArray[0][i+1]);
          newLineArray = (Line[]) append(newLineArray, line2); 
          Line line3 = new Line(rotationArray[j][i], rotationArray[j][i+1]);
          newLineArray = (Line[]) append(newLineArray, line3);
        }
        Line lowLine = new Line(rotationArray[j][lastEl], rotationArray[0][lastEl]);
        newLineArray = (Line[]) append(newLineArray, lowLine);
      }
    }
    //printArray(newLineArray);
    setLineArray(newLineArray);
  }

  void display() {
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

