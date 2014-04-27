class UI {
    
  Button button1 = new Button(550, -550, 200, 55, 7, "Cube");
  
  UI() {
    stroke(#FF0000);
    line(0, 0, 100, 0);
    line(0, 0, 0, 100);
    
  }
  
  void mouseClickChecker() {
    if (mousePressed && (mouseButton == LEFT)) {
      if ((mouseX>this.button1.x && mouseX<this.button1.x+this.button1.w) 
        && (mouseY>this.button1.y && mouseY<this.button1.y-this.button1.w)) {
        println("click");
      }
    } 
  }
  
  class Button {
    
    Button(int x, int y, int w, int h, int r, String string) {
      this.x = x;
      this.y = y;
      this.w = w;
      this.h = h;
      this.r = r;
      this.string = string;
      
      stroke(#000000);
      rect(x, y, w, h, r);
      textSize(40);
      fill(0, 102, 153);
      text(string, x+5, y+42);     
    }
  }
  
}
  
