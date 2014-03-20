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

// instanciate array and object
Vertex[] vertArray;
Cube cube;
//Vertex v1, v2;
//Vector vector;

public void setup() {
  size(400, 400, P3D);
  stroke(0xff000000);
  strokeWeight(1);
  // create 8 vertexes for cube
  vertArray = new Vertex[8];
  vertArray[0] = new Vertex(50.0f, 50.0f, 0.0f, 1.0f);
  vertArray[1] = new Vertex(150.0f, 50.0f, 0.0f, 1.0f);
  vertArray[2] = new Vertex(150.0f, 150.0f, 0.0f, 1.0f);
  vertArray[3] = new Vertex(50.0f, 150.0f, 0.0f, 1.0f);
  vertArray[4] = new Vertex(50.0f, 50.0f, -100.0f, 1.0f);
  vertArray[5] = new Vertex(150.0f, 50.0f, -100.0f, 1.0f);
  vertArray[6] = new Vertex(150.0f, 150.0f, -100.0f, 1.0f);
  vertArray[7] = new Vertex(50.0f, 150.0f, -100.0f, 1.0f);
  // create Cube-Object with array-argument
  cube = new Cube(vertArray);
  // create Vector-Object with two Vertexes
  //v1 = new Vertex(50.0, 50.0, 0.0, 1.0);
  //v2 = new Vertex(150.0, 50.0, 0.0, 1.0);
  //vector = new Vector(v1, v2);
}

public void draw() {
  background(255);
  translate(50, 50, 0);
  cube.display();
  //vector.display();
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

class Vector {
  Vertex v1, v2;
  Vector(Vertex v1, Vertex v2) {
    this.v1 = v1;
    this.v2 = v2;
  }
  public void display() {
    line(v1.x, v1.y, v1.z, v2.x, v2.y, v2.z);
  }
}

// clockwise arrangement from top left, first front then back
class Cube {
  Vertex[] vertArray;
  Vector[] vectArray;
  Cube(Vertex[] vertArray) {
    this.vertArray = vertArray;
    // 12 vectors out of 8 vertexes
    vectArray = new Vector[12];
    vectArray[0] = new Vector(vertArray[0], vertArray[1]);
    vectArray[1] = new Vector(vertArray[1], vertArray[2]);
    vectArray[2] = new Vector(vertArray[2], vertArray[3]);
    vectArray[3] = new Vector(vertArray[3], vertArray[1]);
    vectArray[4] = new Vector(vertArray[0], vertArray[4]);
    vectArray[5] = new Vector(vertArray[1], vertArray[5]);
    vectArray[6] = new Vector(vertArray[2], vertArray[6]);
    vectArray[7] = new Vector(vertArray[3], vertArray[7]);
    vectArray[8] = new Vector(vertArray[4], vertArray[5]);
    vectArray[9] = new Vector(vertArray[5], vertArray[6]);
    vectArray[10] = new Vector(vertArray[6], vertArray[7]);
    vectArray[11] = new Vector(vertArray[7], vertArray[4]);    
  }
  public void display() {
    for(int i=0; i<vectArray.length; i++) {
      vectArray[i].display();
    }
  }
}

    static public void main(String args[]) {
        PApplet.main(new String[] { "--bgcolor=#ECE9D8", "firstAssig" });
    }
}