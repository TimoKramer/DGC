private static final int K = -200;

class Line {
  Vertex v1, v2;
  Line(Vertex v1, Vertex v2) {
    this.v1 = v1;
    this.v2 = v2;
  }
  float projX1, projY1, projX2, projY2;
  
  // Translation of the automated 3DLine to a 2DLine
  void display2D() {
    projX1 = this.v1.x/(1+(this.v1.z/K));
    projY1 = this.v1.y/(1+(this.v1.z/K));
    projX2 = this.v2.x/(1+(this.v2.z/K));
    projY2 = this.v2.y/(1+(this.v2.z/K));
    //print(projX1, projY1, projX2, projY2);
    line(projX1, projY1, projX2, projY2);
  }

  void display() {
    print(v1.x, v1.y, v1.z, v2.x, v2.y, v2.z);
    line(v1.x, v1.y, v1.z, v2.x, v2.y, v2.z);
  }
}
