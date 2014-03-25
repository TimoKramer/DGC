import processing.core.*; 
import processing.xml.*; 

import java.applet.*; 
import java.awt.Dimension; 
import java.awt.Frame; 
import java.awt.event.MouseEvent; 
import java.awt.event.KeyEvent; 
import java.awt.event.FocusEvent; 
import java.awt.Image; 
import java.io.*; 
import java.net.*; 
import java.text.*; 
import java.util.*; 
import java.util.zip.*; 
import java.util.regex.*; 

public class firstAssig extends PApplet {

class Cube {
  private Vertex[] vertArray = new Vertex[8]{
    // create 8 vertexes for cube
    new Vertex(50.0f, 50.0f, 0.0f, 1.0f),
    new Vertex(150.0f, 50.0f, 0.0f, 1.0f),
    new Vertex(150.0f, 150.0f, 0.0f, 1.0f),
    new Vertex(50.0f, 150.0f, 0.0f, 1.0f),
    new Vertex(50.0f, 50.0f, -100.0f, 1.0f),
    new Vertex(150.0f, 50.0f, -100.0f, 1.0f),
    new Vertex(150.0f, 150.0f, -100.0f, 1.0f),
    new Vertex(50.0f, 150.0f, -100.0f, 1.0f)
  };
  private Line[] lineArray = new Line[12]{
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
  private Float[][] transfArray;
  private Vertex[] newVertArray;
  
  Cube() {
  	this.setVertArray(this.vertArray);
  	this.setLineArray(this.lineArray);
  }
  
  public void setVertArray(Float vertArray[]) {
  	this.vertArray = vertArray;
  }
  
  public void setLineArray(Float lineArray[]) {
  	this.lineArray = lineArray;
  }
  
  public void setTransfArray(Float[][] transfArray) {
    this.transfArray = transfArray;   
  }
  
  public void display() {
    for (int i=0; i<lineArray.length; i++) {
      lineArray[i].display();
    }
  }
  
  public void transform() {
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
      Float[] newCoordinateArray = new Float[4];
      for (int i=0; i<4; i++) {
        // iterate through each row of transfArray
        // return new Vertex
        float newCoordinate = 0.0f;
        for (int j=0; j<4; j++) {
          // iterate through each value of transfArray-Row 
          // and multiply with Vertex, add to newCoordinate
          newCoordinate += (transfArray[i][0] * vertArray[h].x);
          newCoordinate += (transfArray[i][1] * vertArray[h].y);
          newCoordinate += (transfArray[i][2] * vertArray[h].z);
          newCoordinate += (transfArray[i][3] * vertArray[h].t);
        }
        newCoordinateArray[i] = newCoordinate;
        //print("newCoordinate = " + newCoordinate);
      }
      // asign values of newCoordinateArray to x, y, z or t
      Vertex newVertex = new Vertex(
        newCoordinateArray[0], // assign to x
        newCoordinateArray[1], // assign to y
        newCoordinateArray[2], // assign to z
        newCoordinateArray[3]  // assign to t
      );
      print(" newVertex = " + newVertex.x + " " +
      	newVertex.y + " " + newVertex.z + " " + newVertex.t);
      newVertArray[h] = newVertex;
    }
    //print("newVertArray = " + newVertArray);
  }
}

class Line {
  Vertex v1, v2;
  Line(Vertex v1, Vertex v2) {
    this.v1 = v1;
    this.v2 = v2;
  }
  
  public void orthoProjection() {
  	
  }
  public void display() {
    line(v1.x, v1.y, v1.z, v2.x, v2.y, v2.z);
  }
}

class Vertex {
  float x, y, z, t; // t is for transformation
  Vertex(float x, float y, float z, float t) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.t = t;
  }  
  public void display() {
    vertex(x, y, z);
  }
}

// instanciate array and object
Vertex[] vertArray;
Cube cube;
Float[][] transfArray = {   
  {1.0f, 0.0f, 0.0f, 0.0f}, 
  {0.0f, 1.0f, 0.0f, 0.0f}, 
  {0.0f, 0.0f, 1.0f, 0.0f}, 
  {0.0f, 0.0f, 0.0f, 1.0f}
};

public void setup() {
  size(400, 400, P3D);
  stroke(0xff000000);
  strokeWeight(1);
  frameRate(1);
  // create Cube-Object
  cube = new Cube();
}

public void draw() {
  background(255);
  translate(50, 50, 0);
  cube.display();
  transfArray[0][3] += 10.0f;
  cube.setTransfArray(transfArray);
  cube.transform();  
}

    static public void main(String args[]) {
        PApplet.main(new String[] { "--bgcolor=#ECE9D8", "firstAssig" });
    }
}
