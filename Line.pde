class Line {
  Vertex v1, v2;
  Line(Vertex v1, Vertex v2) {
    this.v1 = v1;
    this.v2 = v2;
  }
  
  void orthoProjection() {
  	
  }
  void display() {
    line(v1.x, v1.y, v1.z, v2.x, v2.y, v2.z);
  }
}
