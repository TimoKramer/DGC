class Vertex {
  float x, y, z, t; // t is for transformation
  Vertex(float x, float y, float z, float t) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.t = t;
  }
  
  void set(float x, float y, float z, float t) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.t = t;
  }
  
  void display() {
    vertex(x, y, z);
  }
}
